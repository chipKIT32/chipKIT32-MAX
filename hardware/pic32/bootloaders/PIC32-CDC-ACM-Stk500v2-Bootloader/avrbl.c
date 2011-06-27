// *** avrbl.c *****************************************************************
//
// this file implements the main program loop of the PIC32 USB CDC/ACM
// avrdude bootloader that lives entirely in bootflash
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.

#include "main.h"

// our LED interface
#define LEDTRIS  TRISEbits.TRISE0  // RE0
#define LEDLAT  LATEbits.LATE0  // RE0

#if ! INTERRUPT
#define LED_BLINK_LOOPS  100000  // about 4Hz
#else
#define LED_BLINK_LOOPS  200000  // about 4Hz
#endif

// if PRGSWITCH is #defined, we'll use the PRG switch below to control
// bootloader vs application entry on boot; otherwise, we use a 10 second
// timer.
#if PRGSWITCH
// our PRG switch
#define PRGTRIS  TRISEbits.TRISE7  // RE7
#define PRGPORT  PORTEbits.RE7  // RE7

#define AVRBL_LOOPS  0  // forever
#else
#define AVRBL_LOOPS  8000000  // about 10 seconds
#endif

#define AVRBL_DELAY  400000  // about 0.5 seconds

// the stk500v2 state machine states
// see: http://www.atmel.com/dyn/resources/prod_documents/doc2591.pdf
enum {
    STATE_START,
    STATE_GETSEQ,
    STATE_GETMS1,
    STATE_GETMS2,
    STATE_GETTOK,
    STATE_GETDATA,
    STATE_GETCSUM
};

// the stk500v2 constants
#define CMD_SIGN_ON                         0x01
#define CMD_SET_PARAMETER                   0x02
#define CMD_GET_PARAMETER                   0x03
#define CMD_LOAD_ADDRESS                    0x06
#define CMD_ENTER_PROGMODE_ISP              0x10
#define CMD_LEAVE_PROGMODE_ISP              0x11
#define CMD_CHIP_ERASE_ISP                  0x12
#define CMD_PROGRAM_FLASH_ISP               0x13
#define CMD_READ_FLASH_ISP                  0x14
#define CMD_SPI_MULTI                       0x1D

#define STATUS_CMD_OK                       0x00

#define SIGNATURE_BYTES 0x504943

// indicates stk500v2 protocol is active
static volatile bool active;  // bootloader is active
static volatile uint loaded;  // bootloader has loaded
static volatile uint loops;

// indicates flash has been erased
static bool erased;

// stk500v2 request state
static int state = STATE_START;
static byte seq;
static int size;
static byte csum;

// stk500v2 request message
static bool ready;  // request has been received and is ready to process
static int requesti;  // number of request bytes
static byte request[1024];  // request buffer
#define REQUEST_OFFSET  2  // shift request buffer so flash data at byte offset 10 is 32-bit aligned

// stk500v2 reply message
static int replyi;  // number of reply bytes
static byte reply[1024];  // reply buffer

// this function handles the stk500v2 message protocol state machine
void
avrbl_state_machine(byte b)
{
    csum ^= b;

    switch (state) {
        case STATE_START:
            if (b == 27) {
                state = STATE_GETSEQ;
            }
            csum = b;
            break;
        case STATE_GETSEQ:
            seq = b;
            state = STATE_GETMS1;
            break;
        case STATE_GETMS1:
            size = b<<8;
            state = STATE_GETMS2;
            break;
        case STATE_GETMS2:
            size |= b;
            state = STATE_GETTOK;
            break;
        case STATE_GETTOK:
            if (b == 14) {
                requesti = 0;
                state = STATE_GETDATA;
            } else {
                state = STATE_START;
            }
            break;
        case STATE_GETDATA:
            request[REQUEST_OFFSET+requesti++] = b;
            if (requesti == size) {
                state = STATE_GETCSUM;
            }
            break;
        case STATE_GETCSUM:
            if (csum) {
                assert(0);
            } else {
                ready = true;
            }
            state = STATE_START;
            break;
        default:
            ASSERT(0);
            break;
    }
}

// this function receives bytes from the CDC/ACM port
// N.B. if this routine returns false, cdcacm will drop the ball and we'll
// call cdcacm_command_ack() later to pick it up again.
bool
avrbl_receive(const byte *buffer, int length)
{
    int i;

    for (i = 0; i < length; i++) {
        avrbl_state_machine(buffer[i]);
    }

    return true;
}

// this function jumps to the user application if it is present;
// it returns otherwise
void
jump_to_app(void)
{
    if (*(uint *)USER_APP_ADDR != -1) {
#if PRGSWITCH
        // disconnect the USB device from the bus
        usb_uninitialize();
#endif

        // jump to the user application
        ((void(*)(void))USER_APP_ADDR)();
    }
}

// this function sends bytes to the CDC/ACM port
void
avrbl_print(const byte *buffer, int length)
{
    if (cdcacm_attached && cdcacm_active) {
        cdcacm_print(buffer, length);
    }
}

// this function handle an stk500v2 message
void
avrbl_message(byte *request, int size)
{
    uint i;
    uint nbytes;
    uint address;
    int rawi;
    byte raw[64];
    static uint load_address;  // load address for stk500v2 flash read/write operations
    static byte parameters[256];  // track stk500v2 parameters (we ignore them all)

    assert(! replyi);

    // our reply message always starts with the message and status bytes
    reply[replyi++] = *request;
    reply[replyi++] = STATUS_CMD_OK;

    // process the request message and generate additional reply message bytes
    switch (*request) {
        case CMD_SIGN_ON:
            active = true;
            erased = false;
            reply[replyi++] = 8;
            strcpy(reply+replyi, "STK500_2");
            replyi += 8;
            break;
        case CMD_SET_PARAMETER:
            parameters[request[1]] = request[2];
            break;
        case CMD_GET_PARAMETER:
            reply[replyi++] = parameters[request[1]];
            break;
        case CMD_ENTER_PROGMODE_ISP:
            break;
        case CMD_SPI_MULTI:
            reply[replyi++] = 0;
            reply[replyi++] = request[4];
            reply[replyi++] = 0;
            if (request[4] == 0x30) {
                if (request[6] == 0) {
                    reply[replyi++] = (byte)(SIGNATURE_BYTES>>16);
                } else if ( request[6] == 1 ) {
                    reply[replyi++] = (byte)(SIGNATURE_BYTES>>8);
                } else {
                    reply[replyi++] = (byte)SIGNATURE_BYTES;
                }
            } else if ((request[4] == 0x20) || (request[4] == 0x28)) {
                //* read one byte from flash
                //* 0x20 is read odd byte
                //* 0x28 is read even byte

                //* read the even address
                address = (request[5]<<8)|(request[6]);
                //* the address is in 16 bit words
                address = address<<1;

                if (request[4] == 0x20) {
                    reply[replyi++] = *(uint16 *)(FLASH_START+address);
                } else {
                    reply[replyi++] = (*(uint16 *)(FLASH_START+address))>>8;
                }
            } else {
                reply[replyi++] = 0;
            }
            reply[replyi++] = STATUS_CMD_OK;
            break;
        case CMD_CHIP_ERASE_ISP:
            flash_erase_pages((void *)FLASH_START, FLASH_BYTES/FLASH_PAGE_SIZE);
            erased = true;
            break;
        case CMD_LOAD_ADDRESS:
            load_address = (request[1]<<24)|(request[2]<<16)|(request[3]<<8)|(request[4]);
            //* the address is in 16 bit words
            load_address = load_address<<1;
            ASSERT((load_address&3)==0);
            break;
        case CMD_PROGRAM_FLASH_ISP:
            // if somebody forgot to do an erase...
            if (! erased) {
                flash_erase_pages((void *)FLASH_START, FLASH_BYTES/FLASH_PAGE_SIZE);
                erased = true;
            }
            ASSERT(((uintptr)(request+10)&3)==0);
            nbytes = ((request[1])<<8)|(request[2]);
            ASSERT((nbytes&3)==0);
            flash_write_words((uint32 *)(FLASH_START+load_address), (uint32 *)(request+10), nbytes/4);
            load_address += nbytes;
            break;
        case CMD_READ_FLASH_ISP:
            nbytes = ((request[1])<<8)|(request[2]);
            memcpy(reply+replyi, (void *)(FLASH_START+load_address), nbytes);
            replyi += nbytes;
            reply[replyi++] = STATUS_CMD_OK;
            load_address += nbytes;
            break;
        case CMD_LEAVE_PROGMODE_ISP:
            loaded = loops;
            break;
        default:
            ASSERT(0);
            break;
    }

    // send our reply header
    rawi = 0;
    raw[rawi++] = 27;
    raw[rawi++] = seq;
    raw[rawi++] = replyi>>8;
    raw[rawi++] = replyi;
    raw[rawi++] = 14;
    csum = 0;
    for (i = 0; i < rawi; i++) {
        csum ^= raw[i];
    }
    avrbl_print(raw, rawi);

    // send the reply message bytes
    for (i = 0; i < replyi; i++) {
        csum ^= reply[i];
    }
    avrbl_print(reply, replyi);

    // send the reply checksum
    avrbl_print(&csum, 1);

    replyi = 0;
}

// this function implements the main avrdude bootloader program loop.
void
avrbl_run(void)
{    
#if PRGSWITCH
    // configure the PRG switch
    PRGTRIS = 1;

    // if the PRG switch is not pressed...
    if (PRGPORT) {
        // launch the application!
        jump_to_app();
    }
#endif

    // configure the heartbeat LED
    LEDTRIS = 0;

    // forever...
    loops = 0;
    for (;;) {
        // increment our loop counter
        loops++;

        // we don't need this on every single iteration
        if (loops%1000 == 0) {
            // blink the heartbeat LED
            LEDLAT = (loops/LED_BLINK_LOOPS)%2 && ((loops/LED_BLINK_LOOPS)%8<6);

#if ! PRGSWITCH
            // if we've been here too long without stk500v2 becoming active...
            if (loops >= AVRBL_LOOPS && ! active) {
                // launch the application!
                jump_to_app();
            }
#endif

            // if we've loaded the application and had a small delay...
            if (loaded && loops >= loaded+AVRBL_DELAY) {
                // launch the application!
                jump_to_app();
                loaded = false;
            }
        }

#if ! INTERRUPT
        // we poll the USB periodically
        usb_isr();
#endif

        // if we've received an stk500v2 request...
        if (ready) {
            // process it
            avrbl_message(request+REQUEST_OFFSET, requesti);
            ready = false;
        }
    }
}

// this function is called by the CDC/ACM transport when the USB device
// is reset.
static void
avrbl_reset_cbfn(void)
{
}

// this function is called by upper level code to register callback
// functions.
void
avrbl_initialize(void)
{
    cdcacm_register(avrbl_reset_cbfn);
}
