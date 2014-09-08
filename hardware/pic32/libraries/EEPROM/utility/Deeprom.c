/************************************************************************/
/*																		*/
/*	Deeprom.c	--	eeprom Emulation routines							*/
/*																		*/
/************************************************************************/
/*	Author: 	Oliver Jones											*/
/*	Copyright 2011, Digilent Inc.										*/
/************************************************************************/
/*
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
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/* 09/01/2011(OliverJ):	created											*/
/* 02/06/2013(GeneA):	removed dependencies on Microchip plib library	*/
/*  03/24/2014(BrianSchmalz): Added support for MX1/MX2 EEPROM emulation*/
/*																		*/
/************************************************************************/


/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include <p32xxxx.h>
#include <stdint.h>
#include <alloca.h>

#define	OPT_BOARD_INTERNAL
#include <pins_arduino.h>

#include "Deeprom.h"
#include "flash.h"

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

//Aligns the flash memory used for EEPROM emulation in the linker script
__attribute__ ((space(prog),aligned(_EEPROM_PAGE_SIZE*4),section(".eeprom_pic32")))
unsigned int eedata_addr[_EEPROM_PAGE_COUNT][_EEPROM_PAGE_SIZE];

// Default max EEPROM address sketch can use. Note: can be adjusted by sketch.
static uint32_t max_address = MAX_ADDRESS_DEFAULT;
// For storing all data values during 'cleanup' and block erase
static uint8_t tempBuffer[MAX_ADDRESS_DEFAULT];

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */
/***	setMax()
**
**	Parameters:
**		value - Desired value to set Max address
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Sets the max address
**		Note: Make sure to clearEeeprom() after changing this value.
*/
BOOL setMax(uint32_t value)
{
	if(value > _EEPROM_PAGE_SIZE - 1) {
		return fFalse;
	}

	max_address = value;

	return fTrue;
}

/* ------------------------------------------------------------ */
/***	getMax()
**
**	Parameters:
**		none
**
**	Return Value:
**		current max address
**
**	Errors:
**		none
**
**	Description:
**		Gets the current max address
*/
uint32_t getMax(uint32_t value)
{
	return max_address;
}

/* ------------------------------------------------------------ */
/***	clearEeprom()
**
**	Parameters:
**		none
**
**	Return Value:
**		none
**
**	Errors:
**		none
**
**	Description:
**		Clears all EEPROM values to 0xFF
*/
void clearEeprom()
{
	int i;

	// Clear all pages (all will become 0xFFFFFFFF)
	for(i=0; i < _EEPROM_PAGE_COUNT; i++) {
		eraseFlashPage(&eedata_addr[i][0]);
	}
}

/* ------------------------------------------------------------ */
/***	writeEeprom
**
**	Parameters:
**		address	- location to be written
**		data	- data to be written
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Writes a data to specified address location
*/
BOOL writeEeprom(uint32_t address, uint8_t data)
{
	int i;

	if(address > max_address) {
		return fFalse;
	}

	//Try writing data to flash
	for(i=0; i < _EEPROM_PAGE_COUNT; i++) {
		if(putEeprom(&eedata_addr[i][0], address, data)) {
			return fTrue;
		}
	}
	
		//Put page to buffer
	putBuffer(tempBuffer);

	for(i=0; i < _EEPROM_PAGE_COUNT; i++) {
		//Clear all the pages
		eraseFlashPage(&eedata_addr[i][0]);
	}

		//Put buffer back to page
	getBuffer(tempBuffer);

	//Try writing data to flash again
	for(i=0; i < _EEPROM_PAGE_COUNT; i++) {
		if(putEeprom(&eedata_addr[i][0], address, data)) {
			return fTrue;
		}
	}

	return fFalse;
}

/* ------------------------------------------------------------ */
/***	readEeprom
**
**	Parameters:
**		address	- location to be read
**		data	- pointer to were data will be stored
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Reads data at specified address location and copies it to
**		location pointed to by data
*/
BOOL readEeprom(uint32_t address, uint8_t * data)
{
	int i;

		*data = 0xFF;
	if(address > max_address) {
		return fFalse;
	}

	//Search through all pages to find specified address
	for(i=0; i < _EEPROM_PAGE_COUNT; i++) {
		if(getEeprom(&eedata_addr[i][0], address, data)) {
			return fTrue;
		}
	}

	return fFalse;
}

/* ------------------------------------------------------------ */
/***	putEeprom
**
**	Parameters:
**		eeprom	- pointer to a flash memory page acting as emulated EEPROM
**		address	- location to be written
**		data	- data to be written
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Searches through emulated EEPROM page for valid address then
**		invalidates that location and writes the address and data
**		to a new unused location.
*/
BOOL putEeprom(eeSeg * eeprom, uint32_t address, uint8_t data)
{
	eeSeg tempSeg;

	int i;

	uint32_t nextAvalible;

	//Check if address exists 
	for(i=0; i < _EEPROM_PAGE_SIZE; i++) {
		
		//Check if eeSeg is valid and address matches
		if(getValid(eeprom[i]) && !getTaken(eeprom[i]) && 
		   getAddress(eeprom[i]) == address) {
			
			   //If data is same do nothing
			   if(data == getData(eeprom[i])) {
				   return fTrue;
			   }
			   //If data is different invalidate eeSeg
			   else {
				   tempSeg = eeprom[i];
				   tempSeg.temp.valid = 0;
				   writeFlashWord((void*)&eeprom[i],tempSeg.data);

				   // If data is 0xFF return
				//if(data == 0xFF) {
				//	printf(" and data is 0xFF so done.\n\r");
				//	return fTrue;
				//}
			   }
		}
		//If empty eeSeg found save location and break
		else if(getValid(eeprom[i]) && getTaken(eeprom[i])) {
			nextAvalible = i;
			break;
		}
	}

	//If I == max size no valid segments exist
	if(i == _EEPROM_PAGE_SIZE) {
		return fFalse;
	}

	//Pack address with data and write to flash
	tempSeg = pack(address,data);
	writeFlashWord((void*)&eeprom[i],tempSeg.data);

	return fTrue;
}

/* ------------------------------------------------------------ */
/***	getEeprom
**
**	Parameters:
**		eeprom	- pointer to flash memory acting as emulated EEPROM
**		address	- location to be read
**		data	- data to be read
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Searches through emulated EEPROM for valid address and
**		returns data. If no address can be found the function
**		will return false and set data pointer to 0xFF
*/
BOOL getEeprom(eeSeg * eeprom, uint32_t address,uint8_t * data)
{
	int i;

	//Check if address exists
	for(i=0; i < _EEPROM_PAGE_SIZE; i++) {
		//Check if eeSeg is valid and address matches
		if(getValid(eeprom[i]) && !getTaken(eeprom[i]) &&
		   getAddress(eeprom[i]) == address) {
			//Set data to pointer and return
			*data = getData(eeprom[i]);
			return fTrue;
		}
		else if(getValid(eeprom[i]) && getTaken(eeprom[i])) {
			break;
		}
	}

	//If address not found return 0xFF
	*data = 0xFF;
	return fFalse;
}

/* ------------------------------------------------------------ */
/***	putBuffer
**
**	Parameters:
**		eeprom	- pointer to flash memory acting as emulated EEPROM
**		buffer	- pointer to buffer
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Searches through emulated EEPROM for valid addresses
**		then writes data to buffer using address as the index
**		buffer must be big enough to hold all addresses (even
**		those that aren't used) i.e. MAX_ADDRESS_DEFAULT big.
*/
uint32_t putBuffer(uint8_t * buffer)
{
	uint16_t tempAddress;

	int i, j;

	//Initialize each byte in buffer to 0xFF
	for(i=0; i < max_address; i++) {
		buffer[i] = 0xFF;
	}
	
	//Find all valid addresses and load them to buffer
	for(j=0; j < _EEPROM_PAGE_COUNT; j++) {
	for(i=0; i < _EEPROM_PAGE_SIZE; i++) {
			if(getValid((eeSeg)eedata_addr[j][i]) && !getTaken((eeSeg)eedata_addr[j][i])) {
				tempAddress = getAddress((eeSeg)eedata_addr[j][i]);
				buffer[tempAddress] = getData((eeSeg)eedata_addr[j][i]);
			}
		}
	}
}

/* ------------------------------------------------------------ */
/***	getBuffer
**
**	Parameters:
**		eeprom	- pointer to flash memory acting as emulated EEPROM
**		buffer	- pointer to buffer
**
**	Return Value:
**		Returns true if the operation was successful, false otherwise
**
**	Errors:
**		none
**
**	Description:
**		Searches through buffer and writes all non 0xFF values to
**		to EEPROM using the index as the address
*/
void getBuffer(uint8_t * buffer)
{
	eeSeg tempSeg;
	uint8_t tempData;

 	int i;

	//Cycle through buffer
	for(i=0; i < max_address; i++)
	{
		//If data in buffer does not equal 0xFF write to flash
//		if(buffer[i] != 0xFF) {
			tempData = buffer[i];
			tempSeg = pack(i, tempData);
			writeFlashWord((void*)&eedata_addr[0][i],tempSeg.data);
//		}
	}
}

/* ------------------------------------------------------------ */
/***	pack
**
**	Parameters:
**		address	- address of data to be packed 
**		data	- data to be packed
**
**	Return Value:
**		Returns eeSeg packed with given address and data
**
**	Errors:
**		none
**
**	Description:
**		Packs address and data and sets taken bit to 0 then
**		returns it as a eeSeg type.
*/
eeSeg pack(uint32_t address, uint8_t data)
{
	eeSeg tempSeg;

	//Clear segment
	tempSeg.data = 0xFFFFFFFF;

	tempSeg.temp.taken = 0;
	tempSeg.temp.address = address;
	tempSeg.temp.data = data;

	return tempSeg;
}

uint32_t getAddress(eeSeg segment)
{
	if (segment.temp.address < max_address) {
	return segment.temp.address;
	} 
	else {
		return max_address;
	}
}

uint8_t getData(eeSeg segment)
{
	return segment.temp.data;
}

BOOL getValid(eeSeg segment)
{
	return segment.temp.valid;
}

BOOL getTaken(eeSeg segment)
{
	return segment.temp.taken;
}
