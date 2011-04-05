//************************************************************************
//*	Pins_arduino_pic32.c
//*
//*	Arduino core files for PIC32
//*		Copyright (c) 2010 by Mark Sproul
//*	
//*	pins_arduino.c - pin definitions for the Arduino board
//*	Part of Arduino / Wiring libraries
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*	See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA  02111-1307  USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	<MLS> Got MPLAB X working on MacOSX 1.6 for the first time
//*	Oct 20,	2010	<MLS> First phase of Arduino port working
//************************************************************************

#include <p32xxxx.h>
#include "wiring_private.h"
#include "pins_arduino.h"




//************************************************************************
const uint32_t port_to_mode_PGM[] = 
{
	NOT_A_PORT,
#ifdef _PORTA
	(uint32_t)&TRISA,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTB
	(uint32_t)&TRISB,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTC
	(uint32_t)&TRISC,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTD
	(uint32_t)&TRISD,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTE
	(uint32_t)&TRISE,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTF
	(uint32_t)&TRISF,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTG
	(uint32_t)&TRISG,
#else
	NOT_A_PORT,
#endif
	NOT_A_PORT,
};

//************************************************************************
//*	LAT and PORT function identically for writing.  
//*	Reading from PORT gives you a snapshot of the actual pins state regardless of how, 
//*	if at all, the PIC is trying to drive them.  
//*	Reading from LAT gives you the values last written to the pins, whether thru LAT or PORT.
//************************************************************************
const uint32_t PROGMEM port_to_output_PGM[] = 
{
	NOT_A_PORT,
#ifdef _PORTA
	(uint32_t)&LATA,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTB
	(uint32_t)&LATB,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTC
	(uint32_t)&LATC,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTD
	(uint32_t)&LATD,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTE
	(uint32_t)&LATE,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTF
	(uint32_t)&LATF,
#else
	NOT_A_PORT,
#endif
#ifdef _PORTG
	(uint32_t)&LATG,
#else
	NOT_A_PORT,
#endif
	NOT_A_PORT,
};

//************************************************************************
const uint32_t port_to_input_PGM[] = 
{
	NOT_A_PIN,
#ifdef _PORTA
	(uint32_t)&PORTA,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTB
	(uint32_t)&PORTB,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTC
	(uint32_t)&PORTC,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTD
	(uint32_t)&PORTD,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTE
	(uint32_t)&PORTE,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTF
	(uint32_t)&PORTF,
#else
	NOT_A_PIN,
#endif
#ifdef _PORTG
	(uint32_t)&PORTG,
#else
	NOT_A_PIN,
#endif
	NOT_A_PIN,
};


//************************************************************************


#if defined (_BOARD_MEGA_)
	#include	"pins_arduino_pic32_mega.cxx"
#elif defined (_BOARD_UNO_)
	#include	"pins_arduino_pic32_uno.cxx"
#elif defined (_BOARD_CEREBOT_32MX4_)
	#include	"pins_arduino_pic32_cerebot32mx4.cxx"
#else
	#include	"pins_arduino_pic32_default.cxx"
#endif
