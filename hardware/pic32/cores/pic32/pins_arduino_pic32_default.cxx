//************************************************************************
//*	pins_arduino_pic32_default.cxx
//*
//*	Arduino core files for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
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
//*	May  5,	2011	<MLS> added analog_pin_to_channel_PGM
//*	Aug  2,	2011	<MLS> Made pin numbering for default to always include all ports even if they dont exist
//*						this way the pin numbers always stay the same
//************************************************************************

//************************************************************************
const uint8_t	digital_pin_to_port_PGM[] = {
	// PORTLIST
	// -------------------------------------------
#ifdef _PORTA
	PA,		// 0 RA 0
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
	PA,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTB
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
	PB,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTC
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
	PC,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTD
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
	PD,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTE
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
	PE,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTF
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
	PF,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

#ifdef _PORTG
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
	PG,
#else
	NOT_A_PIN,	//	0
	NOT_A_PIN,	//	1
	NOT_A_PIN,	//	2
	NOT_A_PIN,	//	3
	NOT_A_PIN,	//	4
	NOT_A_PIN,	//	5
	NOT_A_PIN,	//	6
	NOT_A_PIN,	//	7
	NOT_A_PIN,	//	8
	NOT_A_PIN,	//	9
	NOT_A_PIN,	//	10
	NOT_A_PIN,	//	11
	NOT_A_PIN,	//	12
	NOT_A_PIN,	//	13
	NOT_A_PIN,	//	14
	NOT_A_PIN,	//	15
#endif

};

//************************************************************************
const uint16_t PROGMEM digital_pin_to_bit_mask_PGM[] = 
{
	// PIN IN PORT
	// -------------------------------------------
//#ifdef _PORTA
	_BV( 0 ) ,	// 0 RA 0
	_BV( 1 ) ,	// 1 RA 1
	_BV( 2 ) ,	// 2 RA 2
	_BV( 3 ) ,	// 3 RA 3
	_BV( 4 ) ,	// 4 RA 4
	_BV( 5 ) ,	// 5 RA 5
	_BV( 6 ) ,	// 6 RA 6
	_BV( 7 ) ,	// 7 RA 7
	_BV( 8 ) ,	// 8 RA 8
	_BV( 9 ) ,	// 9 RA 9
	_BV( 10 ) ,	// 10 RA 10
	_BV( 11 ) ,	// 11 RA 11
	_BV( 12 ) ,	// 12 RA 12
	_BV( 13 ) ,	// 13 RA 13
	_BV( 14 ) ,	// 14 RA 14
	_BV( 15 ) ,	// 15 RA 15
//#endif

//#ifdef _PORTB
	_BV( 0 ) ,	// 0 RB 0
	_BV( 1 ) ,	// 1 RB 1
	_BV( 2 ) ,	// 2 RB 2
	_BV( 3 ) ,	// 3 RB 3
	_BV( 4 ) ,	// 4 RB 4
	_BV( 5 ) ,	// 5 RB 5
	_BV( 6 ) ,	// 6 RB 6
	_BV( 7 ) ,	// 7 RB 7
	_BV( 8 ) ,	// 8 RB 8
	_BV( 9 ) ,	// 9 RB 9
	_BV( 10 ) ,	// 10 RB 10
	_BV( 11 ) ,	// 11 RB 11
	_BV( 12 ) ,	// 12 RB 12
	_BV( 13 ) ,	// 13 RB 13
	_BV( 14 ) ,	// 14 RB 14
	_BV( 15 ) ,	// 15 RB 15
//#endif

//#ifdef _PORTC
	_BV( 0 ) ,	// 0 RC 0
	_BV( 1 ) ,	// 1 RC 1
	_BV( 2 ) ,	// 2 RC 2
	_BV( 3 ) ,	// 3 RC 3
	_BV( 4 ) ,	// 4 RC 4
	_BV( 5 ) ,	// 5 RC 5
	_BV( 6 ) ,	// 6 RC 6
	_BV( 7 ) ,	// 7 RC 7
	_BV( 8 ) ,	// 8 RC 8
	_BV( 9 ) ,	// 9 RC 9
	_BV( 10 ) ,	// 10 RC 10
	_BV( 11 ) ,	// 11 RC 11
	_BV( 12 ) ,	// 12 RC 12
	_BV( 13 ) ,	// 13 RC 13
	_BV( 14 ) ,	// 14 RC 14
	_BV( 15 ) ,	// 15 RC 15
//#endif

//#ifdef _PORTD
	_BV( 0 ) ,	// 0 RD 0
	_BV( 1 ) ,	// 1 RD 1
	_BV( 2 ) ,	// 2 RD 2
	_BV( 3 ) ,	// 3 RD 3
	_BV( 4 ) ,	// 4 RD 4
	_BV( 5 ) ,	// 5 RD 5
	_BV( 6 ) ,	// 6 RD 6
	_BV( 7 ) ,	// 7 RD 7
	_BV( 8 ) ,	// 8 RD 8
	_BV( 9 ) ,	// 9 RD 9
	_BV( 10 ) ,	// 10 RD 10
	_BV( 11 ) ,	// 11 RD 11
	_BV( 12 ) ,	// 12 RD 12
	_BV( 13 ) ,	// 13 RD 13
	_BV( 14 ) ,	// 14 RD 14
	_BV( 15 ) ,	// 15 RD 15
//#endif

//#ifdef _PORTE
	_BV( 0 ) ,	// 0 RE 0
	_BV( 1 ) ,	// 1 RE 1
	_BV( 2 ) ,	// 2 RE 2
	_BV( 3 ) ,	// 3 RE 3
	_BV( 4 ) ,	// 4 RE 4
	_BV( 5 ) ,	// 5 RE 5
	_BV( 6 ) ,	// 6 RE 6
	_BV( 7 ) ,	// 7 RE 7
	_BV( 8 ) ,	// 8 RE 8
	_BV( 9 ) ,	// 9 RE 9
	_BV( 10 ) ,	// 10 RE 10
	_BV( 11 ) ,	// 11 RE 11
	_BV( 12 ) ,	// 12 RE 12
	_BV( 13 ) ,	// 13 RE 13
	_BV( 14 ) ,	// 14 RE 14
	_BV( 15 ) ,	// 15 RE 15
//#endif

//#ifdef _PORTF
	_BV( 0 ) ,	// 0 RF 0
	_BV( 1 ) ,	// 1 RF 1
	_BV( 2 ) ,	// 2 RF 2
	_BV( 3 ) ,	// 3 RF 3
	_BV( 4 ) ,	// 4 RF 4
	_BV( 5 ) ,	// 5 RF 5
	_BV( 6 ) ,	// 6 RF 6
	_BV( 7 ) ,	// 7 RF 7
	_BV( 8 ) ,	// 8 RF 8
	_BV( 9 ) ,	// 9 RF 9
	_BV( 10 ) ,	// 10 RF 10
	_BV( 11 ) ,	// 11 RF 11
	_BV( 12 ) ,	// 12 RF 12
	_BV( 13 ) ,	// 13 RF 13
	_BV( 14 ) ,	// 14 RF 14
	_BV( 15 ) ,	// 15 RF 15
//#endif

//#ifdef _PORTG
	_BV( 0 ) ,	// 0 RG 0
	_BV( 1 ) ,	// 1 RG 1
	_BV( 2 ) ,	// 2 RG 2
	_BV( 3 ) ,	// 3 RG 3
	_BV( 4 ) ,	// 4 RG 4
	_BV( 5 ) ,	// 5 RG 5
	_BV( 6 ) ,	// 6 RG 6
	_BV( 7 ) ,	// 7 RG 7
	_BV( 8 ) ,	// 8 RG 8
	_BV( 9 ) ,	// 9 RG 9
	_BV( 10 ) ,	// 10 RG 10
	_BV( 11 ) ,	// 11 RG 11
	_BV( 12 ) ,	// 12 RG 12
	_BV( 13 ) ,	// 13 RG 13
	_BV( 14 ) ,	// 14 RG 14
	_BV( 15 ) ,	// 15 RG 15
//#endif


};

//************************************************************************
//* TODO implement for PIC32
const uint8_t PROGMEM digital_pin_to_timer_PGM[] = {
	// TIMERS
	// -------------------------------------------
//#ifdef _PORTA
	NOT_ON_TIMER ,	// 0 RA 0
	NOT_ON_TIMER ,	// 1 RA 1
	NOT_ON_TIMER ,	// 2 RA 2
	NOT_ON_TIMER ,	// 3 RA 3
	NOT_ON_TIMER ,	// 4 RA 4
	NOT_ON_TIMER ,	// 5 RA 5
	NOT_ON_TIMER ,	// 6 RA 6
	NOT_ON_TIMER ,	// 7 RA 7
	NOT_ON_TIMER ,	// 8 RA 8
	NOT_ON_TIMER ,	// 9 RA 9
	NOT_ON_TIMER ,	// 10 RA 10
	NOT_ON_TIMER,	// 11 RA 11
	NOT_ON_TIMER ,	// 12 RA 12
	NOT_ON_TIMER ,	// 13 RA 13
	NOT_ON_TIMER ,	// 14 RA 14
	NOT_ON_TIMER ,	// 15 RA 15
//#endif

//#ifdef _PORTB
	NOT_ON_TIMER ,	// 0 RB 0
	NOT_ON_TIMER ,	// 1 RB 1
	NOT_ON_TIMER ,	// 2 RB 2
	NOT_ON_TIMER ,	// 3 RB 3
	NOT_ON_TIMER ,	// 4 RB 4
	NOT_ON_TIMER ,	// 5 RB 5
	NOT_ON_TIMER ,	// 6 RB 6
	NOT_ON_TIMER ,	// 7 RB 7
	NOT_ON_TIMER ,	// 8 RB 8
	NOT_ON_TIMER ,	// 9 RB 9
	NOT_ON_TIMER ,	// 10 RB 10
	NOT_ON_TIMER,	// 11 RB 11
	NOT_ON_TIMER ,	// 12 RB 12
	NOT_ON_TIMER ,	// 13 RB 13
	NOT_ON_TIMER ,	// 14 RB 14
	NOT_ON_TIMER ,	// 15 RB 15
//#endif

//#ifdef _PORTC
	NOT_ON_TIMER ,	// 0 RC 0
	NOT_ON_TIMER ,	// 1 RC 1
	NOT_ON_TIMER ,	// 2 RC 2
	NOT_ON_TIMER ,	// 3 RC 3
	NOT_ON_TIMER ,	// 4 RC 4
	NOT_ON_TIMER ,	// 5 RC 5
	NOT_ON_TIMER ,	// 6 RC 6
	NOT_ON_TIMER ,	// 7 RC 7
	NOT_ON_TIMER ,	// 8 RC 8
	NOT_ON_TIMER ,	// 9 RC 9
	NOT_ON_TIMER ,	// 10 RC 10
	NOT_ON_TIMER,	// 11 RC 11
	NOT_ON_TIMER ,	// 12 RC 12
	NOT_ON_TIMER ,	// 13 RC 13
	NOT_ON_TIMER ,	// 14 RC 14
	NOT_ON_TIMER ,	// 15 RC 15
//#endif

//#ifdef _PORTD
	TIMER_OC1 ,		// 0 RD 0
	TIMER_OC2 ,		// 1 RD 1
	TIMER_OC3 ,		// 2 RD 2
	TIMER_OC4 ,		// 3 RD 3
	TIMER_OC5 ,		// 4 RD 4
	NOT_ON_TIMER ,	// 5 RD 5
	NOT_ON_TIMER ,	// 6 RD 6
	NOT_ON_TIMER ,	// 7 RD 7
	NOT_ON_TIMER ,	// 8 RD 8
	NOT_ON_TIMER ,	// 9 RD 9
	NOT_ON_TIMER ,	// 10 RD 10
	NOT_ON_TIMER,	// 11 RD 11
	NOT_ON_TIMER ,	// 12 RD 12
	NOT_ON_TIMER ,	// 13 RD 13
	NOT_ON_TIMER ,	// 14 RD 14
	NOT_ON_TIMER ,	// 15 RD 15
//#endif

//#ifdef _PORTE
	NOT_ON_TIMER ,	// 0 RE 0
	NOT_ON_TIMER ,	// 1 RE 1
	NOT_ON_TIMER ,	// 2 RE 2
	NOT_ON_TIMER ,	// 3 RE 3
	NOT_ON_TIMER ,	// 4 RE 4
	NOT_ON_TIMER ,	// 5 RE 5
	NOT_ON_TIMER ,	// 6 RE 6
	NOT_ON_TIMER ,	// 7 RE 7
	NOT_ON_TIMER ,	// 8 RE 8
	NOT_ON_TIMER ,	// 9 RE 9
	NOT_ON_TIMER ,	// 10 RE 10
	NOT_ON_TIMER,	// 11 RE 11
	NOT_ON_TIMER ,	// 12 RE 12
	NOT_ON_TIMER ,	// 13 RE 13
	NOT_ON_TIMER ,	// 14 RE 14
	NOT_ON_TIMER ,	// 15 RE 15
//#endif

//#ifdef _PORTF
	NOT_ON_TIMER ,	// 0 RF 0
	NOT_ON_TIMER ,	// 1 RF 1
	NOT_ON_TIMER ,	// 2 RF 2
	NOT_ON_TIMER ,	// 3 RF 3
	NOT_ON_TIMER ,	// 4 RF 4
	NOT_ON_TIMER ,	// 5 RF 5
	NOT_ON_TIMER ,	// 6 RF 6
	NOT_ON_TIMER ,	// 7 RF 7
	NOT_ON_TIMER ,	// 8 RF 8
	NOT_ON_TIMER ,	// 9 RF 9
	NOT_ON_TIMER ,	// 10 RF 10
	NOT_ON_TIMER,	// 11 RF 11
	NOT_ON_TIMER ,	// 12 RF 12
	NOT_ON_TIMER ,	// 13 RF 13
	NOT_ON_TIMER ,	// 14 RF 14
	NOT_ON_TIMER ,	// 15 RF 15
//#endif

//#ifdef _PORTG
	NOT_ON_TIMER ,	// 0 RG 0
	NOT_ON_TIMER ,	// 1 RG 1
	NOT_ON_TIMER ,	// 2 RG 2
	NOT_ON_TIMER ,	// 3 RG 3
	NOT_ON_TIMER ,	// 4 RG 4
	NOT_ON_TIMER ,	// 5 RG 5
	NOT_ON_TIMER ,	// 6 RG 6
	NOT_ON_TIMER ,	// 7 RG 7
	NOT_ON_TIMER ,	// 8 RG 8
	NOT_ON_TIMER ,	// 9 RG 9
	NOT_ON_TIMER ,	// 10 RG 10
	NOT_ON_TIMER,	// 11 RG 11
	NOT_ON_TIMER ,	// 12 RG 12
	NOT_ON_TIMER ,	// 13 RG 13
	NOT_ON_TIMER ,	// 14 RG 14
	NOT_ON_TIMER ,	// 15 RG 15
//#endif
};


//************************************************************************
//*	the UNO board does not have a 1 to 1 mapping of analog pins, therefore we need
//*	a mpping table, this is the default, 1 to 1 mapping
//************************************************************************
const uint8_t PROGMEM analog_pin_to_channel_PGM[] = {
			//*	Arduino Pin		PIC32 Analog channel
	0,		//*	A0				1 to 1 mapping
	1,		//*	A1
	2,		//*	A2
	3,		//*	A3
	4,		//*	A4
	5,		//*	A5
	6,		//*	A6
	7,		//*	A7
	8,		//*	A8
	9,		//*	A9
	10,		//*	A10
	11,		//*	A11
	12,		//*	A12
	13,		//*	A13
	14,		//*	A14
	15,		//*	A15

};
