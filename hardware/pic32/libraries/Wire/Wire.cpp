/************************************************************************/
/*                                                                      */
/*    Wire.cpp                                                          */
/*                                                                      */
/*    I2C  implemenation                                                */
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
// DTWI is not on the path and we don't want the user to have
// to explicitly include the library. So just grab it and compile it
#include "../DTWI/DTWI.cpp"
#define ENABLE_END
#include <Wire.h>

DTWI0 di2c;
TwoWire Wire;

// Initialize Class Variables //////////////////////////////////////////////////

uint8_t TwoWire::rxBuffer[BUFFER_LENGTH];
uint8_t TwoWire::rxBufferIndex = 0;
uint8_t TwoWire::rxBufferLength = 0;

uint8_t TwoWire::txAddress = 0;
uint8_t TwoWire::txBuffer[BUFFER_LENGTH];
uint8_t TwoWire::txBufferIndex = 0;
uint8_t TwoWire::txBufferLength = 0;

uint8_t TwoWire::transmitting = 0;
void (*TwoWire::user_onRequest)(void);
void (*TwoWire::user_onReceive)(int);

uint32_t TwoWire::beginCount = 0;

static void (*onReceiveServiceR) (uint8_t*, int) = NULL;
static void (*onRequestServiceR)(void)           = NULL;
static uint32_t iSessionCur                     = 0xFF;

static void onI2C(int id, void * tptr)
{
    DTWI::I2C_STATUS status = di2c.getStatus();
    uint8_t data;

    if(status.fSlave)
    {
        if(status.fRead)
        {
            while(di2c.available() > 0)
            {
                onReceiveServiceR(NULL, di2c.available());
            }
        }

        // on writing out, we only call once when the 
        // new session starts
        else if(status.fWrite && iSessionCur != status.iSession)
        {
            iSessionCur = status.iSession;
            onRequestServiceR();
        }
    }
}

static bool beginSlave(void (*onReceiveService) (uint8_t*, int), void (*onRequestService)(void))
{
    if(getTaskId(onI2C) == -1)
    {
        createTask(onI2C, 0, TASK_ENABLE, NULL);
    };
    onReceiveServiceR = onReceiveService;
    onRequestServiceR = onRequestService;
    iSessionCur = 0xFF;

    return(true);
}

// Constructors ////////////////////////////////////////////////////////////////

TwoWire::TwoWire()
{
}

// Public Methods //////////////////////////////////////////////////////////////

void TwoWire::begin(void)
{
    if(beginCount == 0)
    {
    beginCount++;
        // there are no callback in Master mode
        destroyTask(getTaskId(onI2C));
        di2c.beginMaster();
    }
}

void TwoWire::begin(uint8_t address)
{
    if(beginCount == 0)
    {
        beginCount++;

        // make sure we put the callback in the task manager
        beginSlave(onReceiveService, onRequestService);
        di2c.beginSlave(address);
    }
}

// The end function is a non-standard function which is intended to mirror the end function
// of the SPI and DSPI libraries.  It decrements the open counter and, when zero, will
// (eventually) disable the I2C interface.  This is yet to be completed.
//
// Until it is completed this is an option function enabled in the Wire.h header file.

#ifdef ENABLE_END
void TwoWire::end() {
    DTWI::I2C_STATUS status = di2c.getStatus();

    if(beginCount == 0)
    {
        return;
    }

    destroyTask(getTaskId(onI2C));
    beginCount = 0;

    if(status.fMaster)
    {
        di2c.endMaster();
    }
    else if(status.fSlave)
    {
        // forcefully end the slave
        di2c.endSlave(true);
    }

    // clean out the read / write buffer
    di2c.abort();
    di2c.discard();
    }
#endif

void TwoWire::begin(int address)
{
  begin((uint8_t)address);
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity)
{
    DTWI::I2C_STATUS i2cStatus = di2c.getStatus();

    // see if the bus is already in use
    if(i2cStatus.fBusInUse && !i2cStatus.fMyBus)
    {
        return(0);
    }

    // may have to wait for the last action to finish before
    // a repeated start can occur
    while(!di2c.startMasterRead(address, quantity) && di2c.getStatus().fMyBus);

    do
    {
        i2cStatus = di2c.getStatus();
    } while(i2cStatus.fMyBus && !i2cStatus.fNacking);

    while(!di2c.stopMaster());

    return(di2c.available());
}

uint8_t TwoWire::requestFrom(int address, int quantity)
{
  return requestFrom((uint8_t)address, (uint8_t)quantity);
}

void TwoWire::beginTransmission(uint8_t address)
{
    DTWI::I2C_STATUS i2cStatus = di2c.getStatus();

    // if someone else has the bus, then we won't get it; get out
    if(i2cStatus.fBusInUse  && !i2cStatus.fMyBus)
    {
        return;
    }
   
    // we only want to loop on this with a repeated start
    // otherwise it will pass on the first try 
    while(!di2c.startMasterWrite(address) && di2c.getStatus().fMyBus);
}

void TwoWire::beginTransmission(int address)
{
  beginTransmission((uint8_t)address);
}

uint8_t TwoWire::endTransmission(uint8_t fStopBit)
{
    uint8_t retStatus = 0;
    DTWI::I2C_STATUS i2cStatus;

    // if not my bus, then the beginMaster failed and we either had
    // a collision or the slave acked, in either case report a NACK from the slave
    if(!di2c.getStatus().fMyBus)
    {
        return(2);
    }

    // wait for the transmit buffer is empty 
    while(di2c.getStatus().fWrite && di2c.transmitting() != 0);

    // Get the current status
    i2cStatus = di2c.getStatus();

    // what happened to the bus, we use to have it?
    // other error
    if(!i2cStatus.fMyBus)
    {
        return(4);      
    }

    // we have the bus, but not writing
    // the otherside NACKed our Write
    else if(!i2cStatus.fWrite)
    {
            retStatus = 3;
    }

    // put a stop bit out if we are not going to attempt a repeated start
    if(fStopBit)
    {
        while(!di2c.stopMaster());
    }

    return(retStatus);
}

uint8_t TwoWire::endTransmission(void)
{
    return(endTransmission(true));
}

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(uint8_t data)
{
    return(di2c.write((const byte *) &data, 1));
}
void TwoWire::send(uint8_t data) { write(data); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(uint8_t* data, uint8_t quantity)
{
    return(di2c.write((const byte *) data, quantity));
}
void TwoWire::send(uint8_t* data, uint8_t quantity) { write(data, quantity); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(char* data)
{
    return(write((uint8_t*) data, strlen(data)));
}
void TwoWire::send(char* data) { write(data); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(int data)
{
    return(write((uint8_t) data));
}
void TwoWire::send(int data) { write(data); }

// must be called in:
// slave rx event callback
// or after requestFrom(address, numBytes)
uint8_t TwoWire::available(void)
{
  return (di2c.available());
}

uint8_t TwoWire::receive(void) {
	return(read());
}

// must be called in:
// slave rx event callback
// or after requestFrom(address, numBytes)
uint8_t TwoWire::read(void)
{
    byte    data;
  
    if(di2c.read(&data, 1) == 1)
    {
        return((uint8_t) data);
  }

	return('\0');
}

// behind the scenes function that is called when data is received
void TwoWire::onReceiveService(uint8_t* inBytes, int numBytes)
{
  // don't bother if user hasn't registered a callback
  if(!user_onReceive){
    return;
  }
  // don't bother if rx buffer is in use by a master requestFrom() op
  // i know this drops data, but it allows for slight stupidity
  // meaning, they may not have read all the master requestFrom() data yet
    user_onReceive(numBytes);
}

// behind the scenes function that is called when data is requested
void TwoWire::onRequestService(void)
{
  // don't bother if user hasn't registered a callback
  if(!user_onRequest){
    return;
  }
  // alert user program
  user_onRequest();
}

// sets function called on slave write
void TwoWire::onReceive( void (*function)(int) )
{
  user_onReceive = function;
}

// sets function called on slave read
void TwoWire::onRequest( void (*function)(void) )
{
  user_onRequest = function;
}



