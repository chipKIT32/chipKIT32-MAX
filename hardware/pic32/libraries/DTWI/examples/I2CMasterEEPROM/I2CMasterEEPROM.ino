/************************************************************************/
/*                                                                      */
/*    I2CMasterEEPROM                                                   */
/*                                                                      */
/*    Example sketch to program and read 24LCxxx EEPROMs                */
/*                                                                      */
/************************************************************************/
/*    Author:     Keith Vogel                                           */
/*    Copyright 2014, Digilent Inc.                                     */
/************************************************************************/
/* 
*
* Copyright (c) 2013-2014, Digilent <www.digilentinc.com>
* Contact Digilent for the latest version.
*
* This program is free software; distributed under the terms of 
* BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1.    Redistributions of source code must retain the above copyright notice, this
*        list of conditions and the following disclaimer.
* 2.    Redistributions in binary form must reproduce the above copyright notice,
*        this list of conditions and the following disclaimer in the documentation
*        and/or other materials provided with the distribution.
* 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
*        of its contributors may be used to endorse or promote products derived
*        from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/************************************************************************/
/*  Revision History:                                                   */
/*    8/4/2014(KeithV): Created                                         */
/************************************************************************/

#include <DTWI.h>

//#define I2CADDR 0x50     // on board EEPROM, chipKIT Pro MX4, Network Shield
#define I2CADDR 0x44     // Slave address for the I2CSlaveSimEEPROM sketch

// create the DTWI object
DTWI0 dtwi0;

typedef enum {
    NONE,
    QUERYBUTTONPRESS,
    WAITBUTTONPRESS,
    WAITBUTTONRELEASE,
    BEGINMASTER,
    ENDMASTER,
    STARTMASTERWRITE,
    SAVE,
    RESTARTMASTERWRITE,
    RESTARTMASTERREAD,
    ADDRWRITE,
    ADDRREAD,
    WRITEDATA,
    READDATA,
    STOPMASTER,
    ERROR,
    DONE,
} TWISTATE;

TWISTATE twiState = NONE;

// make this 64 bytes which is the size of the page write buffer in the 24LCxxx
// read the documentation carefully, the eeprom can be programmed in 64 byte pages,
// however the pages are 64 byte aligned in the eeprom space. So be starting at an 
// address not 64 byte aligned will cause a wrap in the eeprom program address space
// when programmed. In our example we write at address 0x10, write 64 bytes which
// will then wrap back to zero when 0x40 is hit, and the first 16 byes in the eeprom
// are written. When we read back, we read back at address 0x00 and we will see those
// last 16 bytes written starting at location 0
static const byte rgbDataWrite[] = {    0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80, 0x90, 0x00, 
                                        0x11, 0x21, 0x31, 0x41, 0x51, 0x61, 0x71, 0x81, 0x91, 0x01,  
                                        0x12, 0x22, 0x32, 0x42, 0x52, 0x62, 0x72, 0x82, 0x92, 0x02,  
                                        0x13, 0x23, 0x33, 0x43, 0x53, 0x63, 0x73, 0x83, 0x93, 0x03,  
                                        0x14, 0x24, 0x34, 0x44, 0x54, 0x64, 0x74, 0x84, 0x94, 0x04,    
                                        0x15, 0x25, 0x35, 0x45, 0x55, 0x65, 0x75, 0x85, 0x95, 0x05,  
                                        0x16, 0x26, 0x36, 0x46 
                                    };


static uint32_t cbWritten = 0;
static uint32_t cbRead = 0;

// Read the 24LCxxx Datasheet carefully. ALL WRITES to the EEPROM are 64 byte aligned in the
// address space and will wrap on the 64 byte boundary. By starting at 0x10, only 48 bytes will
// write to the addresses we expect, after 48 bytes, the address will wrap to 0 ans start writing from there
static const byte rgbEEPromAddrWrite[2] = {0x00, 0x10};  // high btye, low byte order.

// by reading from the 64 byte aligned boundary (of 0) we can see how the bytes after the first 16 bytes
// wrapped around to the begining of the 64 byte aligned locations
static const byte rgbEEPromAddrRead[2] = {0x00, 0x00};  // high btye, low byte order.

/***    void setup()
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *    
 *      Arduino setup routine
 * ------------------------------------------------------------ */
void setup() {

    Serial.begin(9600);
    Serial.println("I2CMasterEEPROM v3.0");
    Serial.println("Example sketch to read I2C 24LCxxx EEPROMs");
    Serial.println("Written by: Keith Vogel");
    Serial.println("Copyright Digilent 2014");


// if the WF32, turn on the pullup resistors
#ifdef _BOARD_WF32_
    pinMode(62, OUTPUT); 
    pinMode(63, OUTPUT); 
    digitalWrite(62, HIGH);
    digitalWrite(63, HIGH);
#endif

#ifdef PIN_BTN1
    pinMode(PIN_BTN1, INPUT); 
    twiState = QUERYBUTTONPRESS;
#else
    twiState = BEGINMASTER;
#endif
}

/***    void setup()
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *    
 *      Arduino loop routine
 * ------------------------------------------------------------ */
void loop() {

    switch(twiState) 
    {

#ifdef PIN_BTN1
        case QUERYBUTTONPRESS:
            Serial.println("Press BTN to query EEPROM");
            twiState = WAITBUTTONPRESS;
            break;

        case WAITBUTTONPRESS:
            if(digitalRead(PIN_BTN1) == HIGH)
            {
                twiState = WAITBUTTONRELEASE;
            }
            break;

        case WAITBUTTONRELEASE:
            if(digitalRead(PIN_BTN1) == LOW)
            {
                delay(1);   // some debounce
                twiState = BEGINMASTER;
            }
            break;
#endif

        case BEGINMASTER:
            if(dtwi0.beginMaster())
            {
                int i;
                twiState = STARTMASTERWRITE;

                // put this print out now, because once I start the master I don't want
                // the serial prints to block writing to the I2C bus; it won't hurt, it will
                // just put a multi-millisecond delay in while this message prints. 
                Serial.print("Writing ");
                Serial.print((uint32_t) sizeof(rgbDataWrite), DEC);
                Serial.print(" bytes to eeprom address: 0x");             
                Serial.print((((uint32_t) rgbEEPromAddrWrite[0]) << 8) + rgbEEPromAddrWrite[1], HEX);

                for(i = 0; i < sizeof(rgbDataWrite); i++)
                {
                    if((i % 16) == 0)
                    {
                        Serial.println();
                    }
                    Serial.print("0x");
                    Serial.print(rgbDataWrite[i], HEX);
                    Serial.print(" ");
                }
                Serial.println();
            }
            else
            {
                twiState = ERROR;
            }
            break;

        case STARTMASTERWRITE:
            if(dtwi0.startMasterWrite(I2CADDR))
            {
                cbWritten = 0;
                twiState = ADDRWRITE;
            }
            else
            {
                twiState = ERROR;
            }
            break;

        case ADDRWRITE:

            if(cbWritten < sizeof(rgbEEPromAddrWrite))
            {
                cbWritten += dtwi0.write(&rgbEEPromAddrWrite[cbWritten], sizeof(rgbEEPromAddrWrite) - cbWritten);
            }
            else
            {
                twiState = WRITEDATA;
                cbWritten = 0;
            }            
            break;

        case WRITEDATA:

            if(cbWritten < sizeof(rgbDataWrite))
            {
                cbWritten += dtwi0.write(&rgbDataWrite[cbWritten], sizeof(rgbDataWrite) - cbWritten);
            }
            else
            {
                twiState = SAVE;
            }            
            break;

        case SAVE:
            if(dtwi0.stopMaster())
            {
                twiState = RESTARTMASTERWRITE;    
            }
            break;

        case RESTARTMASTERWRITE:
            // this can fail because the EEPROM is busy
            if(dtwi0.startMasterWrite(I2CADDR))
            {
                cbWritten = 0;
                twiState = ADDRREAD;
            }
            break;

        case ADDRREAD:

            if(cbWritten < sizeof(rgbEEPromAddrRead))
            {
                cbWritten += dtwi0.write(&rgbEEPromAddrRead[cbWritten], sizeof(rgbEEPromAddrRead) - cbWritten);
            }
            else
            {
                twiState = RESTARTMASTERREAD;
                cbWritten = 0;
            }            
            break;

        case RESTARTMASTERREAD:
            if(dtwi0.startMasterRead(I2CADDR, sizeof(rgbDataWrite)))
            {
                cbRead = 0;
                twiState = READDATA;
                Serial.println("Reading eeprom data back");
            }
            break;

        case READDATA:
            if(dtwi0.available())
            {
                int i = 0;
                byte rgb[32];  
                uint32_t cbReadThisPass = dtwi0.read(rgb, sizeof(rgb));
                uint32_t readAddr = (((uint32_t) rgbEEPromAddrRead[0]) << 8) + rgbEEPromAddrRead[1] + cbRead;

                Serial.print("eeprom addr 0x");
                Serial.print(readAddr, HEX);
                Serial.print(": ");

                cbRead += cbReadThisPass;

                for(i = 0; i < cbReadThisPass; i++)
                {
                    Serial.print("0x");
                    Serial.print(rgb[i], HEX);
                    Serial.print(" ");
                }
                Serial.println();

                if(cbRead >= sizeof(rgbDataWrite))
                {
                    twiState = STOPMASTER;
                }
            }
            break;

        case STOPMASTER:
            if(dtwi0.stopMaster())
            {
                twiState = ENDMASTER;    
            }
            break;

        case ENDMASTER:
            dtwi0.endMaster();

            // clean out the read / write buffer
            dtwi0.abort();
            dtwi0.discard();

#ifdef PIN_BTN1
            twiState = QUERYBUTTONPRESS;
#else
            Serial.println("Sketch is done");
            twiState = DONE;   
#endif 
            break;

        case ERROR:
            Serial.println("Got an error, ending sketch");
#ifdef PIN_BTN1
            twiState = ENDMASTER;
#else
            Serial.println("Sketch is done");
            twiState = DONE;   
#endif 
            break;

        DONE:
        default:
            break;
    }
}
