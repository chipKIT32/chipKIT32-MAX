/************************************************************************/
/*                                                                      */
/*    I2CSlaveSimEEPROM.cpp                                             */
/*                                                                      */
/*    Example sketch to emulate a 24LCxxx (24LC1) (1K) EEPROM           */
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

#define I2CADDR 0x44     // slave address

// how long to be offline while updating the eeprom flash
#define microWAIT 250

// create the DTWI object
DTWI0 dtwi0;

typedef enum {
    NONE,
    BEGINSLAVE,
    WAITMYBUS,
    WAITEEPROMADDRESS,
    WRITERAM,
    READRAM,
    PGMFLASH,
    DELAYSOME,
    ERROR,
    ENDSLAVE,
    DONE,
} TWISTATE;

static TWISTATE twiState = NONE;
static uint32_t tStart = 0;

// The 64 byte eeprom page write buffer
#define WBALIGNMASK 0xFFFFFFC0
static byte rgbPageWriteBuffer[64]; 

// depending on the eeprom, the size of the eeprom
// is a mult of the page write buffer. The eeprom Digilent use
// on the MX4ck or Network Shield is a 24LC256, a 256K eeprom or
// 4000x the page write buffer. We don't have that much RAM to 
// simulate the full 256K, so we are only going to have 1K 
// or 16x; so this would be a 24LC1.... if it existed.
#define mRAMvsPageWriteBuff  16
static byte rgbSimEEProm[mRAMvsPageWriteBuff * sizeof(rgbPageWriteBuffer)];

// the RAM address we are writing
static uint16_t ramAddress = 0;
static uint8_t curSession = 0;
static bool fWriteRAM = false;

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
    Serial.println("I2CSlaveSimEEPROM v2.0");
    Serial.println("Simulated 24LCxxx EEPROM I2C Slave");
    Serial.println("Written by: Keith Vogel");
    Serial.println("Copyright Digilent 2014");

// if the WF32, turn on the pullup resistors
#ifdef _BOARD_WF32_
    pinMode(62, OUTPUT); 
    pinMode(63, OUTPUT); 
    digitalWrite(62, HIGH);
    digitalWrite(63, HIGH);
#endif

    // flash is originally erased to FFs
    memset(rgbSimEEProm, 0xFF, sizeof(rgbSimEEProm));

    // clean out the read / write buffers
    // in the I2C controller
    dtwi0.abort();
    dtwi0.discard();

    twiState = BEGINSLAVE;
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
    DTWI::I2C_STATUS curStatus = dtwi0.getStatus();

    switch(twiState) 
    {
        case BEGINSLAVE:
            if(dtwi0.beginSlave(I2CADDR))
            {
                twiState = WAITMYBUS;
            }
            else
            {
                twiState = ENDSLAVE;
            }
            break;

        case WAITMYBUS:
            // about to recieve and address
            if(curStatus.fRead)
            {
                twiState = WAITEEPROMADDRESS;
                curSession = curStatus.iSession;
            }

            // if we get a write, just spit out data
            else if(curStatus.fWrite)
            {
                twiState = READRAM;
                curSession = curStatus.iSession;
            }
            break;

        case WAITEEPROMADDRESS:
            if(dtwi0.available() >= 2)
            {
                uint32_t iWriteBuffBase;

                dtwi0.read(&((byte *) &ramAddress)[1], 1);
                dtwi0.read(&((byte *) &ramAddress)[0], 1);

                // we want to make sure the specified address
                // wraps and is in the range of our sim eeprom 
                ramAddress %= sizeof(rgbSimEEProm);
                iWriteBuffBase = ramAddress & WBALIGNMASK;

                // we must preload our page write buffer with
                // contents of the eeprom; remember to read the aligned values in
                memcpy(rgbPageWriteBuffer, &rgbSimEEProm[iWriteBuffBase], sizeof(rgbPageWriteBuffer));

                // go to getting the data
                fWriteRAM = false;
                twiState = WRITERAM;
           }

            // if somehow we are not on a read...
            // but we are waiting for an address, so this doesn't
            // make any sense, go back and wait for a restart
            else if(curSession != curStatus.iSession || !curStatus.fMyBus)
            {
                twiState = ENDSLAVE;
            }
            break;

        case WRITERAM:           
            // consume anything we have in the buffer
            while(dtwi0.available() > 0)
            {
                // location of the address is page write buffer aligned
                // within the eeprom
                uint32_t iPageWriteBuff = ramAddress % sizeof(rgbPageWriteBuffer);
                uint32_t cbRead = min(sizeof(rgbPageWriteBuffer) - iPageWriteBuff, dtwi0.available());

                // read the data into the write page buffer
                dtwi0.read(&rgbPageWriteBuffer[iPageWriteBuff], cbRead);

                // update the ramAddress based on the page write buffer address wrapping
                ramAddress = (ramAddress & WBALIGNMASK) + ((iPageWriteBuff + cbRead) % sizeof(rgbPageWriteBuffer));

                fWriteRAM = true;
            }

            // as soon as we lose the bus, shutdown the controller
            // this will give us time to read the rest of the data and 
            // write sim eeprom
            if(!curStatus.fBusInUse && fWriteRAM)
            {
                // we want to immediately turn OFF the controller
                // we do not want to respond to new address requests
                dtwi0.endSlave(true);
                twiState = PGMFLASH;
            }

            // if I lost the session, don't write the eeprom
            // just go back and look for another command
            else if(!curStatus.fMyBus || curStatus.iSession != curSession)
            {
                twiState = WAITMYBUS;
            }

            break;

        case READRAM:
            if(dtwi0.transmitting() < 10)
            {
                dtwi0.write(&rgbSimEEProm[ramAddress++], 1);
                ramAddress %= sizeof(rgbSimEEProm);
            }
            else if(!curStatus.fMyBus || curStatus.iSession != curSession)
            {
                // clean out the write buffer
                twiState = ENDSLAVE;
            }
            break;      

        case PGMFLASH:
            // we must write back our page write buffer to
            // simulated eeprom
            memcpy(&rgbSimEEProm[(ramAddress & WBALIGNMASK)], rgbPageWriteBuffer, sizeof(rgbPageWriteBuffer));

            // clean out the read / write buffer
            dtwi0.abort();
            dtwi0.discard();

            // now simulate flash write time
            tStart = micros();
            twiState = DELAYSOME;    
            break;

        case DELAYSOME:
            // the 24LCxxxx will be knocked off line as a slave
            // while it updates the eeprom from the write buffer
            // a real 24LCxxxx will be off line for many millisec
            // but as an emulations, we just want to be off line
            // long enough to show we went off line, so our emulation
            // is much shorter.
            if( micros() - tStart >= microWAIT)
            {
                // start over, wait for another slave command
                twiState = BEGINSLAVE;  
            }
            break;

        case ENDSLAVE:
            // forcefully end the slave
            dtwi0.endSlave(true);

            // clean the buffers up
            dtwi0.abort();
            dtwi0.discard();

            // start over, wait for another slave command
            twiState = BEGINSLAVE;  
            break;

        case ERROR:
            // forcefully end the slave
            dtwi0.endSlave(true);
            tStart = micros();

            Serial.println("Got an error, ending sketch");
            twiState = DELAYSOME;
            break;

        DONE:
        default:
            break;
    }
}
