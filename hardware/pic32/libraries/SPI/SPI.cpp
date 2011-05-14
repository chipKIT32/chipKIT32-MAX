/*
 * Copyright (c) 2011 Digilent
 * SPI Master library for PIC arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#define __LANGUAGE_C__

#include <plib.h>
#include "SPI.h"

SPIClass SPI;

void SPIClass::begin() {
 /* SPI Header
  * SS  P1 Output
  * SDO P2 Output
  * SDI P3 Input
  * SCK P4 Output 
  */
  trisSS &= ~(1 << bnSS);
  trisSDO &= ~(1 << bnSDO);
  trisSDI |= (1 << bnSDI);
  trisSCK &= ~(1 << bnSCK);

  // Warning: if the SS pin ever becomes a LOW INPUT then SPI 
  // automatically switches to Slave, so the data direction of 
  // the SS pin MUST be kept as OUTPUT.
  SPI2CONSET = ( 1 << bnOn) | ( 1 << bnMsten );
}

void SPIClass::end() {
  SPI2CONCLR = ( 1 << bnOn );
}

void SPIClass::setBitOrder(BYTE bitOrder)
{
	//Bit order is not implemented on the PIC parts
}

void SPIClass::setDataMode(WORD mode)
{
  SPI2CONSET = mode;
}

void SPIClass::setClockDivider(BYTE rate)
{
  SPI2BRGSET = rate;
}