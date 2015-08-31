/************************************************************************/
/*                                                                      */
/*  SoftwareSerial.h -- Header file for Software Serial library         */
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

#ifndef SoftwareSerial_h
#define SoftwareSerial_h

#define	OPT_SYSTEM_INTERNAL
#define OPT_BOARD_INTERNAL	//pull in internal symbol definitons
#if (ARDUINO >= 100)
# include <Arduino.h>
#else
# include <WProgram.h>
#endif
#include <inttypes.h>
#include <Stream.h>


// The default size of the receive buffer for change notification pin based serial objects
#define TS_BUFSZ 256


#if !defined(__PIC32_PPS__) 
// Structure holding information about each CN pin on non-PPS PIC32s
typedef struct {
    uint16_t bit_mask;          // Bit mask within port of this CN
    uint8_t port_index;         // Index into port_to_tris_PGM[] of the port this CN is on
} CN_table_type;

// The total possible number of change notification pins
// (NOTE: This is only for non-PPS PIC32s.)
#define NUM_CN 22

// This structure represents the mapping of each Change Notification pin to
// a port and pin within that port for all PIC32s before PPS was added.
// For all of these non-PPS PIC32s, the Change Notification (CN) mapping is
// exactly the same.
const CN_table_type CN_table[NUM_CN] = {
    { _BV(14), _IOPORT_PC}, // CN0  - RC14
    { _BV(13), _IOPORT_PC}, // CN1  - RC13
    { _BV( 0), _IOPORT_PB}, // CN2  - RB0
    { _BV( 1), _IOPORT_PB}, // CN3  - RB1
    { _BV( 2), _IOPORT_PB}, // CN4  - RB2
    { _BV( 3), _IOPORT_PB}, // CN5  - RB3
    { _BV( 4), _IOPORT_PB}, // CN6  - RB4
    { _BV( 5), _IOPORT_PB}, // CN7  - RB5
    { _BV( 6), _IOPORT_PG}, // CN8  - RG6
    { _BV( 7), _IOPORT_PG}, // CN9  - RG7
    { _BV( 8), _IOPORT_PG}, // CN10 - RG8
    { _BV( 9), _IOPORT_PG}, // CN11 - RG9
    { _BV(15), _IOPORT_PB}, // CN12 - RB15
    { _BV( 4), _IOPORT_PD}, // CN13 - RD4
    { _BV( 5), _IOPORT_PD}, // CN14 - RD5
    { _BV( 6), _IOPORT_PD}, // CN15 - RD6
    { _BV( 7), _IOPORT_PD}, // CN16 - RD7
    { _BV( 4), _IOPORT_PF}, // CN17 - RF4
    { _BV( 5), _IOPORT_PF}, // CN18 - RF5
    { _BV(13), _IOPORT_PD}, // CN19 - RD13
    { _BV(14), _IOPORT_PD}, // CN20 - RD14
    { _BV(15), _IOPORT_PD}, // CN21 - RD15
};
#else
    #warning Error: Unknown processor type found in SoftwareSerial.h.
#endif

class CircularBuffer {
    private:
        uint8_t *_data;
        int32_t _head;
        int32_t _tail;
        int32_t _size;

    public:
        CircularBuffer(uint32_t);
        CircularBuffer(uint8_t *, uint32_t);
        int32_t read();
        void write(uint8_t);
        int32_t available();
        void clear();
        uint8_t getEntry(uint32_t p);
        uint32_t getHead();
        uint32_t getTail();
        bool full();
};


class SoftwareSerial : public Stream
{
  private:
    // per object data
    uint8_t     _receivePin;        // Digital pin RX is assigned to
    uint8_t     _transmitPin;       // Digital pin RX is assigned to
    long        _baudRate;
    
    // Error bit indicating that RX buffer has overflowed and some bytes have been lost
    uint8_t _RX_buffer_overflow:1;
    // Error bit that indicates that a valid stop bit was not seen at some point
    uint8_t _invalid_stop_bit:1;
    // TRUE if this software serial object uses inverted logic (normally low, start bit is high, etc.)
    uint8_t _inverted_logic:1;
    // TRUE if the RX pin of this software serial object is on a Change Notice pin
    uint8_t _on_CN_pin:1;
    // TRUE when, for this RX byte, we have already captured and recorded the falling edge of the start bit
    uint8_t _have_start_bit_time:1;
    // If this RX pin is on a CN pin and this is a non-PPS CPU, then we store the bitmask of
    // the CN pin here (for access into CNEN register)
#if !defined(__PIC32_PPS__)
    uint32_t _CN_bitmask;
#endif
    // Record if we've set up the CN ISR (only need to do it once)
    //
    static bool _CN_ISR_hooked;
    // Records the last known state of this RX pin (when using CN)
    bool _last_RX_pin_state;
    // Port and bit mask for our RX pin
    p32_ioport *_rxPort;
    uint16_t _rxBit;
    // Port and bit mask for our TX pin
    p32_ioport *_txPort;
    uint16_t _txBit;
    // Linked list of all SoftwareSerial objects that use Change Notification pins
    static SoftwareSerial *CN_list_head;
    SoftwareSerial *next_CN;
    // Time, in CoreTimer ticks, of a single  bit
    uint32_t _OneBitTime;
    
    // private methods
    void IntRead(void);
    bool is_pin_a_CN(uint8_t pin, uint32_t * CN_bitmask);
    void addCN(void);
    void removeCN(void);
    static bool ReadBit(SoftwareSerial*);
    static bool RXBitHasChanged(SoftwareSerial*);
    void printNumber(unsigned long, uint8_t);
    
  public:
    // Array to hold circular RX buffer
    /// TODO: Can this be made private?
    uint8_t _rxBufferArray[TS_BUFSZ];
    // Circular buffer object for RX buffer management
    /// TODO: Can this be made private?
    CircularBuffer *_rxBuffer;

    // Records the Core Timer value at the start of the start bit
    /// TODO: Can this be made private?
    uint32_t _start_bit_time;

    // static data
    /// TODO: Can this be made private?
    static SoftwareSerial *active_object;

    // public methods
    SoftwareSerial(uint8_t receivePin, uint8_t transmitPin, bool inverted_logic = false);
    ~SoftwareSerial();
    static void handleChangeNotificationISR(uint32_t start_bit_time);
    void begin(long speed);
    void begin(long speed, uint32_t RX_buffer_size);
    bool listen();
    int32_t readByte(void);
    void end();
    bool isListening() { return this == active_object; }
    bool stopListening();
    bool overflow() { bool ret = _RX_buffer_overflow; if (ret) _RX_buffer_overflow = false; return ret; }

    // Note: has, to to be int and not int32_t for some reason
    virtual int available();
    int available(uint32_t timeout_ms);
    // Note: has, to to be int and not int32_t for some reason
    virtual int peek();
    
    virtual size_t write(uint8_t byte);
    // Note: has, to to be int and not int32_t for some reason
    virtual int read();
    virtual void flush();
    explicit operator bool() { return true; }
    
    using Print::write;
};


#endif

