/************************************************************************/
/*                                                                      */
/*  SoftwareSerial.cpp --   Main file for Software Serial library       */
/*                                                                      */
/************************************************************************/
/*  Author: Brian Schmalz                                               */
/*  Copyright 2015, Schmalz Haus LLC. All rights reserved               */
/************************************************************************/
/*  File Description:                                                   */
/*                                                                      */
/* Header file for Software Serial library.                             */
/*                                                                      */
/* This code is based on earlier work:                                  */
/*      Copyright (c) 2014, Matt Jenkins, Majenko Technology            */
/*      Copyright (c) 2005, 2006 by David A. Mellis                     */
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*  05/16/2015(BrianS): Re-written to better imitate existing Arduino   */
/*  software serial library. Used some existing code from Arduino       */
/*  as well as quite a bit of code from Matt Jenkins Change Notification*/
/*  library and Timer Serial library.                                   */
/*                                                                      */
/************************************************************************/
//* This library is free software; you can redistribute it and/or
//* modify it under the terms of the GNU Lesser General Public
//* License as published by the Free Software Foundation; either
//* version 2.1 of the License, or (at your option) any later version.
//* 
//* This library is distributed in the hope that it will be useful,
//* but WITHOUT ANY WARRANTY; without even the implied warranty of
//* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//* Lesser General Public License for more details.
//* 
//* You should have received a copy of the GNU Lesser General
//* Public License along with this library; if not, write to the
//* Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//* Boston, MA  02111-1307  USA
/************************************************************************/

/// TODO list in priority order
/// For PPC PIC32s, keep track of which CN INT vectors really need to be enabled
/// Handle listen properly
/// Comment all functions properly
/// Allow initializer to specify receive buffer size (test)
/// For slower baud rates (at what baud rate?), keep interrupts on, use core 
///    timer to sample RX bit rather than tie up CPU for entire byte with 
///    interrupts off. Or possibly just use CN interrupt to measure time between
///    transitions, and CoreTimer as timeout if no transitions. 
/// Use consistent function and variable naming scheme
/// Handle buffer overflow properly - meaning add an 'overflow_clear' function, 
///    and have overflow() function not clear _RX_overflow_error.
/// Add stop bit detection and error detection, and stop bit reporting function
/// Handle inverted bits properly

/******************************************************************************
 * Includes
 ******************************************************************************/

#include "WConstants.h"
#include "SoftwareSerial.h"
#include <stdint.h>
#include <p32xxxx.h>
#include <sys/attribs.h>


/******* DEBUG ************/
// Uncomment next line to enablel debug I/O for logic analzyer timing analysis
//#define SSDEBUG
#if defined(SSDEBUG)
    #if defined(_BOARD_FUBARINO_SD_)
        #define DEBUG0_LOW  TRISDbits.TRISD8 = 0; LATDbits.LATD8 = 0;
        #define DEBUG0_HIGH TRISDbits.TRISD8 = 0; LATDbits.LATD8 = 1;
        #define DEBUG1_LOW  TRISDbits.TRISD9 = 0; LATDbits.LATD9 = 0;
        #define DEBUG1_HIGH TRISDbits.TRISD9 = 0; LATDbits.LATD9 = 1;
        #define DEBUG2_LOW  TRISDbits.TRISD10 = 0; LATDbits.LATD10 = 0;
        #define DEBUG2_HIGH TRISDbits.TRISD10 = 0; LATDbits.LATD10 = 1;
        #define DEBUG3_LOW  TRISDbits.TRISD11 = 0; LATDbits.LATD11 = 0;
        #define DEBUG3_HIGH TRISDbits.TRISD11 = 0; LATDbits.LATD11 = 1;
        #define DEBUG4_LOW  TRISDbits.TRISD0 = 0; LATDbits.LATD0 = 0;
        #define DEBUG4_HIGH TRISDbits.TRISD0 = 0; LATDbits.LATD0 = 1;
        #define DEBUG5_LOW  TRISCbits.TRISC13 = 0; LATCbits.LATC13 = 0;
        #define DEBUG5_HIGH TRISCbits.TRISC13 = 0; LATCbits.LATC13 = 1;
        #define DEBUG6_LOW  TRISCbits.TRISC14 = 0; LATCbits.LATC14 = 0;
        #define DEBUG6_HIGH TRISCbits.TRISC14 = 0; LATCbits.LATC14 = 1;
        #define DEBUG7_LOW  TRISDbits.TRISD1 = 0; LATDbits.LATD1 = 0;
        #define DEBUG7_HIGH TRISDbits.TRISD1 = 0; LATDbits.LATD1 = 1;
    #elif defined(_BOARD_FUBARINO_MINI_)
        #define DEBUG0_LOW  TRISBbits.TRISB13 = 0; LATBbits.LATB13 = 0;
        #define DEBUG0_HIGH TRISBbits.TRISB13 = 0; LATBbits.LATB13 = 1;
        #define DEBUG1_LOW  TRISAbits.TRISA10 = 0; LATAbits.LATA10 = 0;
        #define DEBUG1_HIGH TRISAbits.TRISA10 = 0; LATAbits.LATA10 = 1;
        #define DEBUG2_LOW  TRISAbits.TRISA7 = 0; LATAbits.LATA7 = 0;
        #define DEBUG2_HIGH TRISAbits.TRISA7 = 0; LATAbits.LATA7 = 1;
        #define DEBUG3_LOW  TRISBbits.TRISB14 = 0; LATBbits.LATB14 = 0;
        #define DEBUG3_HIGH TRISBbits.TRISB14 = 0; LATBbits.LATB14 = 1;
        #define DEBUG4_LOW  TRISBbits.TRISB15 = 0; LATBbits.LATB15 = 0;
        #define DEBUG4_HIGH TRISBbits.TRISB15 = 0; LATBbits.LATB15 = 1;
        #define DEBUG5_LOW  TRISAbits.TRISA0 = 0; LATAbits.LATA0 = 0;
        #define DEBUG5_HIGH TRISAbits.TRISA0 = 0; LATAbits.LATA0 = 1;
        #define DEBUG6_LOW  TRISAbits.TRISA1 = 0; LATAbits.LATA1 = 0;
        #define DEBUG6_HIGH TRISAbits.TRISA1 = 0; LATAbits.LATA1 = 1;
        #define DEBUG7_LOW  TRISBbits.TRISB0 = 0; LATBbits.LATB0 = 0;
        #define DEBUG7_HIGH TRISBbits.TRISB0 = 0; LATBbits.LATB0 = 1;
    #else
        #error No board defined for debug in SoftwareSerial.cpp
    #endif
#else
    #define DEBUG0_LOW
    #define DEBUG0_HIGH
    #define DEBUG1_LOW
    #define DEBUG1_HIGH
    #define DEBUG2_LOW
    #define DEBUG2_HIGH
    #define DEBUG3_LOW
    #define DEBUG3_HIGH
    #define DEBUG4_LOW
    #define DEBUG4_HIGH
    #define DEBUG5_LOW
    #define DEBUG5_HIGH
    #define DEBUG6_LOW
    #define DEBUG6_HIGH
    #define DEBUG7_LOW
    #define DEBUG7_HIGH
#endif

/**************************/

/******************************************************************************
 * Statics
 ******************************************************************************/
/// TODO: Is this really needed anymore?
SoftwareSerial *SoftwareSerial::active_object = NULL;
bool SoftwareSerial::_CN_ISR_hooked = false;
SoftwareSerial *SoftwareSerial::CN_list_head = NULL;

/******************************************************************************
 * Definitions
 ******************************************************************************/

// Amount of CoreTimer ticks to subtract from 'ideal' bit time to compensate for
// overhead code.
#if (F_CPU < 80000000)      // Slower than 80MHz
    #if defined(SSDEBUG)
        #define EXTRA_RX_BIT_TIME       (-24)
        #define EXTRA_RX_START_BIT_TIME (-24)
        #define EXTRA_TX_BIT_TIME       (-18)
    #else
        #define EXTRA_RX_BIT_TIME       (-12)
        #define EXTRA_RX_START_BIT_TIME (-12)
        #define EXTRA_TX_BIT_TIME       (-11)
    #endif
 #elif (F_CPU > 80000000)    // Faster than 80MHz
    #if defined(SSDEBUG)
        #define EXTRA_RX_BIT_TIME       (-28)
        #define EXTRA_RX_START_BIT_TIME (-32)
        #define EXTRA_TX_BIT_TIME       (-20)
    #else
        #define EXTRA_RX_BIT_TIME       (-28)
        #define EXTRA_RX_START_BIT_TIME (-32)
        #define EXTRA_TX_BIT_TIME       (-20)
    #endif
#else                       // At 80MHz
    #if defined(SSDEBUG)
        #define EXTRA_RX_BIT_TIME       (-28)
        #define EXTRA_RX_START_BIT_TIME (-32)
        #define EXTRA_TX_BIT_TIME       (-20)
    #else
        #define EXTRA_RX_BIT_TIME       (-28)
        #define EXTRA_RX_START_BIT_TIME (-32)
        #define EXTRA_TX_BIT_TIME       (-20)
    #endif
#endif

/******************************************************************************
 * Constructors
 ******************************************************************************/

SoftwareSerial::SoftwareSerial(uint8_t receivePin, uint8_t transmitPin, bool inverted_logic /* = false */)
{
    // Detect if this pin is on a Change Notification or not and record it's CN number if so
#if !defined(__PIC32_PPS__)
    if (is_pin_a_CN(receivePin, &(this->_CN_bitmask)))
#else
    if (is_pin_a_CN(receivePin, NULL))
#endif    
    {
        _on_CN_pin = true;
        addCN();
    }
    else 
    {
        _on_CN_pin = false;
    }
    _inverted_logic = inverted_logic;
    _receivePin = receivePin;
    _transmitPin = transmitPin;
    _baudRate = 0;
    _have_start_bit_time = false;
    active_object = this;
}

SoftwareSerial::~SoftwareSerial()
{
    end();
}

/******************************************************************************
 * Private functions
 ******************************************************************************/

 /*
 * ISR function called whenever any Change Notification pins change state.
 */
void __attribute__((interrupt)) ChangeNotificationISR() 
{
DEBUG5_HIGH
    // Call the static function that handles all of the CN logic, pass in the current time
    SoftwareSerial::handleChangeNotificationISR(readCoreTimer());
DEBUG5_LOW
    // Clearing the interrupt flag is handled in the above function for PPC CPUs
#if !defined(__PIC32_PPS__)
    IFS1bits.CNIF = 0;
#endif
}

/*
 * Look at what's in the SoftwareSerial object obj, and find out if the RX pin that
 * it points to is set or cleared. Also take into account the _inverted_logic setting.
 */
bool SoftwareSerial::ReadBit(SoftwareSerial* obj)
{
    bool retval;
    
    retval = (obj->_rxPort->port.reg & obj->_rxBit);
    if (obj->_inverted_logic)
    {
        retval = !retval;
    }
    if (retval)
    {
DEBUG3_HIGH
    }
    else
    {
DEBUG3_LOW
    }
    return retval;
}

/*
 * This function will look at the current state of the RX bit, and compare it to 
 * the previous know state, and see if it has changed.
 * /// TODO: This should cache reads of each port on non-PPS PIC32s somehow so we 
 * don't end up reading port more than once for a given ISR call.
 * /// TODO: On PPS PIC32, use CNSTAT register to help with this
 */
bool SoftwareSerial::RXBitHasChanged(SoftwareSerial* obj)
{
    uint8_t state;
    
    state = ReadBit(obj);
    if (state != obj->_last_RX_pin_state)
    {
        obj->_last_RX_pin_state = state;
        return true;
    }
    return false;
}

/*
 * Change Notification Interrupt Service Handler
 * We need to walk through all of the RX serial pins that are on CN pins
 * to see which ones changed. For any that changed, we call the read() function
 * to read in a new byte, and store it in the RX buffer.
 * We also wait around a little bit at the end of the byte to see if there is another
 * byte coming in back-to-back. If so, we start reading that byte right away rather than
 * leaving the ISR and coming back in. This allows for more reliable data reception at
 * higher baud rates.
 */
void SoftwareSerial::handleChangeNotificationISR(uint32_t start_bit_time) 
{
    int32_t     rx_byte;
    uint32_t    bit_time_core_ticks;
    uint32_t    bit_end_time;
    bool        done = false;
    SoftwareSerial * serial_obj = SoftwareSerial::CN_list_head;
    uint32_t    st;

    // To minimize the chance of missing edges at high baud rates, we kill all interrupts
    st = disableInterrupts();

    // Traverse the linked list of serial objects that use CN pins for their RX.
    while (serial_obj)
    {
DEBUG2_HIGH
        // Has there been a change since last time through?
        if (RXBitHasChanged(serial_obj))
        {
            // Now that we know this bit has changed AND it is enabled for CN, (because 
            // it's in the CN linked list) save off it's SoftwareSerial object's start 
            // bit time from when we were called.
            serial_obj->_start_bit_time = start_bit_time;
            serial_obj->_have_start_bit_time = true;
            // Loop, reading bytes, until there isn't another byte to read in
            while (!done) 
            {
                // Read the whole byte in using the normal routine
                rx_byte = serial_obj->readByte();

                // If there is still room in the RX buffer, then:
                if (!serial_obj->_rxBuffer->full())
                {
                    // Save the byte off into the buffer
                    serial_obj->_rxBuffer->write(rx_byte);

                    // We wait for 1 bit time looking for an IDLE to ASSERTED state (indicating the
                    // front edge of the start bit). If we see one, then this RX channel has more
                    // data coming back to back with the previous byte, and needs to be handled right
                    // away.
                    done = true;
                    bit_end_time = readCoreTimer() + serial_obj->_OneBitTime + EXTRA_RX_BIT_TIME;
                    while (readCoreTimer() < bit_end_time) {
DEBUG4_HIGH
                        if (ReadBit(serial_obj) == LOW) 
                        {
                            done = false;
                            // Save off the starting time of this start bit
                            serial_obj->_start_bit_time = readCoreTimer() + 20; // Small fudge factor
                            // Flag that we have a valid start bit timestamp
                            serial_obj->_have_start_bit_time = true;
DEBUG4_LOW
                            break;
                        }
DEBUG4_LOW
                    }
                }
                else
                {
                    done = true;
                }
            }
            // Use this to record the latest state of the bit for next time CN fires
            RXBitHasChanged(serial_obj);
            
            // For PPC CPUs, we need to clear the CN interrupt flag. But how to know
            // which one to clear? Look to see what port our RX bit is on.
#if defined(__PIC32_PPS__)
    #if defined(_PORTA)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELA)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_A_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_A_VECTOR);
        #endif
                }
    #endif
    #if defined(_PORTB)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELB)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_B_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_B_VECTOR);
        #endif
            }
    #endif
    #if defined(_PORTC)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELC)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_C_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_C_VECTOR);
        #endif
            }
    #endif
    #if defined(_PORTD)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELD)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_D_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_D_VECTOR);
        #endif
            }
    #endif
    #if defined(_PORTE)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELE)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_E_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_E_VECTOR);
        #endif
            }
    #endif
    #if defined(_PORTF)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELF)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_F_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_F_VECTOR);
        #endif
            }
    #endif
    #if defined(_PORTG)
            if ((volatile unsigned int *)serial_obj->_rxPort == &ANSELG)
            {
        #if !defined(__PIC32MZXX__)
                clearIntFlag(_CHANGE_NOTICE_G_IRQ);
        #else
                clearIntFlag(_CHANGE_NOTICE_G_VECTOR);
        #endif
            }
    #endif
#endif
        }
        
        // Advance to the next object in the linked list CN chain
        serial_obj = serial_obj->next_CN;
        
DEBUG2_LOW
DEBUG4_LOW
    }
    restoreInterrupts(st);
}

/*
 * Detect if 'pin' is on a Change Notification input or not.
 * 'pin' is an Arduino pin number. And unfortunately there is
 * no way to 'look up' if an Arduino pin is on a CN or not.
 * So the hack here is that we walk through all of the CN_table[]
 * array looking for a port pointer match and a pin match. If we find
 * one, then we know that this pin is on a CN, and can return true.
 */
bool SoftwareSerial::is_pin_a_CN(uint8_t pin, uint32_t * CN_bitmask)
{
#if defined(__PIC32_PPS__)
    // All pins are CN pins on PPS PIC32s
    return true;
#else
    uint8_t i;
    
    for (i = 0; i < NUM_CN; i++) 
    {
        if (
            (digital_pin_to_port_PGM[pin] == CN_table[i].port_index)
            &&
            (digital_pin_to_bit_mask_PGM[pin] == CN_table[i].bit_mask)
        )
        {
            *CN_bitmask = 1 << i;
            return true;
        }
    }
    return false;
#endif
}

/*
 * The real worker function of the library. This function reads in a byte from an arbitrary 
 * GPIO pin. It gets called from one of two places. If the sketch calls read() and the RX pin
 * is not a CN pin, then this function will sit and block until a byte is read in on the RX pin.
 * The other way it gets called is if the RX pin is a CN pin, and a start bit happens, triggering
 * the CN ISR, then this function gets called to read in the byte that just started appearing on the
 * RX pin. It disables interrupts to get accurate timing.
 */ 
int32_t SoftwareSerial::readByte()
{    
    int32_t     retval = 0;
    uint32_t    st;
    uint32_t    bit_end_time;

DEBUG0_HIGH
            
    if (_baudRate == 0)
    {
        _have_start_bit_time = false;
DEBUG0_LOW
        return -1;
    }

DEBUG1_HIGH

    // Wait for start bit if we have not already detected the beginning of the start bit
    if (!_have_start_bit_time) 
    {
        /// TODO: Also, there should be a timeout on this so we don't wait forever.
        while (ReadBit(this) == HIGH);
    }

    // We always have to disable interrupts to get our timing right. This SUCKS for
    // slower baud rates, as sending a back-to-back message will tie up the CPU for 
    // a really long time.
    st = disableInterrupts();

    // confirm that this is a real start bit, not line noise
    if (ReadBit(this) == LOW) 
    {
        // frame start indicated by a falling edge and low start bit
        // jump to the middle of the low start bit

DEBUG1_HIGH
        if (_have_start_bit_time) 
        {
            // If we're getting called from the CN ISR, then we already have the start
            // time of the start bit in _start_bit_time.
            bit_end_time = _start_bit_time + (_OneBitTime / 2) + EXTRA_RX_START_BIT_TIME;
            /// TODO: Do we need to check for bit_end_time being less than _start_bit_time here?
        }
        else 
        {
            // Need to make this one a big shorter to compensate for the if() above
            bit_end_time = readCoreTimer() + (_OneBitTime / 2) + EXTRA_RX_START_BIT_TIME;
        }
        while (readCoreTimer() < bit_end_time);

DEBUG1_LOW
        // offset of the bit in the byte: from 0 (LSB) to 7 (MSB)
        for (int offset = 0; offset < 8; offset++) 
        {
            // jump to middle of next bit
            bit_end_time = readCoreTimer() + _OneBitTime + EXTRA_RX_BIT_TIME;
            while (readCoreTimer() < bit_end_time);
DEBUG1_HIGH
            // read bit
            retval |= ReadBit(this) << offset;
DEBUG1_LOW
        }

        // Wait for 1 more bit time and then check for a stop bit
        bit_end_time = readCoreTimer() + _OneBitTime + EXTRA_RX_BIT_TIME;
        while (readCoreTimer() < bit_end_time);
DEBUG1_HIGH
        /// Make sure that stop bit is really asserted
        if (ReadBit(this) == LOW) 
        {
            _invalid_stop_bit = true;
        }   
DEBUG1_LOW
    }
    else 
    {
        // If we did not see a real low for a start bit, then this is an error
        retval = -1;
    }

    restoreInterrupts(st);

    _have_start_bit_time = false;

DEBUG1_LOW
DEBUG0_LOW

    return retval;
}

/*
 * Add this Software Serial object into the linked list of objects that use Change Notification pins.
 * If this is the first, then just update the static head pointer.
 * Otherwise, walk through the list, and add this one at the end.
 */
void SoftwareSerial::addCN(void)
{
    SoftwareSerial *scan;
    
    if (SoftwareSerial::CN_list_head == NULL)
    {
        SoftwareSerial::CN_list_head = this;
        next_CN = NULL;
    }
    else
    {
        for (scan = SoftwareSerial::CN_list_head; scan->next_CN; scan = scan->next_CN)
        {
        }
        scan->next_CN = this;
        next_CN = NULL;
    }
}

/*
 * Remove this Software Serial object from the linked list of objects that use Change Notification pins.
 */
void SoftwareSerial::removeCN(void)
{
    /// TODO
}


/******************************************************************************
 * Public functions
 ******************************************************************************/

/*
 * /// TODO
 */ 
bool SoftwareSerial::listen()
{
  return false;
}

/*
 * /// TODO
 */ 
bool SoftwareSerial::stopListening()
{
    return false;
}

/*
 * Start things up on this serial object with the default RX buffer size 
 * (only applies if this pin is a CN pin)
 */ 
void SoftwareSerial::begin(long speed)
{
    begin(speed, TS_BUFSZ);
}

/*
 * The real begin function. Takes a baud rate (same for RX and TX) and a RX buffer size.
 * RX buffer size is only used if the RX pin is on a Change Notification pin.
 */ 
void SoftwareSerial::begin(long speed, uint32_t RX_buffer_size)
{
    uint8_t     port;
    uint32_t    st;
    int32_t     x;
    int32_t     s;
    uint32_t    bit_end_time;

    // We need a new circular buffer object only if we're a CN pin
    if (_on_CN_pin) {
        _rxBuffer = new CircularBuffer(_rxBufferArray, RX_buffer_size);
    }
    
    _baudRate = speed;
    _OneBitTime =  ((F_CPU/2)/_baudRate);
    
    pinMode(_receivePin, INPUT);
    pinMode(_transmitPin, OUTPUT);
    digitalWrite(_transmitPin, HIGH);

    // Wait for at least 2 bit times with the TX pin high, so that our
    // receiver knows this is the normal state of the line.
    bit_end_time = readCoreTimer() + _OneBitTime * 2;
    while (readCoreTimer() < bit_end_time);

    if ((port = digitalPinToPort(_receivePin)) == NOT_A_PIN) 
    {
        return;
    }
    _rxPort = (p32_ioport *)portRegisters(port);
    _rxBit = digitalPinToBitMask(_receivePin);

    if ((port = digitalPinToPort(_transmitPin)) == NOT_A_PIN) 
    {
        return;
    }
    _txPort = (p32_ioport *)portRegisters(port);
    _txBit = digitalPinToBitMask(_transmitPin);


    // If this is an RX pin on a Change Interrupt pin, turn on the Change Notification interrupt
    /// Note: This will clobber any other library's use of Change Notification interrupt
    if (_on_CN_pin) 
    {
/// TODO: Make this a function call to asbtract out the CPU differences
#if !defined(__PIC32_PPS__)
        // Enable the change notification bit (this was set in contstructor)
        CNENSET = _CN_bitmask;
#else
    #if defined(_PORTA)
        CNCONAbits.ON = 1;
    #endif
    #if defined(_PORTB)
        CNCONBbits.ON = 1;
    #endif
    #if defined(_PORTC)
        CNCONCbits.ON = 1;
    #endif
    #if defined(_PORTD)
        CNCONDbits.ON = 1;
    #endif
    #if defined(_PORTE)
        CNCONEbits.ON = 1;
    #endif
    #if defined(_PORTF)
        CNCONFbits.ON = 1;
    #endif
    #if defined(_PORTG)
        CNCONGbits.ON = 1;
    #endif

    #if defined(_PORTA)
        CNCONAbits.SIDL = 0;
    #endif
    #if defined(_PORTB)
        CNCONBbits.SIDL = 0;
    #endif
    #if defined(_PORTC)
        CNCONCbits.SIDL = 0;
    #endif
    #if defined(_PORTD)
        CNCONDbits.SIDL = 0;
    #endif
    #if defined(_PORTE)
        CNCONEbits.SIDL = 0;
    #endif
    #if defined(_PORTF)
        CNCONFbits.SIDL = 0;
    #endif
    #if defined(_PORTG)
        CNCONGbits.SIDL = 0;
    #endif

        // On PPS PIC32s, we just set the proper bit in the proper I/O port's CNEN
        _rxPort->cnen.set = _rxBit;
        // And turn on that port's CN functionality
        _rxPort->cncon.reg = 0x8000;    // 'ON' bit in CNCONx register
        // Do we need to read the whole port here?
        volatile int tmp = _rxPort->port.reg;
#endif
    
        // Record the current state of this change notification pin (clears mismatch too)
        _last_RX_pin_state = ReadBit(this); 

        if (!SoftwareSerial::_CN_ISR_hooked)
        {
#if !defined(__PIC32MZXX__)     // MX parts only have one CN vector
            // Configure the change notification interrupt vector
            setIntVector(_CHANGE_NOTICE_VECTOR, ChangeNotificationISR);
            // Configure the change notification priority and sub-priority
            setIntPriority(_CHANGE_NOTICE_VECTOR, 4, 0);
#else                           // MZ parts have one vector for each CN port
            // Configure the change notification interrupt vector
        #if defined(_PORTA)
            setIntVector(_CHANGE_NOTICE_A_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTB)
            setIntVector(_CHANGE_NOTICE_B_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTC)
            setIntVector(_CHANGE_NOTICE_C_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTD)
            setIntVector(_CHANGE_NOTICE_D_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTE)
            setIntVector(_CHANGE_NOTICE_E_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTF)
            setIntVector(_CHANGE_NOTICE_F_VECTOR, ChangeNotificationISR);
        #endif
        #if defined(_PORTG)
            setIntVector(_CHANGE_NOTICE_G_VECTOR, ChangeNotificationISR);
        #endif

            // Configure the change notification priority and sub-priority
        #if defined(_PORTA)
            setIntPriority(_CHANGE_NOTICE_A_VECTOR, 4, 0);
        #endif
        #if defined(_PORTB)
            setIntPriority(_CHANGE_NOTICE_B_VECTOR, 4, 0);
        #endif
        #if defined(_PORTC)
            setIntPriority(_CHANGE_NOTICE_C_VECTOR, 4, 0);
        #endif
        #if defined(_PORTD)
            setIntPriority(_CHANGE_NOTICE_D_VECTOR, 4, 0);
        #endif
        #if defined(_PORTE)
            setIntPriority(_CHANGE_NOTICE_E_VECTOR, 4, 0);
        #endif
        #if defined(_PORTF)
            setIntPriority(_CHANGE_NOTICE_F_VECTOR, 4, 0);
        #endif
        #if defined(_PORTG)
            setIntPriority(_CHANGE_NOTICE_G_VECTOR, 4, 0);
        #endif
#endif
            
            
#if !defined(__PIC32_PPS__)     // Non-PPS MX parts
            // Clear the change notification interrupt flag
            clearIntFlag(_CHANGE_NOTICE_IRQ);
            // And finally enable the change notification interrupt
            setIntEnable(_CHANGE_NOTICE_IRQ);
#else
    #if !defined(__PIC32MZXX__) // PPS MX parts
            // Clear the change notification interrupt flag
        #if defined(_PORTA)
            clearIntFlag(_CHANGE_NOTICE_A_IRQ);
        #endif
        #if defined(_PORTB)
            clearIntFlag(_CHANGE_NOTICE_B_IRQ);
        #endif
        #if defined(_PORTC)
            clearIntFlag(_CHANGE_NOTICE_C_IRQ);
        #endif
        #if defined(_PORTD)
            clearIntFlag(_CHANGE_NOTICE_D_IRQ);
        #endif
        #if defined(_PORTE)
            clearIntFlag(_CHANGE_NOTICE_E_IRQ);
        #endif
        #if defined(_PORTF)
            clearIntFlag(_CHANGE_NOTICE_F_IRQ);
        #endif
        #if defined(_PORTG)
            clearIntFlag(_CHANGE_NOTICE_G_IRQ);
        #endif

            // And finally enable the change notification interrupt
        #if defined(_PORTA)
            setIntEnable(_CHANGE_NOTICE_A_IRQ);
        #endif
        #if defined(_PORTB)        
            setIntEnable(_CHANGE_NOTICE_B_IRQ);
        #endif
        #if defined(_PORTC)
            setIntEnable(_CHANGE_NOTICE_C_IRQ);
        #endif
        #if defined(_PORTD)
            setIntEnable(_CHANGE_NOTICE_D_IRQ);
        #endif
        #if defined(_PORTE)
            setIntEnable(_CHANGE_NOTICE_E_IRQ);
        #endif
        #if defined(_PORTF)
            setIntEnable(_CHANGE_NOTICE_F_IRQ);
        #endif
        #if defined(_PORTG)
            setIntEnable(_CHANGE_NOTICE_G_IRQ);
        #endif
    #else                       // MZ parts
            // Clear the change notification interrupt flag
        #if defined(_PORTA)
            clearIntFlag(_CHANGE_NOTICE_A_VECTOR);
        #endif
        #if defined(_PORTB)
            clearIntFlag(_CHANGE_NOTICE_B_VECTOR);
        #endif
        #if defined(_PORTC)
            clearIntFlag(_CHANGE_NOTICE_C_VECTOR);
        #endif
        #if defined(_PORTD)
            clearIntFlag(_CHANGE_NOTICE_D_VECTOR);
        #endif
        #if defined(_PORTE)
            clearIntFlag(_CHANGE_NOTICE_E_VECTOR);
        #endif
        #if defined(_PORTF)
            clearIntFlag(_CHANGE_NOTICE_F_VECTOR);
        #endif
        #if defined(_PORTG)
            clearIntFlag(_CHANGE_NOTICE_G_VECTOR);
        #endif

            // And finally enable the change notification interrupt
        #if defined(_PORTA)
            setIntEnable(_CHANGE_NOTICE_A_VECTOR);
        #endif
        #if defined(_PORTB)
            setIntEnable(_CHANGE_NOTICE_B_VECTOR);
        #endif
        #if defined(_PORTC)
            setIntEnable(_CHANGE_NOTICE_C_VECTOR);
        #endif
        #if defined(_PORTD)
            setIntEnable(_CHANGE_NOTICE_D_VECTOR);
        #endif
        #if defined(_PORTE)
            setIntEnable(_CHANGE_NOTICE_E_VECTOR);
        #endif
        #if defined(_PORTF)
            setIntEnable(_CHANGE_NOTICE_F_VECTOR);
        #endif
        #if defined(_PORTG)
            setIntEnable(_CHANGE_NOTICE_G_VECTOR);
        #endif
    #endif
#endif
            
#if !defined(__PIC32_PPS__)
            // Turn the whole change notification system on
            // Set change notification so CPU idle state does not affect it
            CNCONbits.ON    =   1;
            CNCONbits.SIDL  =   0;
#endif            
            // Mark the ISR as set up so that we don't try to do it again
            SoftwareSerial::_CN_ISR_hooked = true;
        }
    }

    listen();
}

/*
 * We're done with this serial object, so cancel the Change Notification on it's RX
 * pin (if any) and then stop listening on this RX pin.
 */ 
void SoftwareSerial::end()
{
    if (_on_CN_pin) {
#if !defined(__PIC32_PPS__)
        CNEN &= _CN_bitmask;
#else
        _rxPort->cnen.clr = _rxBit;
        // If there are no more bits on this port using CN, then turn off CN for this port
        if (_rxPort->cnen.reg == 0x0000)
        {
            _rxPort->cncon.reg = 0x0000;
        }
#endif
    }
    removeCN();
    stopListening();
}

/*
 * Read a byte from the RX pin.
 * If this RX pin is on a CN, then read from the RX buffer. If not (it's just a normal
 * GPIO pin) then block and read a byte from the RX pin.
 */ 
int SoftwareSerial::read(void)
{
    if (_on_CN_pin) 
    {
        return _rxBuffer->read(); 
    }
    else 
    {
        return readByte();
    }
}

/*
 * This version of the available() function takes a timeout argument in milliseconds.
 * The idea is to use this version with an RX pin that's not on a Change Notification
 * pin. Since available() (without a timeout) will always return 1, and most likely then
 * you'll just go read() (which will wait forever). But if you call this version with 
 * a timeout, then available() will wait up to timeout_ms milliseconds for a byte to come
 * in on the RX pin. If it does, then it will return 1. If it does not (in that time) then
 * it will return 0.
 */
int SoftwareSerial::available(uint32_t timeout_ms) 
{
    uint32_t end_time_ms = millis() + timeout_ms;

    /// TODO: Is this math OK for millis() rollovers? I don't think so . . .
    while (end_time_ms > millis())
    {
        // Do we have a start bit?
        if ((_rxPort->port.reg & _rxBit ? HIGH : LOW) == LOW) 
        {
            // Save off the starting time of this start bit
            _start_bit_time = readCoreTimer();
            _have_start_bit_time = true;
            // Indicate to the caller that we have a byte to read (in progress)
            return 1;
        }
    }
    
    // If we make it this far, then we never saw a start bit
    return 0;
}

/*
 * Return the number of bytes of data currently in the RX buffer.
 * This only really applies to pins that are CN pins (for RX), because
 * non-CN pins don't use an RX buffer. We return 1 if we are on a non-CN
 * RX pin because we want the sketch to think that there is a byte ready to 
 * read so that it goes and calls read() to read the byte (even if there is none
 * currently coming in.)
 */ 
int SoftwareSerial::available()
{
    if (_on_CN_pin) 
    {
        return _rxBuffer->available();
    }
    else 
    {
        return 1;
    }
}

/*
 * Take a byte 'b' and bit-bang it out on the TX pin.
 * This function blocks until the byte is all the way transmitted. There is no buffering.
 * Interrupts are disabled for the entire time the byte is being sent out.
 * Since we always send one byte, we always return a 1.
 */ 
size_t SoftwareSerial::write(uint8_t b)
{
    uint32_t    st;
    uint32_t    bit_end_time;
#if defined(__PIC32_PPS__)
    uint32_t    IntEnableA, IntEnableB, IntEnableC, IntEnableD, IntEnableE, IntEnableF, IntEnableG;
#endif

DEBUG0_HIGH
        
    byte mask;

    if (_baudRate == 0)
    {
DEBUG0_LOW
        return 0;
    }
  
    // If any software serial objects are on CN pins (for RX) then disable the CN interrupts
    // while we are transmitting. We have interrupts disabled anyway, so we can't service
    // any RXing during transmit. And things tend to get confused if we leave the CN on.
    if(_CN_ISR_hooked == true)
    {
#if !defined(__PIC32_PPS__)
        CNCONbits.ON    =   0;
#else
        // The right thing is to only disable those CNxIE bits that we're actually using
        // Then remember that and restore them when we're done.
    #if !defined(__PIC32MZXX__)
        #if defined(_PORTA)
        IntEnableA = clearIntEnable(_CHANGE_NOTICE_A_IRQ);
        #endif
        #if defined(_PORTB)
        IntEnableB = clearIntEnable(_CHANGE_NOTICE_B_IRQ);
        #endif
        #if defined(_PORTC)
        IntEnableC = clearIntEnable(_CHANGE_NOTICE_C_IRQ);
        #endif
        #if defined(_PORTD)
        IntEnableD = clearIntEnable(_CHANGE_NOTICE_D_IRQ);
        #endif
        #if defined(_PORTE)
        IntEnableE = clearIntEnable(_CHANGE_NOTICE_E_IRQ);
        #endif
        #if defined(_PORTF)
        IntEnableF = clearIntEnable(_CHANGE_NOTICE_F_IRQ);
        #endif
        #if defined(_PORTG)
        IntEnableG = clearIntEnable(_CHANGE_NOTICE_G_IRQ);
        #endif
    #else
        #if defined(_PORTA)
        IntEnableA = clearIntEnable(_CHANGE_NOTICE_A_VECTOR);
        #endif
        #if defined(_PORTB)
        IntEnableB = clearIntEnable(_CHANGE_NOTICE_B_VECTOR);
        #endif
        #if defined(_PORTC)
        IntEnableC = clearIntEnable(_CHANGE_NOTICE_C_VECTOR);
        #endif
        #if defined(_PORTD)
        IntEnableD = clearIntEnable(_CHANGE_NOTICE_D_VECTOR);
        #endif
        #if defined(_PORTE)
        IntEnableE = clearIntEnable(_CHANGE_NOTICE_E_VECTOR);
        #endif
        #if defined(_PORTF)
        IntEnableF = clearIntEnable(_CHANGE_NOTICE_F_VECTOR);
        #endif
        #if defined(_PORTG)
        IntEnableG = clearIntEnable(_CHANGE_NOTICE_G_VECTOR);
        #endif
    #endif
#endif
    }

    st = disableInterrupts();
  
    _txPort->lat.clr = _txBit; // Start bit

DEBUG1_HIGH
    
    bit_end_time = readCoreTimer() + _OneBitTime + EXTRA_TX_BIT_TIME;
    while (readCoreTimer() < bit_end_time);

DEBUG1_LOW

    for (mask = 0x01; mask; mask <<= 1) 
    {
        // choose bit
        if (b & mask)
        { 
            _txPort->lat.set = _txBit; // send 1
        }
        else
        {
            _txPort->lat.clr = _txBit; // send 0
        }
        
DEBUG1_HIGH
        
        bit_end_time = readCoreTimer() + _OneBitTime + EXTRA_TX_BIT_TIME;
        while (readCoreTimer() < bit_end_time);
        
DEBUG1_LOW

    }

    _txPort->lat.set = _txBit; // stop bit

DEBUG1_HIGH

    bit_end_time = readCoreTimer() + _OneBitTime + EXTRA_TX_BIT_TIME;
    while (readCoreTimer() < bit_end_time);
    
    restoreInterrupts(st);

    // And restore the CN functions when we're done transmitting this byte
    if(SoftwareSerial::_CN_ISR_hooked == true)
    {
#if !defined(__PIC32_PPS__)
        CNCONbits.ON    =   1;
#else
        // The right thing is to only disable those CNxIE bits that we're actually using
        // Then remember that and restore them when we're done.
    #if !defined(__PIC32MZXX__)
        #if defined(_PORTA)
        restoreIntEnable(_CHANGE_NOTICE_A_IRQ, IntEnableA);
        #endif
        #if defined(_PORTB)
        restoreIntEnable(_CHANGE_NOTICE_B_IRQ, IntEnableB);
        #endif
        #if defined(_PORTC)
        restoreIntEnable(_CHANGE_NOTICE_C_IRQ, IntEnableC);
        #endif
        #if defined(_PORTD)
        restoreIntEnable(_CHANGE_NOTICE_D_IRQ, IntEnableD);
        #endif
        #if defined(_PORTE)
        restoreIntEnable(_CHANGE_NOTICE_E_IRQ, IntEnableE);
        #endif
        #if defined(_PORTF)
        restoreIntEnable(_CHANGE_NOTICE_F_IRQ, IntEnableF);
        #endif
        #if defined(_PORTG)
        restoreIntEnable(_CHANGE_NOTICE_G_IRQ, IntEnableG);
        #endif
    #else
        #if defined(_PORTA)
        restoreIntEnable(_CHANGE_NOTICE_A_VECTOR, IntEnableA);
        #endif
        #if defined(_PORTB)
        restoreIntEnable(_CHANGE_NOTICE_B_VECTOR, IntEnableB);
        #endif
        #if defined(_PORTC)
        restoreIntEnable(_CHANGE_NOTICE_C_VECTOR, IntEnableC);
        #endif
        #if defined(_PORTD)
        restoreIntEnable(_CHANGE_NOTICE_D_VECTOR, IntEnableD);
        #endif
        #if defined(_PORTE)
        restoreIntEnable(_CHANGE_NOTICE_E_VECTOR, IntEnableE);
        #endif
        #if defined(_PORTF)
        restoreIntEnable(_CHANGE_NOTICE_F_VECTOR, IntEnableF);
        #endif
        #if defined(_PORTG)
        restoreIntEnable(_CHANGE_NOTICE_G_VECTOR, IntEnableG);
        #endif
    #endif
#endif
    }
DEBUG1_LOW
DEBUG0_LOW    
    return 1;
}

/* 
 * Since we do not use buffered transmit in this library, this function
 * doesn't have much to do.
 */
void SoftwareSerial::flush()
{
}

/*
 * If this RX pin is a CN pin (and thus has an RX buffer), peek at the next byte in the buffer and
 * return it. If this is not a CN pin, then return an error value of -1.
 */ 
int SoftwareSerial::peek()
{
    if (_on_CN_pin)
    {
        return _rxBuffer->getEntry(_rxBuffer->getHead());
    }
    else
    {
        return -1;
    }
}

// Circular buffer support

CircularBuffer::CircularBuffer(uint8_t *buffer, uint32_t size) 
{
    _size = size;
    _data = buffer;
    _head = 0;
    _tail = 0;
}

CircularBuffer::CircularBuffer(uint32_t size) 
{
    _size = size;
    _data = (uint8_t *)malloc(size);
    _head = 0;
    _tail = 0;
}

int32_t CircularBuffer::read() 
{
    int16_t chr;
    if (_head == _tail) 
    {
        return -1;
    }
    chr = _data[_tail];
    _tail = (_tail + 1) % _size;
    return chr;
}

void CircularBuffer::write(uint8_t d) 
{
    uint32_t newhead = (_head + 1) % _size;
    if (newhead != _tail) 
    {
        _data[_head] = d;
        _head = newhead;
    }
}

/* Return the number of bytes currently in the circular buffer */
int32_t CircularBuffer::available() 
{
    return (_size + _head - _tail) % _size;
}

/* Return true if buffer is completely full */
bool CircularBuffer::full() 
{
    return (((_head + 1) % _size) == _tail);
}

void CircularBuffer::clear() 
{
    _head = _tail = 0;
}

uint8_t CircularBuffer::getEntry(uint32_t p) 
{
    if (p >= _size) 
    {
        return 0;
    }
    return _data[p];
}

uint32_t CircularBuffer::getHead() 
{
    return _head;
}

uint32_t CircularBuffer::getTail() 
{
    return _tail;
}
