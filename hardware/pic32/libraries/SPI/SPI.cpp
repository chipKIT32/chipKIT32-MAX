/************************************************************************/
/*                                                                      */
/*	SPI.cpp	--	Top Level Module for chipKIT standard SPI Library		*/
/*                                                                      */
/************************************************************************/
/*  Author: Oliver Jones                                                */
/*  Copyright (c) 2011, Digilent. All rights reserved.                  */
/*                                                                      */
/*	Based on original work Copyright (c) 2010 by Cristian Maglie        */
/************************************************************************/
/*  File Description:													*/
/*                                                                      */
/*	This is the top level module for the standard SPI Library for the	*/
/*	chipKIT system. This library is based on, and is functionally		*/
/*	similar to the original Arduino standard SPI library.				*/
/*                                                                      */
//************************************************************************
//*	Revision History:													*/
//************************************************************************
//*	Aug 20,	2011	<GeneApperson> revised to fix build problems introduced
//*					by the initial port of the original Arduino library. Changed
//*					all use of the types BYTE and WORD to uint8_t and uint16_t.
//*	08/
//************************************************************************
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General Public
//*	License along with this library; if not, write to the Free Software
//*	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//*	
//************************************************************************


#define __LANGUAGE_C__

#include <plib.h>
#include "SPI.h"

SPIClass SPI;

//************************************************************************
void SPIClass::begin() 
{
	/* SPI Header
	* SS  P1 Output
	* SDO P2 Output
	* SDI P3 Input
	* SCK P4 Output 
	*/
	trisSS	&=	~(1 << bnSS);
	trisSDO	&=	~(1 << bnSDO);
	trisSDI	|=	(1 << bnSDI);
	trisSCK	&=	~(1 << bnSCK);

	// Warning: if the SS pin ever becomes a LOW INPUT then SPI 
	// automatically switches to Slave, so the data direction of 
	// the SS pin MUST be kept as OUTPUT.
	SPI2CONSET	=	( 1 << bnOn) | ( 1 << bnMsten );
}

//************************************************************************
void SPIClass::end()
{
	SPI2CONCLR	=	( 1 << bnOn );
}

//************************************************************************
void SPIClass::setBitOrder(uint8_t bitOrder)
{
	//PIC32 does not support selectable shift direction.
		// they always shift left (MSB first)
}

//************************************************************************
void SPIClass::setDataMode(uint16_t mode)
{
	SPI2CONCLR = 0x140;			 //force both mode bits to 0.
	SPI2CONSET = mode;				//set the requested mode
}

//************************************************************************
void SPIClass::setClockDivider(uint16_t rate)
{
	rate &= 0x1FF;
	SPI2BRGSET = rate;
}