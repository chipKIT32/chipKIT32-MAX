//************************************************************************
//*	Pins_arduinohc
//*
//*	Arduino core files for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
//*	
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	pins_arduino.h - Pin definition functions for Arduino
//*	Part of Arduino - http://www.arduino.cc/
//*	
//*	
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
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA  02111-1307  USA
//************************************************************************
//*	Edit History
//************************************************************************
//*	May  5,	2011	<MLS> added analog_pin_to_channel_PGM
//* Nov 12, 2001	<GeneApperson> Rewrite for board variant support
//************************************************************************

#define OPT_BOARD_INTERNAL
#define OPT_BOARD_DATA
#include <p32xxxx.h>
#include "pins_arduino.h"

