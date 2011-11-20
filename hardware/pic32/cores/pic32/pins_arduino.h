//************************************************************************
//*	pins_arduino.h
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

#if !defined(PINS_ARDUINO_H)
#define PINS_ARDUINO_H

/* ------------------------------------------------------------ */
/*					General Declarations						*/
/* ------------------------------------------------------------ */
/* The following declarations are invariant between boards and
** define symbols used by the board definition files.
*/

#define _BV(bit) (1ul << (bit))

#if defined(OPT_BOARD_INTERNAL)

/* Symbols used in pin mapping.
*/
#define	NOT_A_PIN		0
#define	NOT_A_PORT		0
#define	NOT_ON_TIMER	0
#define	NOT_ANALOG_PIN	0xFF

/* Define the port symbols used to index into the port address and
** bit tables.
*/
#define _IOPORT_PA	1
#define _IOPORT_PB	2
#define _IOPORT_PC	3
#define _IOPORT_PD	4
#define _IOPORT_PE	5
#define _IOPORT_PF	6
#define _IOPORT_PG	7

/* Symbols to define the bit position of the timer fields within the
** timer mapping table.
*/
#define _BN_TIMER_OC	0
#define	_BN_TIMER_IC	4
#define _BN_TIMER_TCK	8

#define	_MSK_TIMER_OC	0x000F
#define	_MSK_TIMER_IC	0x00F0
#define	_MSK_TIMER_TCK	0x0F00
		
/* Symbols used for timer related peripherals. These are used in
** the table that maps digital pin to timer related pin.
*/
#define	_TIMER_OC1		(1 << _BN_TIMER_OC)
#define	_TIMER_OC2		(2 << _BN_TIMER_OC)
#define	_TIMER_OC3		(3 << _BN_TIMER_OC)
#define	_TIMER_OC4		(4 << _BN_TIMER_OC)
#define	_TIMER_OC5		(5 << _BN_TIMER_OC)

#define	_TIMER_IC1		(1 << _BN_TIMER_IC)
#define	_TIMER_IC2		(2 << _BN_TIMER_IC)
#define	_TIMER_IC3		(3 << _BN_TIMER_IC)
#define	_TIMER_IC4		(4 << _BN_TIMER_IC)
#define	_TIMER_IC5		(5 << _BN_TIMER_IC)

#define	_TIMER_TCK1		(1 << _BN_TIMER_TCK)
#define	_TIMER_TCK2		(2 << _BN_TIMER_TCK)
#define	_TIMER_TCK3		(3 << _BN_TIMER_TCK)
#define	_TIMER_TCK4		(4 << _BN_TIMER_TCK)
#define	_TIMER_TCK5		(5 << _BN_TIMER_TCK)

/* Analog pin definition symbols. Used in the digital pin
** to analog pin mapping table.
*/
#define	_BOARD_AN0		0
#define	_BOARD_AN1		1
#define	_BOARD_AN2		2
#define	_BOARD_AN3		3
#define	_BOARD_AN4		4
#define	_BOARD_AN5		5
#define	_BOARD_AN6		6
#define	_BOARD_AN7		7
#define	_BOARD_AN8		8
#define	_BOARD_AN9		9
#define	_BOARD_AN10		10
#define	_BOARD_AN11		11
#define	_BOARD_AN12		12
#define	_BOARD_AN13		13
#define	_BOARD_AN14		14
#define	_BOARD_AN15		15

#endif		//OPT_BOARD_INTERNAL

/* ------------------------------------------------------------ */
/* Include the board definition file for the specified variant.
*/

#include <Board_Defs.h>

/* ------------------------------------------------------------ */

#endif		// PINS_ARDUINO_H
