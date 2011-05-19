/*
  EEPROM.cpp - EEPROM library
  Copyright (c) 2006 David A. Mellis.  All right reserved.

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

/******************************************************************************
 * Includes
 ******************************************************************************/

extern "C" {
#include "dee_emulation_pic32.h"
}

#include "EEPROM.h"

/******************************************************************************
 * Definitions
 ******************************************************************************/

/******************************************************************************
 * Constructors
 ******************************************************************************/
EEPROMClass::EEPROMClass()
{
	DataEEInit();
}
/******************************************************************************
 * User API
 ******************************************************************************/

unsigned int EEPROMClass::read(unsigned int address)
{
	unsigned int data;
	DataEERead(&data,address);
	return data;
}

void EEPROMClass::write(unsigned int address, unsigned int value)
{
	DataEEWrite(value,address);
}

EEPROMClass EEPROM;
