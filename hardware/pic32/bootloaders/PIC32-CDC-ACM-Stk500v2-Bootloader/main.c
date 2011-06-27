// *** main.c ******************************************************************
//
// this is the main program that is launched by crt0.S; it just
// initializes all of the modules of the os and then runs the main
// application program loop.
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.

#include "main.h"

#pragma config UPLLEN   = ON            // USB PLL Enabled
#pragma config FPLLMUL  = MUL_20        // PLL Multiplier
#pragma config UPLLIDIV = DIV_2         // USB PLL Input Divider
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider
#pragma config FPLLODIV = DIV_1         // PLL Output Divider
#pragma config FPBDIV   = DIV_1         // Peripheral Clock divisor
#pragma config FWDTEN   = OFF           // Watchdog Timer 
#pragma config WDTPS    = PS1           // Watchdog Timer Postscale
#pragma config FCKSM    = CSDCMD        // Clock Switching & Fail Safe Clock Monitor
#pragma config OSCIOFNC = OFF           // CLKO Enable
#pragma config POSCMOD  = HS            // Primary Oscillator
#pragma config IESO     = OFF           // Internal/External Switch-over
#pragma config FSOSCEN  = OFF           // Secondary Oscillator Enable
#pragma config FNOSC    = PRIPLL        // Oscillator Selection
#pragma config CP       = OFF           // Code Protect
#pragma config BWP      = OFF           // Boot Flash Write Protect
#pragma config PWP      = OFF           // Program Flash Write Protect
#pragma config ICESEL   = ICS_PGx2      // ICE/ICD Comm Channel Select
#pragma config DEBUG    = OFF           // Debugger Disabled for Starter Kit

uint32 cpu_frequency;
uint32 oscillator_frequency;
uint32 bus_frequency;

void _general_exception_context(void)
{
    asm_halt();
}

void _bootstrap_exception_handler(void)
{
    asm_halt();
}

int
main()  // we're called directly by startup.c
{
    int x;

    byte *p;
    extern unsigned char _data_image_begin[];

    SYSTEMConfig(80000000L, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
    INTEnableSystemMultiVectoredInt();
#if ! DEBUGGING
    DDPCON = 0;  // disable JTAG
#endif

    // slow us down
    // N.B. we can't rely on config bits since the bootloader sets them differently
    SYSKEY = 0xAA996655; // Write Key1 to SYSKEY
    SYSKEY = 0x556699AA; // Write Key2 to SYSKEY
    OSCCONbits.PBDIV = 1;
    SYSKEY = 0;

    cpu_frequency = 80000000;
    oscillator_frequency = 8000000;
    bus_frequency = 40000000;

    assert(sizeof(byte) == 1);
    assert(sizeof(uint16) == 2);
    assert(sizeof(uint32) == 4);

    // initialize usb
    usb_initialize();

    // initialize the application
    avrbl_initialize();

    // run the main application program loop
    avrbl_run();

    ASSERT(0);  // stop!
    return 0;
}

