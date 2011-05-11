/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@bug.st>
 * SPI Master library for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#include <plib.h>
#include "SPI.h"

SPIClass SPI;

void SPIClass::begin() {
  // Set direction register for SCK and MOSI pin.
  // MISO pin automatically overrides to INPUT.
  // When the SS pin is set as OUTPUT, it can be used as
  // a general purpose output port (it doesn't influence
  // SPI operations).

  pinMode(SCK, OUTPUT);
  pinMode(MOSI, OUTPUT);
  pinMode(SS, OUTPUT);
  
  digitalWrite(SCK, LOW);
  digitalWrite(MOSI, LOW);
  digitalWrite(SS, HIGH);

  // Warning: if the SS pin ever becomes a LOW INPUT then SPI 
  // automatically switches to Slave, so the data direction of 
  // the SS pin MUST be kept as OUTPUT.
  SPI1CONSET = ( 1 << bnOn) | ( 1 << bnMsten );
}

void SPIClass::end() {
  SPI1CONCLR = ( 1 << bnOn );
}

void SPIClass::setBitOrder(uint8_t bitOrder)
{
	//Bit order is not implemented on the PIC parts
}

void SPIClass::setDataMode(uint16_t mode)
{
  SP1CONSET = mode;
}

void SPIClass::setClockDivider(uint8_t rate)
{
  SPI1BRGSET = rate;
}

