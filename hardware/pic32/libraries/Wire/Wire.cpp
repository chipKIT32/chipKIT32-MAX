/*
  TwoWire.cpp - TWI/I2C library for Wiring & Arduino
  Copyright (c) 2006 Nicholas Zambetti.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

extern "C" {
  #include <stdlib.h>
  #include <string.h>
  #include <inttypes.h>
  #include "twi.h"
}

#define OPT_BOARD_INTERNAL
#include <p32xxxx.h>
#include <pins_arduino.h>
#include <p32_defs.h>
#include "Wire.h"

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

// Constructors ////////////////////////////////////////////////////////////////

TwoWire::TwoWire()
{
}

// Public Methods //////////////////////////////////////////////////////////////

void TwoWire::begin(void)
{
    // This will protect the code from being called more than once.
    // Not only will this work around the multiple twi_init bug, but
    // it also protects the buffer index and length static variables
    // from being reset by a subsequent call to Wire.begin().
    beginCount++;
    if (beginCount == 1) { // First init
        rxBufferIndex = 0;
        rxBufferLength = 0;

        txBufferIndex = 0;
        txBufferLength = 0;

        twi_init((p32_i2c *)_TWI_BASE, _TWI_BUS_IRQ, _TWI_SLV_IRQ, _TWI_MST_IRQ, _TWI_VECTOR);
    }
}

void TwoWire::begin(uint8_t address)
{
    begin();
    // Likewise, in the other begin function, this will prevent
    // the attach events being called more than once.
    if (beginCount == 1) { // First init
        twi_setAddress(address);
        twi_attachSlaveTxEvent(onRequestService);
        twi_attachSlaveRxEvent(onReceiveService);
    }
}

// The end function is a non-standard function which is intended to mirror the end function
// of the SPI and DSPI libraries.  It decrements the open counter and, when zero, will
// (eventually) disable the I2C interface.  This is yet to be completed.
//
// Until it is completed this is an option function enabled in the Wire.h header file.

#ifdef ENABLE_END
void TwoWire::end() {
    if (beginCount == 0) {
        return;
    }

    beginCount--;
    if (beginCount == 0) {
        // We need code in here to undo whatever begin() does.
        // That's not something I can delve into right now.
    }
}
#endif

void TwoWire::begin(int address)
{
  begin((uint8_t)address);
}

uint8_t TwoWire::requestFrom(uint8_t address, uint8_t quantity)
{
  // clamp to buffer length
  if(quantity > BUFFER_LENGTH){
    quantity = BUFFER_LENGTH;
  }
  // perform blocking read into buffer
  uint8_t read = twi_readFrom(address, rxBuffer, quantity);
  // set rx buffer iterator vars
  rxBufferIndex = 0;
  rxBufferLength = read;

  return read;
}

uint8_t TwoWire::requestFrom(int address, int quantity)
{
  return requestFrom((uint8_t)address, (uint8_t)quantity);
}

void TwoWire::beginTransmission(uint8_t address)
{
  // indicate that we are transmitting
  transmitting = 1;
  // set address of targeted slave
  txAddress = address;
  // reset tx buffer iterator vars
  txBufferIndex = 0;
  txBufferLength = 0;
}

void TwoWire::beginTransmission(int address)
{
  beginTransmission((uint8_t)address);
}

uint8_t TwoWire::endTransmission(void)
{
  // transmit buffer (blocking)
  int8_t ret = twi_writeTo(txAddress, txBuffer, txBufferLength, 1);
  // reset tx buffer iterator vars
  txBufferIndex = 0;
  txBufferLength = 0;
  // indicate that we are done transmitting
  transmitting = 0;
  return ret;
}


// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(uint8_t data)
{
    if(transmitting) {
        // in master transmitter mode
        // don't bother if buffer is full
        if(txBufferLength >= BUFFER_LENGTH){
            return 1;
        }
        // put byte in tx buffer
        txBuffer[txBufferIndex] = data;
        ++txBufferIndex;
        // update amount in buffer   
        txBufferLength = txBufferIndex;
    } else {
        // in slave send mode
        // reply to master
        twi_transmit(&data, 1);
    }
    return 1;
}
void TwoWire::send(uint8_t data) { write(data); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(uint8_t* data, uint8_t quantity)
{
    if(transmitting){
        // in master transmitter mode
        for(uint8_t i = 0; i < quantity; ++i){
            write(data[i]);
        }
    } else {
        // in slave send mode
        // reply to master
        twi_transmit(data, quantity);
    }
    return 1;
}
void TwoWire::send(uint8_t* data, uint8_t quantity) { write(data, quantity); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(char* data)
{
    return write((uint8_t*)data, strlen(data));
}
void TwoWire::send(char* data) { write(data); }

// must be called in:
// slave tx event callback
// or after beginTransmission(address)
int TwoWire::write(int data)
{
    return write((uint8_t)data);
}
void TwoWire::send(int data) { write(data); }

// must be called in:
// slave rx event callback
// or after requestFrom(address, numBytes)
uint8_t TwoWire::available(void)
{
  return rxBufferLength - rxBufferIndex;
}

// must be called in:
// slave rx event callback
// or after requestFrom(address, numBytes)
uint8_t TwoWire::receive(void)
{
  // default to returning null char
  // for people using with char strings
  uint8_t value = '\0';
  
  // get each successive byte on each call
  if(rxBufferIndex < rxBufferLength){
    value = rxBuffer[rxBufferIndex];
    ++rxBufferIndex;
  }

  return value;
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
  if(rxBufferIndex < rxBufferLength){
    return;
  }
  // copy twi rx buffer into local read buffer
  // this enables new reads to happen in parallel
  for(uint8_t i = 0; i < numBytes; ++i){
    rxBuffer[i] = inBytes[i];    
  }
  // set rx iterator vars
  rxBufferIndex = 0;
  rxBufferLength = numBytes;
  // alert user program
  user_onReceive(numBytes);
}

// behind the scenes function that is called when data is requested
void TwoWire::onRequestService(void)
{
  // don't bother if user hasn't registered a callback
  if(!user_onRequest){
    return;
  }
  // reset tx buffer iterator vars
  // !!! this will kill any pending pre-master sendTo() activity
  txBufferIndex = 0;
  txBufferLength = 0;
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

// Preinstantiate Objects //////////////////////////////////////////////////////

TwoWire Wire = TwoWire();

