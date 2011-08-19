 /*
  SPI.cpp - SPI Master library for the PIC arduino.
  Copyright (c) 2011 Digilent.  All right reserved.
  Based on source Copyright (c) 2010 by Cristian Maglie
  Author: Oliver Jones
  Revision Date: 08/18/2011
  
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

void SPIClass::setClockDivider(WORD rate)
{
  rate &= 0x1FF;
  SPI2BRGSET = rate;
}