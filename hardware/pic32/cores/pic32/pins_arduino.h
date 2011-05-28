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
//************************************************************************

#ifndef Pins_Arduino_h
#define Pins_Arduino_h
#define _BV(bit) (1ul << (bit))

#define PA 1
#define PB 2
#define PC 3
#define PD 4
#define PE 5
#define PF 6
#define PG 7


#define	NOT_A_PIN		0
#define	NOT_A_PORT		0
#define	NOT_ON_TIMER	0

//*	these are PIC32 timer definitions
#define	NOT_ON_TIMER	0
#define	TIMER_OC1		1
#define	TIMER_OC2		2
#define	TIMER_OC3		3
#define	TIMER_OC4		4
#define	TIMER_OC5		5


//*	these are AVR timer definitions
//#define NOT_ON_TIMER 0
#define TIMER0A 1
#define TIMER0B 2
#define TIMER1A 3
#define TIMER1B 4
#define TIMER2  5
#define TIMER2A 6
#define TIMER2B 7

#define TIMER3A 8
#define TIMER3B 9
#define TIMER3C 10
#define TIMER4A 11
#define TIMER4B 12
#define TIMER4C 13
#define TIMER5A 14
#define TIMER5B 15
#define TIMER5C 16


// On the ATmega1280, the addresses of some of the port registers are
// greater than 255, so we can't store them in uint8_t's.
extern const uint32_t	port_to_mode_PGM[];
extern const uint32_t	port_to_input_PGM[];
extern const uint32_t	port_to_output_PGM[];
extern const uint8_t	analog_pin_to_channel_PGM[];

extern const uint8_t	digital_pin_to_port_PGM[];

// extern const uint8_t PROGMEM digital_pin_to_bit_PGM[];
extern const uint16_t	digital_pin_to_bit_mask_PGM[];
extern const uint8_t	digital_pin_to_timer_PGM[];

// Get the bit location within the hardware port of the given virtual pin.
// This comes from the pins_*.c file for the active board configuration.
//
// These perform slightly better as macros compared to inline functions
//
#define digitalPinToPort(P) ( digital_pin_to_port_PGM[P]  )
#define digitalPinToBitMask(P) ( digital_pin_to_bit_mask_PGM[P]  )
#define digitalPinToTimer(P) ( digital_pin_to_timer_PGM[P]  )
#define analogInPinToBit(P) ( analog_pin_to_channel_PGM[P]  )
#define portOutputRegister(P) ( (volatile uint32_t *)(  port_to_output_PGM[P]) )
#define portInputRegister(P) ( (volatile uint32_t *)(  port_to_input_PGM[P]) )
#define portModeRegister(P) ( (volatile uint32_t *)(  port_to_mode_PGM[P]) )

#endif
