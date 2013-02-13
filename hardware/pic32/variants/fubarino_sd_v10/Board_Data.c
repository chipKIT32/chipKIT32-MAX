/************************************************************************/
/*																		*/
/*	Board_Data.c --	Default Board Customization Data Declarations		*/
/*																		*/
/************************************************************************/
/*	Author: Gene Apperson												*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declartions and data structure	*/
/* to customize the chipKIT MPIDE for use with a generic board using a	*/
/* PIC32 part in a 64-pin package.										*/
/*																		*/
/* This code is based on earlier work:									*/
/*		Copyright (c) 2010, 2011 by Mark Sproul							*/
/*		Copyright (c) 2005, 2006 by David A. Mellis						*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	11/28/2011(GeneA): Created by splitting data out of Board_Defs.h	*/
/*  03/11/2012(BrianS): Modified for Fubarino board                     */
/*	02/12/2013(GeneA): removed dependency on Microchip plib library		*/
/*																		*/
/************************************************************************/
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
/************************************************************************/

#if !defined(BOARD_DATA_C)
#define BOARD_DATA_C

#include <inttypes.h>

/* ------------------------------------------------------------ */
/*					Data Tables									*/
/* ------------------------------------------------------------ */
/* The following declarations define data used in pin mapping.	*/
/* ------------------------------------------------------------ */

#if defined(OPT_BOARD_DATA)

/* ------------------------------------------------------------ */
/* This table is used to map from port number to the address of
** the TRIS register for the port. This is used for setting the
** pin direction.
*/
const uint32_t	port_to_tris_PGM[] = {
	NOT_A_PORT,				//index value 0 is not used

#if defined(_PORTA)
	(uint32_t)&TRISA,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTB)
	(uint32_t)&TRISB,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTC)
	(uint32_t)&TRISC,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTD)
	(uint32_t)&TRISD,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTE)
	(uint32_t)&TRISE,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTF)
	(uint32_t)&TRISF,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTG)
	(uint32_t)&TRISG,
#else
	NOT_A_PORT,
#endif

	NOT_A_PORT,
};

/* ------------------------------------------------------------ */
/* This table is used to map the digital pin number to the port
** containing that pin. The default mapping is to assign pin numbers
** for every possible port bit in order from PORTA to PORTG.
*/
const uint8_t	digital_pin_to_port_PGM[] = {
    // Pins 1 through 24
	NOT_A_PIN,  //  0  not a pin
    _IOPORT_PD, //  1  RD8
	_IOPORT_PD, //  2  RD9
	_IOPORT_PD, //  3  RD10
	_IOPORT_PD, //  4  RD11
	_IOPORT_PD, //  5  RD0
	_IOPORT_PC, //  6  RC13
	_IOPORT_PC, //  7  RC14
	_IOPORT_PD, //  8  RD1
	_IOPORT_PD, //  9  RD2
	_IOPORT_PD, // 10  RD3
	_IOPORT_PD, // 11  RD4
	_IOPORT_PD, // 12  RD5
	_IOPORT_PD, // 13  RD6
	_IOPORT_PD, // 14  RD7
	_IOPORT_PF, // 15  RF0
	_IOPORT_PF, // 16  RF1
	_IOPORT_PE, // 17  RE0
	_IOPORT_PE, // 18  RE2
	_IOPORT_PE, // 19  RE3
	_IOPORT_PE, // 20  RE4
	_IOPORT_PE, // 21  RE5
	_IOPORT_PE, // 22  RE6
	_IOPORT_PE, // 23  RE7
	_IOPORT_PG, // 24  RG6

    // Pins 25 through 46
    _IOPORT_PG, // 25  RG7
	_IOPORT_PG, // 26  RG8
	_IOPORT_PG, // 27  RG9
	_IOPORT_PF, // 28  RF4
	_IOPORT_PF, // 29  RF5
	_IOPORT_PB, // 30  RB5
	_IOPORT_PB, // 31  RB4
	_IOPORT_PB, // 32  RB3
	_IOPORT_PB, // 33  RB2
	_IOPORT_PB, // 34  RB1
	_IOPORT_PB, // 35  RB0
	_IOPORT_PB, // 36  RB7
	_IOPORT_PB, // 37  RB6
	_IOPORT_PB, // 38  RB8
	_IOPORT_PB, // 39  RB9
	_IOPORT_PB, // 40  RB10
	_IOPORT_PB, // 41  RB11
	_IOPORT_PB, // 42  RB12
	_IOPORT_PB, // 43  RB13
	_IOPORT_PB, // 44  RB14
	_IOPORT_PB, // 45  RB15
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t	digital_pin_to_bit_mask_PGM[] = {
	_BV( 0 ) ,	//  0  not a pin
	_BV( 8 ) ,	//  1  RD8
	_BV( 9 ) ,	//  2  RD9
	_BV( 10 ) ,	//  3  RD10
	_BV( 11 ) ,	//  4  RD11
	_BV( 0 ) ,	//  5  RD0
	_BV( 13 ) ,	//  6  RC13
	_BV( 14 ) ,	//  7  RC14
	_BV( 1 ) ,	//  8  RD1
	_BV( 2 ) ,	//  9  RD2
	_BV( 3 ) ,	// 10  RD3
	_BV( 4 ) ,	// 11  RD4
	_BV( 5 ) ,	// 12  RD5
	_BV( 6 ) ,	// 13  RD6
	_BV( 7 ) ,	// 14  RD7
	_BV( 0 ) ,	// 15  RF0
	_BV( 1 ) ,	// 16  RF1
	_BV( 0 ) ,	// 17  RE0
	_BV( 2 ) ,	// 18  RE2
	_BV( 3 ) ,	// 19  RE3
	_BV( 4 ) ,	// 20  RE4
	_BV( 5 ) ,	// 21  RE5
	_BV( 6 ) ,	// 22  RE6
	_BV( 7 ) ,	// 23  RE7
	_BV( 6 ) ,	// 24  RG6
	_BV( 7 ) ,	// 25  RG7
	_BV( 8 ) ,	// 26  RG8
	_BV( 9 ) ,	// 27  RG9
	_BV( 4 ) ,	// 28  RF4
	_BV( 5 ) ,	// 29  RF5
	_BV( 5 ) ,	// 30  RB5
	_BV( 4 ) ,	// 31  RB4
	_BV( 3 ) ,	// 32  RB3
	_BV( 2 ) ,	// 33  RB2
	_BV( 1 ) ,	// 34  RB1
	_BV( 0 ) ,	// 35  RB0
	_BV( 6 ) ,	// 36  RB6
	_BV( 7 ) ,	// 37  RB7
	_BV( 8 ) ,	// 38  RB8
	_BV( 9 ) ,	// 39  RB9
	_BV( 10 ) ,	// 40  RB10
	_BV( 11 ) ,	// 41  RB11
	_BV( 12 ) ,	// 42  RB12
	_BV( 13 ) ,	// 43  RB13
	_BV( 14 ) ,	// 44  RB14
	_BV( 15 ) ,	// 45  RB15
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number, input capture number, and timer external clock
** input associated with that pin.
*/
const uint8_t	digital_pin_to_timer_PGM[] = {
	NOT_ON_TIMER ,	// 0  not a pin
	_TIMER_IC1 ,	// 1  RD8
	_TIMER_IC2 ,	// 2  RD9
	_TIMER_IC3 ,	// 3  RD10
	_TIMER_IC4 ,	// 4  RD11
	_TIMER_OC1 ,	// 5  RD0
	NOT_ON_TIMER ,	// 6  RC13
	_TIMER_TCK1 ,	// 7  RC14
	_TIMER_OC2 ,	// 8  RD1
	_TIMER_OC3 ,	// 9  RD2
	_TIMER_OC4 ,	// 10 RD3
	_TIMER_OC5 | _TIMER_IC5,    // 11 RD4
	NOT_ON_TIMER ,	// 12 RD5
	NOT_ON_TIMER ,	// 13 RD6
	NOT_ON_TIMER ,	// 14 RD7
	NOT_ON_TIMER ,	// 15 RF0
	NOT_ON_TIMER ,	// 16 RF1
	NOT_ON_TIMER ,	// 17 RE0
	NOT_ON_TIMER ,	// 18 RE2
	NOT_ON_TIMER ,	// 19 RE3
	NOT_ON_TIMER ,	// 20 RE4
	NOT_ON_TIMER ,	// 21 RE5
	NOT_ON_TIMER ,	// 22 RE6
	NOT_ON_TIMER ,	// 23 RE7
	NOT_ON_TIMER ,	// 24 RG6
	NOT_ON_TIMER ,	// 25 RG7
	NOT_ON_TIMER ,	// 26 RG8
	NOT_ON_TIMER ,	// 27 RG9
	NOT_ON_TIMER ,	// 28 RF4
	NOT_ON_TIMER ,	// 29 RF5
	NOT_ON_TIMER ,	// 30 RB5
	NOT_ON_TIMER ,	// 21 RB4
	NOT_ON_TIMER ,	// 32 RB3
	NOT_ON_TIMER ,	// 33 RB2
	NOT_ON_TIMER ,	// 34 RB1
	NOT_ON_TIMER ,	// 35 RB0
	NOT_ON_TIMER ,	// 36 RB7
	NOT_ON_TIMER ,	// 37 RB6
	NOT_ON_TIMER ,	// 38 RB8
	NOT_ON_TIMER ,	// 39 RB9
	NOT_ON_TIMER ,	// 40 RB10
	NOT_ON_TIMER ,	// 41 RB11
	NOT_ON_TIMER ,	// 42 RB12
	NOT_ON_TIMER ,	// 43 RB13
	NOT_ON_TIMER ,	// 44 RB14
	NOT_ON_TIMER ,	// 45 RB15
};

/* ------------------------------------------------------------ */
/* This table maps from a digital pin number to the corresponding
** analog pin number.
*/
//#if defined(_NOT_USED_)
const uint8_t digital_pin_to_analog_PGM[] = {
	NOT_ANALOG_PIN,	//   0  not a pin
	NOT_ANALOG_PIN,	//   1  RD8
	NOT_ANALOG_PIN,	//   2  RD9
	NOT_ANALOG_PIN,	//   3  RD10
	NOT_ANALOG_PIN,	//   4  RD11
	NOT_ANALOG_PIN,	//   5  RD0
	NOT_ANALOG_PIN,	//   6  RC13
	NOT_ANALOG_PIN,	//   7  RC14
	NOT_ANALOG_PIN,	//   8  RD1
	NOT_ANALOG_PIN,	//   9  RD2
	NOT_ANALOG_PIN,	//  10  RD3
	NOT_ANALOG_PIN,	//  11  RD4
	NOT_ANALOG_PIN,	//  12  RD5
	NOT_ANALOG_PIN,	//  13  RD6
	NOT_ANALOG_PIN,	//  14  RD7
	NOT_ANALOG_PIN,	//  15  RF0
	NOT_ANALOG_PIN,	//  16  RF1
	NOT_ANALOG_PIN,	//  17  RE0
	NOT_ANALOG_PIN,	//  18  RE2
	NOT_ANALOG_PIN,	//  19  RE3
	NOT_ANALOG_PIN,	//  20  RE4
	NOT_ANALOG_PIN,	//  21  RE5
	NOT_ANALOG_PIN,	//  22  RE6
	NOT_ANALOG_PIN,	//  23  RE7
	NOT_ANALOG_PIN,	//  24  RG6
	NOT_ANALOG_PIN,	//  25  RG7
	NOT_ANALOG_PIN,	//  26  RG8
	NOT_ANALOG_PIN,	//  27  RG9
	NOT_ANALOG_PIN,	//  28  RF4
	NOT_ANALOG_PIN,	//  29  RF5
	NOT_ANALOG_PIN, //  30  RB5   (AN15, not used)
	_BOARD_AN4, 	//  31  RB4   A14
	_BOARD_AN3, 	//  32  RB3   A13
	_BOARD_AN2,	    //  33  RB2   A12
	_BOARD_AN1, 	//  34  RB1   A11
	_BOARD_AN0, 	//  35  RB0   A10
	_BOARD_AN7,	    //  36  RB7   A9
	_BOARD_AN6,	    //  37  RB6   A8
	_BOARD_AN8,	    //  38  RB8   A7
	_BOARD_AN9,	    //  39  RB9   A6
	_BOARD_AN10,    //  40  RB10  A5
	_BOARD_AN11,    //  41  RB11  A4
	_BOARD_AN12,    //  42  RB12  A3
	_BOARD_AN13,    //  43  RB13  A2
	_BOARD_AN14,    //  44  RB14  A1
	_BOARD_AN15,    //  45  RB15  A0
};
//#endif

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
** In the default case, where there is a one-to-one mapping, this
** table isn't needed as the analogInPinToChannel() macro is defined
** to provide the mapping.
*/
//#if defined(_NOT_USED_)
const uint8_t analog_pin_to_channel_PGM[] = {
			//*	Arduino Pin		PIC32 Analog channel
	0,		//*	A0				1 to 1 mapping
	1,		//*	A1
	2,		//*	A2
	3,		//*	A3
	4,		//*	A4
	5,		//*	A5
	7,		//*	A6
	6,		//*	A7
	8,		//*	A8
	9,		//*	A9
	10,		//*	A10
	11,		//*	A11
	12,		//*	A12
	13,		//*	A13
	14,		//*	A14
	15,		//*	A15
};
//#endif

/* ------------------------------------------------------------ */
/*		Include Files for Board Customization Functions			*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */
/*				Board Customization Functions					*/
/* ------------------------------------------------------------ */
/*																*/
/* The following can be used to customize the behavior of some	*/
/* of the core API functions. These provide hooks that can be	*/
/* used to extend or replace the default behavior of the core	*/
/* functions. To use one of these functions, add the desired	*/
/* code to the function skeleton below and then set the value	*/
/* of the appropriate compile switch above to 1. This will		*/
/* cause the hook function to be compiled into the build and	*/
/* to cause the code to call the hook function to be compiled	*/
/* into the appropriate core function.							*/
/*																*/
/* ------------------------------------------------------------ */
/***	_board_init
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
**		This function is called from the core init() function.
**		This can be used to perform any board specific init
**		that needs to be done when the processor comes out of
**		reset and before the user sketch is run.
*/
#if	(OPT_BOARD_INIT != 0)

void _board_init(void) {

	/*	Turn off Secondary oscillator so pins can be used as GPIO
	*/
	OSCCONCLR	=	_OSCCON_SOSCEN_MASK;

}
	

#endif

/* ------------------------------------------------------------ */
/***	_board_pinMode
**
**	Parameters:
**		pin		- digital pin number to configure
**		mode	- mode to which the pin should be configured
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the pinMode
**		function. It can perform any special processing needed
**		when setting the pin mode. If this function returns zero,
**		control will pass through the normal pinMode code. If
**		it returns a non-zero value the normal pinMode code isn't
**		executed.
*/
#if	(OPT_BOARD_DIGITAL_IO != 0)

int	_board_pinMode(uint8_t pin, uint8_t mode) {
	
	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_getPinMode
**
**	Parameters:
**		pin		- digital pin number
**		mode	- pointer to variable to receive mode value
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the getPinMode
**		function. It can perform any special processing needed
**		when getting the pin mode. If this function returns zero,
**		control will pass through the normal getPinMode code. If
**		it returns a non-zero value the normal getPinMode code isn't
**		executed.
*/
#if	(OPT_BOARD_DIGITAL_IO != 0)

int	_board_getPinMode(uint8_t pin, uint8_t * mode) {
	
	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_digitalWrite
**
**	Parameters:
**		pin		- digital pin number
**		val		- value to write to the pin
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the digitalWrite
**		function. It can perform any special processing needed
**		in writing to the pin. If this function returns zero,
**		control will pass through the normal digitalWrite code. If
**		it returns a non-zero value the normal digitalWrite code isn't
**		executed.
*/#if	(OPT_BOARD_DIGITAL_IO != 0)

int	_board_digitalWrite(uint8_t pin, uint8_t val) {
	
	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_digitalRead
**
**	Parameters:
**		pin		- digital pin number
**		val		- pointer to variable to receive pin value
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the digitalRead
**		function. It can perform any special processing needed
**		in reading from the pin. If this function returns zero,
**		control will pass through the normal digitalRead code. If
**		it returns a non-zero value the normal digitalRead code isn't
**		executed.
*/
#if	(OPT_BOARD_DIGITAL_IO != 0)

int	_board_digitalRead(uint8_t pin, uint8_t * val) {
	
	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_analogRead
**
**	Parameters:
**		pin		- analog channel number
**		val		- pointer to variable to receive analog value
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the analogRead
**		function. It can perform any special processing needed
**		in reading from the pin. If this function returns zero,
**		control will pass through the normal analogRead code. If
**		it returns a non-zero value the normal analogRead code isn't
**		executed.
*/
#if (OPT_BOARD_ANALOG_READ != 0)

int	_board_analogRead(uint8_t pin, int * val) {

	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_analogReference
**
**	Parameters:
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the analogReference
**		function. It can perform any special processing needed
**		to set the reference voltage. If this function returns zero,
**		control will pass through the normal analogReference code. If
**		it returns a non-zero value the normal analogReference code isn't
**		executed.
*/
#if (OPT_BOARD_ANALOG_READ != 0)

int	_board_analogReference(uint8_t mode) {

	return 0;

}

#endif

/* ------------------------------------------------------------ */
/***	_board_analogWrite
**
**	Parameters:
**		pin		- pin number
**		val		- analog value to write
**
**	Return Value:
**		Returns 0 if not handled, !0 if handled.
**
**	Errors:
**		none
**
**	Description:
**		This function is called at the beginning of the analogWrite
**		function. It can perform any special processing needed
**		in writing to the pin. If this function returns zero,
**		control will pass through the normal analogWrite code. If
**		it returns a non-zero value the normal analogWrite code isn't
**		executed.
*/
#if (OPT_BOARD_ANALOG_WRITE != 0)

int	_board_analogWrite(uint8_t pin, int val) {

	return 0;

}

#endif

#endif // OPT_BOARD_DATA

/* ------------------------------------------------------------ */

#endif	// BOARD_DATA_C

/************************************************************************/
