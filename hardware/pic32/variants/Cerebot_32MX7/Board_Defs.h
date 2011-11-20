/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent Cerebot 32MX7		*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declartions and data structure	*/
/* to customize the chipKIT MPIDE for use with the Digilent Cerebot		*/
/* MX4ck board.															*/
/*																		*/
/* This code is based on earlier work:									*/
/*		Copyright (c) 2010, 2011 by Mark Sproul							*/
/*		Copyright (c) 2005, 2006 by David A. Mellis						*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	10/06/2011(GeneA): Created											*/
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

#if !defined(BOARD_DEFS_H)
#define BOARD_DEFS_H

#include <inttypes.h>

/* ------------------------------------------------------------ */
/*				Public Board Declarations						*/
/* ------------------------------------------------------------ */
/* The following define symbols that can be used in a sketch to
** refer to periperhals on the board generically.
*/


/* ------------------------------------------------------------ */
/*				Board Specific Declarations						*/
/* ------------------------------------------------------------ */

#define	NUM_DIGITAL_PINS	61
#define	NUM_ANALOG_PINS		10
#define	NUM_LED				4
#define NUM_BTN				3
#define	NUM_SERIAL_PORTS	2
#define	NUM_SPI_PORTS		2
#define	NUM_I2C_PORTS		2

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs
*/
#define	PIN_LED1	51
#define	PIN_LED2	52
#define	PIN_LED3	53
#define	PIN_LED4	54

/* ------------------------------------------------------------ */
/*					Button Declarations							*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the Buttons
*/
#define	PIN_BTN1	48	
#define	PIN_BTN2	49
#define PIN_BTN3	50

/* ------------------------------------------------------------ */
/*				Internal Declarations							*/
/* ------------------------------------------------------------ */
/* The following declarations are used to map peripherals for	*/
/* the core and libraries and to provide configuration options	*/
/* for the core. They are not normally needed by a user sketch.	*/
/* ------------------------------------------------------------ */

#if defined(OPT_BOARD_INTERNAL)

/* ------------------------------------------------------------ */
/*					Pin Mapping Macros							*/
/* ------------------------------------------------------------ */
/* Macros used to access the port and pin mapping tables.
** These are mostly generic, but some of them may be board specific.
** These perform slightly better as macros compared to inline functions
*/
#define digitalPinToPort(P) ( digital_pin_to_port_PGM[P]  )
#define digitalPinToBitMask(P) ( digital_pin_to_bit_mask_PGM[P]  )
#define digitalPinToTimer(P) ( digital_pin_to_timer_PGM[P]  )
#define portOutputRegister(P) ( (volatile uint32_t *)(  port_to_output_PGM[P]) )
#define portInputRegister(P) ( (volatile uint32_t *)(  port_to_input_PGM[P]) )
#define portModeRegister(P) ( (volatile uint32_t *)(  port_to_mode_PGM[P]) )
#define	digitalPinToAnalog(P) ( digital_pin_to_analog_PGM[P] )
#define analogInPinToChannel(P) ( analog_pin_to_channel_PGM[P]  )

/* ------------------------------------------------------------ */
/*				Core Configuration Declarations					*/
/* ------------------------------------------------------------ */
/*																*/
/* These are conditional compilation switches that control the	*/
/* board core configuration functions. These functions provide	*/
/* hooks that can call from some of the core functions into		*/
/* functions defined below that can be used to extend or		*/
/* replace the default behavior of the core function. To use	*/
/* this, enter the appropriate code into the appropriate		*/
/* function skeleton below and then set the appropriate switch	*/
/* value to 1. This will cause the configuration function to be	*/
/* compiled into the build and will cause the code to call the	*/
/* hook function to be compiled into the core function.			*/
/*																*/
/* ------------------------------------------------------------ */

#define	OPT_BOARD_INIT			0	//board needs no special init code
#define	OPT_BOARD_DIGITAL_IO	0	//board does not extend digital i/o functions
#define	OPT_BOARD_ANALOG_READ	0	//board does not extend analogRead
#define	OPT_BOARD_ANALOG_WRITE	0	//board does not extend analogWrite

/* ------------------------------------------------------------ */
/*					Serial Port Declarations					*/
/* ------------------------------------------------------------ */

/* This board uses the USB port for the serial interface to
** talk to the IDE.
*/
#define	_USE_USB_FOR_SERIAL_

/* Serial port 0 uses UART1
*/
#define	_SER0_BASE		_UART1_BASE_ADDRESS
#define	_SER0_IRQ		_UART1_ERR_IRQ
#define	_SER0_VECTOR	_UART_1_VECTOR

/* Serial port 1 uses UART2
*/
#define	_SER1_BASE		_UART2_BASE_ADDRESS
#define	_SER1_IRQ		_UART2_ERR_IRQ
#define	_SER1_VECTOR	_UART_2_VECTOR

/* ------------------------------------------------------------ */
/*					SPI Port Declarations						*/
/* ------------------------------------------------------------ */

/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h
*/
const static uint8_t SS   = 40;		// PIC32 SS2
const static uint8_t MOSI = 41;		// PIC32 SDO2
const static uint8_t MISO = 42;		// PIC32 SDI2
const static uint8_t SCK  = 43;		// PIC32 SCK2

/* The standard SPI port uses SPI4. Connector JF
*/
#define	_SPI_BASE	_SPI4_BASE_ADDRESS
#define _SPI_IRQ	_SPI4_ERR_IRQ
#define	_SPI_VECTOR	_SPI_4_VECTOR

/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */
/*					A/D Converter Declarations					*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */

#endif		//OPT_BOARD_INTERNAL

/* ------------------------------------------------------------ */
/*					Data Definitions							*/
/* ------------------------------------------------------------ */

/* The following declare externals to access the pin mapping
** tables.
*/

#if !defined(_BOARD_DATA_)

extern const uint32_t	port_to_mode_PGM[];
extern const uint32_t	port_to_input_PGM[];
extern const uint32_t	port_to_output_PGM[];

extern const uint8_t	digital_pin_to_port_PGM[];
extern const uint16_t	digital_pin_to_bit_mask_PGM[];
extern const uint8_t	digital_pin_to_timer_PGM[];
extern const uint8_t 	digital_pin_to_analog_PGM[];
extern const uint8_t	analog_pin_to_channel_PGM[];

#endif

/* The following declarations define data used in the pin mapping.
** These will be compiled when compiling main.cpp so that this
** header file can be included in multiple modules, be we only 
** get one copy of the data.
*/

#if defined(_BOARD_DATA_)

/* Analog pin definition symbols. Used in the digital pin
** to analog pin mapping table.
*/
#define	AN0		0
#define	AN1		1
#define	AN2		2
#define	AN3		3
#define	AN4		4
#define	AN5		5
#define	AN6		6
#define	AN7		7
#define	AN8		8
#define	AN9		9
#define	AN10	10
#define	AN11	11
#define	AN12	12
#define	AN13	13
#define	AN14	14
#define	AN15	15

/* ------------------------------------------------------------ */
/* This table is used to map from port number to the address of
** the TRIS register for the port. This is used for setting the
** pin direction.
*/
const uint32_t	port_to_mode_PGM[] = {
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
/* This table is used to map from the port number to the address
** of the LAT register for the port. This is used when writing
** to a port.
*/
const uint32_t	port_to_output_PGM[] = {
	NOT_A_PORT,				//index 0 is not used

#if defined(_PORTA)
	(uint32_t)&LATA,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTB)
	(uint32_t)&LATB,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTC)
	(uint32_t)&LATC,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTD)
	(uint32_t)&LATD,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTE)
	(uint32_t)&LATE,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTF)
	(uint32_t)&LATF,
#else
	NOT_A_PORT,
#endif

#if defined(_PORTG)
	(uint32_t)&LATG,
#else
	NOT_A_PORT,
#endif

	NOT_A_PORT,
};

/* ------------------------------------------------------------ */
/* This table is used to map from the port number to the address
** of the PORT register for the port. This is used when reading
** from the port.
*/
const uint32_t	port_to_input_PGM[] = {
	NOT_A_PIN,			//index 0 is not used

#if defined(_PORTA)
	(uint32_t)&PORTA,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTB)
	(uint32_t)&PORTB,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTC)
	(uint32_t)&PORTC,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTD)
	(uint32_t)&PORTD,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTE)
	(uint32_t)&PORTE,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTF)
	(uint32_t)&PORTF,
#else
	NOT_A_PIN,
#endif

#if defined(_PORTG)
	(uint32_t)&PORTG,
#else
	NOT_A_PIN,
#endif

	NOT_A_PIN,
};

/* ------------------------------------------------------------ */
/* This table is used to map the digital pin number to the port
** containing that pin.
*/
const uint8_t	digital_pin_to_port_PGM[] = {
    // Connector JA
	PB,		//  0 RB2 		AN2/C2IN-/CN4/RB2
	PB,		//  1 RB3		AN3/C2IN+/CN5/RB3
	PB,		//  2 RB4		AN4/C1IN-/CN6/RB4
	PB,		//  3 RB6		AN6/PGEC2/OCFA/RB6
	PB,		//  4 RB7		AN7/PGED2/RB7
	PB,		//  5 RB8		AN8/C1OUT/RB8
	PB,		//  6 RB9		AN9/C2OUT/RB9
	PB,		//  7 RB10		AN10/PMA13/RB10

    // Connector JB
	PE,		//  8 RE0		PMD0/RE0
	PE,		//  9 RE1		PMD1/RE1
	PE,		// 10 RE2		PMD2/RE2
	PE,		// 11 RE3		PMD3/RE3
	PE,		// 12 RE4		PMD4/RE4
	PE,		// 13 RE5		PMD5/RE5
	PE,		// 14 RE6		PMD6/RE6
	PE,		// 15 RE7		PMD7/RE7
	
    // Connector JC
	PC,		// 16 RC1		T2CK/RC1
	PG,		// 17 RG0		PMD8/RG0
	PG,		// 18 RG1		PMD9/RG1
	PD,		// 19 RD7		PMD15/CN16/RD7
	PB,		// 20 RB15		AN15/PMA0/CN12
	PD,		// 21 RD5		PMRD/CN14/RD5
	PD,		// 22 RD4		PMWR/OC5/CN13/RD4
	PB,		// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	PD,		// 24 RD9		SS1/IC2/RD9
	PD,		// 25 RD0		SDO1/OC1/INT0/RD0
	PC,		// 26 RC4		T5CK/SDI1/RC4
	PD,		// 27 RD10		SCK1/IC3/RD10
	PD,		// 28 RD1		OC2/RD1
	PD,		// 29 RD2		OC3/RD2
	PD,		// 30 RD3		OC4/RD3
	PD,		// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	PD,		// 32 RD14		SS1A/U1ACTS/CN20/RD14
	PF,		// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	PF,		// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	PD,		// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	PA,		// 36 RA6		TRCLK/RA6
	PA,		// 37 RA7		TRD3/RA7
	PA,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	PA,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	PF,		// 40 RF12		SS3A/U3ACTS/RF12
	PF,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	PF,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	PF,		// 43 RF13		SCK3A/U3ARTS/RF13
	PA,		// 44 RA0		TMS/RA0
	PA,		// 45 RA1		TCK/RA1
	PA,		// 46 RA4		TDI/RA4
	PA,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	PG,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	PG,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	PD,		// 50 BTN3		ETXD3/PMD13/CN19/RD13
	
	//LEDS
	PG,		// 51 LD1		TRD1/RG12
	PG,		// 52 LD2		TRD0/RG13
	PG,		// 53 LD3		TRD2/RG14
	PG,		// 54 LD4		AERXERR/RG15
	
	//J8 I2C PORT 1 
	PA,		// 55 RA14		SCL1/INT3/RA14
	PA,		// 56 RA15		SDA1/INT4/RA15
	
	//J7 I2C PORT 2
	PA,		// 57 RA2		SCL1/RA2
	PA,		// 58 RA3		SDA2/RA3
	
	//MISC
	PB,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	PE		// 60 RE8		AERDX0/IN1/RE8 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t	digital_pin_to_bit_mask_PGM[] = {
   // Connector JA
	_BV( 2 ) ,	//  0 RB2 		AN2/C2IN-/CN4/RB2
	_BV( 3 ) ,	//  1 RB3		AN3/C2IN+/CN5/RB3
	_BV( 4 ) ,	//  2 RB4		AN4/C1IN-/CN6/RB4
	_BV( 6 ) ,	//  3 RB6		AN6/PGEC2/OCFA/RB6
	_BV( 7 ) ,	//  4 RB7		AN7/PGED2/RB7
	_BV( 8 ) ,	//  5 RB8		AN8/C1OUT/RB8
	_BV( 9 ) ,	//  6 RB9		AN9/C2OUT/RB9
	_BV( 10 ) ,	//  7 RB10		AN10/PMA13/RB10

    // Connector JB
	_BV( 0 ) ,	//  8 RE0		PMD0/RE0
	_BV( 1 ) ,	//  9 RE1		PMD1/RE1
	_BV( 2 ) ,	// 10 RE2		PMD2/RE2
	_BV( 3 ) ,	// 11 RE3		PMD3/RE3
	_BV( 4 ) ,	// 12 RE4		PMD4/RE4
	_BV( 5 ) ,	// 13 RE5		PMD5/RE5
	_BV( 6 ) ,	// 14 RE6		PMD6/RE6
	_BV( 7 ) ,	// 15 RE7		PMD7/RE7
	
    // Connector JC
	_BV( 1 ) ,	// 16 RC1		T2CK/RC1
	_BV( 0 ) ,	// 17 RG0		PMD8/RG0
	_BV( 1 ) ,	// 18 RG1		PMD9/RG1
	_BV( 7 ) ,	// 19 RD7		PMD15/CN16/RD7
	_BV( 15 ) ,	// 20 RB15		AN15/PMA0/CN12
	_BV( 5 ) ,	// 21 RD5		PMRD/CN14/RD5
	_BV( 4 ) ,	// 22 RD4		PMWR/OC5/CN13/RD4
	_BV( 14 ) ,	// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	_BV( 9 ) ,	// 24 RD9		SS1/IC2/RD9
	_BV( 0 ) ,	// 25 RD0		SDO1/OC1/INT0/RD0
	_BV( 4 ) ,	// 26 RC4		T5CK/SDI1/RC4
	_BV( 10 ) ,	// 27 RD10		SCK1/IC3/RD10
	_BV( 1 ) ,	// 28 RD1		OC2/RD1
	_BV( 2 ) ,	// 29 RD2		OC3/RD2
	_BV( 3 ) ,	// 30 RD3		OC4/RD3
	_BV( 12 ) ,	// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	_BV( 14 ) ,	// 32 RD14		SS1A/U1ACTS/CN20/RD14
	_BV( 8 ) ,	// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	_BV( 2 ) ,	// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	_BV( 15 ) ,	// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	_BV( 6 ) ,	// 36 RA6		TRCLK/RA6
	_BV( 7 ) ,	// 37 RA7		TRD3/RA7
	_BV( 9 ) ,	// 38 RA9		VREF-/CVREF-/PMA7/RA9
	_BV( 10 ) ,	// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	_BV( 12 ) ,	// 40 RF12		SS3A/U3ACTS/RF12
	_BV( 5 ) ,	// 41 RF5		SDO3A/U3ATX/CN18/RF5
	_BV( 4 ) ,	// 42 RF4		SDI3A/U3ARX/CN17/RF4
	_BV( 13 ) ,	// 43 RF13		SCK3A/U3ARTS/RF13
	_BV( 0 ) ,	// 44 RA0		TMS/RA0
	_BV( 1 ) ,	// 45 RA1		TCK/RA1
	_BV( 4 ) ,	// 46 RA4		TDI/RA4
	_BV( 5 ) ,	// 47 RA5		TDO/RA5	
	
	//BUTTONS
	_BV( 6 ) ,	// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	_BV( 7 ) ,	// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	_BV( 13 ) ,	// 50 BTN3		ETXD3/PMD13/CN19/RD13
	
	//LEDS
	_BV( 12 ) ,	// 51 LD1		TRD1/RG12
	_BV( 13 ) ,	// 52 LD2		TRD0/RG13
	_BV( 14 ) ,	// 53 LD3		TRD2/RG14
	_BV( 15 ) ,	// 54 LD4		AERXERR/RG15
	
	//J8 I2C PORT 1 
	_BV( 14 ) ,	// 55 RA14		SCL1/INT3/RA14
	_BV( 15 ) ,	// 56 RA15		SDA1/INT4/RA15	
	
	//J7 I2C PORT 2
	_BV( 2 ) ,	// 57 RA2		SCL1/RA2
	_BV( 3 ) ,	// 58 RA3		SDA2/RA3	
	
	//MISC
	_BV( 5 ) ,	// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	_BV( 8 ) 	// 60 RE8		AERDX0/IN1/RE8 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number associated with that pin.
*/
const uint8_t	digital_pin_to_timer_PGM[] = {
    // Connector JA
	NOT_ON_TIMER,		//  0 RB2 		AN2/C2IN-/CN4/RB2
	NOT_ON_TIMER,		//  1 RB3		AN3/C2IN+/CN5/RB3
	NOT_ON_TIMER,		//  2 RB4		AN4/C1IN-/CN6/RB4
	NOT_ON_TIMER,		//  3 RB6		AN6/PGEC2/OCFA/RB6
	NOT_ON_TIMER,		//  4 RB7		AN7/PGED2/RB7
	NOT_ON_TIMER,		//  5 RB8		AN8/C1OUT/RB8
	NOT_ON_TIMER,		//  6 RB9		AN9/C2OUT/RB9
	NOT_ON_TIMER,		//  7 RB10		AN10/PMA13/RB10

    // Connector JB
	NOT_ON_TIMER,		//  8 RE0		PMD0/RE0
	NOT_ON_TIMER,		//  9 RE1		PMD1/RE1
	NOT_ON_TIMER,		// 10 RE2		PMD2/RE2
	NOT_ON_TIMER,		// 11 RE3		PMD3/RE3
	NOT_ON_TIMER,		// 12 RE4		PMD4/RE4
	NOT_ON_TIMER,		// 13 RE5		PMD5/RE5
	NOT_ON_TIMER,		// 14 RE6		PMD6/RE6
	NOT_ON_TIMER,		// 15 RE7		PMD7/RE7
	
    // Connector JC
	NOT_ON_TIMER,		// 16 RC1		T2CK/RC1
	NOT_ON_TIMER,		// 17 RG0		PMD8/RG0
	NOT_ON_TIMER,		// 18 RG1		PMD9/RG1
	NOT_ON_TIMER,		// 19 RD7		PMD15/CN16/RD7
	NOT_ON_TIMER,		// 20 RB15		AN15/PMA0/CN12
	NOT_ON_TIMER,		// 21 RD5		PMRD/CN14/RD5
	TIMER_OC5,			// 22 RD4		PMWR/OC5/CN13/RD4
	NOT_ON_TIMER,		// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	NOT_ON_TIMER,		// 24 RD9		SS1/IC2/RD9
	TIMER_OC1,			// 25 RD0		SDO1/OC1/INT0/RD0
	NOT_ON_TIMER,		// 26 RC4		T5CK/SDI1/RC4
	NOT_ON_TIMER,		// 27 RD10		SCK1/IC3/RD10
	TIMER_OC2,			// 28 RD1		OC2/RD1
	TIMER_OC3,			// 29 RD2		OC3/RD2
	TIMER_OC4,			// 30 RD3		OC4/RD3
	NOT_ON_TIMER,		// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	NOT_ON_TIMER,		// 32 RD14		SS1A/U1ACTS/CN20/RD14
	NOT_ON_TIMER,		// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	NOT_ON_TIMER,		// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	NOT_ON_TIMER,		// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	NOT_ON_TIMER,		// 36 RA6		TRCLK/RA6
	NOT_ON_TIMER,		// 37 RA7		TRD3/RA7
	NOT_ON_TIMER,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	NOT_ON_TIMER,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	NOT_ON_TIMER,		// 40 RF12		SS3A/U3ACTS/RF12
	NOT_ON_TIMER,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	NOT_ON_TIMER,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	NOT_ON_TIMER,		// 43 RF13		SCK3A/U3ARTS/RF13
	NOT_ON_TIMER,		// 44 RA0		TMS/RA0
	NOT_ON_TIMER,		// 45 RA1		TCK/RA1
	NOT_ON_TIMER,		// 46 RA4		TDI/RA4
	NOT_ON_TIMER,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	NOT_ON_TIMER,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	NOT_ON_TIMER,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ON_TIMER,		// 50 BTN3		ETXD3/PMD13/CN19/RD13
	
	//LEDS
	NOT_ON_TIMER,		// 51 LD1		TRD1/RG12
	NOT_ON_TIMER,		// 52 LD2		TRD0/RG13
	NOT_ON_TIMER,		// 53 LD3		TRD2/RG14
	NOT_ON_TIMER,		// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	NOT_ON_TIMER,		// 55 RA14		SCL1/INT3/RA14
	NOT_ON_TIMER,		// 56 RA15		SDA1/INT4/RA15
	
	//J7 /I2C PORT 1
	NOT_ON_TIMER,		// 57 RA2		SCL1/RA2
	NOT_ON_TIMER,		// 58 RA3		SDA2/RA3
	
	//MISC
	NOT_ON_TIMER,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	NOT_ON_TIMER		// 60 RE8		AERDX0/IN1/RE8 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table maps from a digital pin number to the corresponding
** analog pin number.
*/
const uint8_t digital_pin_to_analog_PGM[] = {
    // Connector JA
	AN0,				//  0 RB2 		AN2/C2IN-/CN4/RB2
	AN1,				//  1 RB3		AN3/C2IN+/CN5/RB3
	AN2,				//  2 RB4		AN4/C1IN-/CN6/RB4
	AN3,				//  3 RB6		AN6/PGEC2/OCFA/RB6
	AN4,				//  4 RB7		AN7/PGED2/RB7
	AN5,				//  5 RB8		AN8/C1OUT/RB8
	AN6,				//  6 RB9		AN9/C2OUT/RB9
	AN7,				//  7 RB10		AN10/PMA13/RB10

    // Connector JB
	NOT_ANALOG_PIN,		//  8 RE0		PMD0/RE0
	NOT_ANALOG_PIN,		//  9 RE1		PMD1/RE1
	NOT_ANALOG_PIN,		// 10 RE2		PMD2/RE2
	NOT_ANALOG_PIN,		// 11 RE3		PMD3/RE3
	NOT_ANALOG_PIN,		// 12 RE4		PMD4/RE4
	NOT_ANALOG_PIN,		// 13 RE5		PMD5/RE5
	NOT_ANALOG_PIN,		// 14 RE6		PMD6/RE6
	NOT_ANALOG_PIN,		// 15 RE7		PMD7/RE7
	
    // Connector JC
	NOT_ANALOG_PIN,		// 16 RC1		T2CK/RC1
	NOT_ANALOG_PIN,		// 17 RG0		PMD8/RG0
	NOT_ANALOG_PIN,		// 18 RG1		PMD9/RG1
	NOT_ANALOG_PIN,		// 19 RD7		PMD15/CN16/RD7
	AN8,				// 20 RB15		AN15/PMA0/CN12
	NOT_ANALOG_PIN,		// 21 RD5		PMRD/CN14/RD5
	NOT_ANALOG_PIN,		// 22 RD4		PMWR/OC5/CN13/RD4
	AN9,				// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	NOT_ANALOG_PIN,		// 24 RD9		SS1/IC2/RD9
	NOT_ANALOG_PIN,		// 25 RD0		SDO1/OC1/INT0/RD0
	NOT_ANALOG_PIN,		// 26 RC4		T5CK/SDI1/RC4
	NOT_ANALOG_PIN,		// 27 RD10		SCK1/IC3/RD10
	NOT_ANALOG_PIN,		// 28 RD1		OC2/RD1
	NOT_ANALOG_PIN,		// 29 RD2		OC3/RD2
	NOT_ANALOG_PIN,		// 30 RD3		OC4/RD3
	NOT_ANALOG_PIN,		// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	NOT_ANALOG_PIN,		// 32 RD14		SS1A/U1ACTS/CN20/RD14
	NOT_ANALOG_PIN,		// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	NOT_ANALOG_PIN,		// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	NOT_ANALOG_PIN,		// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	NOT_ANALOG_PIN,		// 36 RA6		TRCLK/RA6
	NOT_ANALOG_PIN,		// 37 RA7		TRD3/RA7
	NOT_ANALOG_PIN,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	NOT_ANALOG_PIN,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	NOT_ANALOG_PIN,		// 40 RF12		SS3A/U3ACTS/RF12
	NOT_ANALOG_PIN,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	NOT_ANALOG_PIN,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	NOT_ANALOG_PIN,		// 43 RF13		SCK3A/U3ARTS/RF13
	NOT_ANALOG_PIN,		// 44 RA0		TMS/RA0
	NOT_ANALOG_PIN,		// 45 RA1		TCK/RA1
	NOT_ANALOG_PIN,		// 46 RA4		TDI/RA4
	NOT_ANALOG_PIN,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	NOT_ANALOG_PIN,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	NOT_ANALOG_PIN,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ANALOG_PIN,		// 50 BTN3		ETXD3/PMD13/CN19/RD13
	
	//LEDS
	NOT_ANALOG_PIN,		// 51 LD1		TRD1/RG12
	NOT_ANALOG_PIN,		// 52 LD2		TRD0/RG13
	NOT_ANALOG_PIN,		// 53 LD3		TRD2/RG14
	NOT_ANALOG_PIN,		// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	NOT_ANALOG_PIN,		// 55 RA14		SCL1/INT3/RA14
	NOT_ANALOG_PIN,		// 56 RA15		SDA1/INT4/RA15
	
	//J7 /I2C PORT 1
	NOT_ANALOG_PIN,		// 57 RA2		SCL1/RA2
	NOT_ANALOG_PIN,		// 58 RA3		SDA2/RA3
	
	//MISC
	NOT_ANALOG_PIN,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	NOT_ANALOG_PIN		// 60 RE8		AERDX0/IN1/RE8 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	Arduino Pin		PIC32 Analog channel
	2,		//*	A0						AN2
	3,		//*	A1						AN3
	4,		//*	A2						AN4
	6,		//*	A3						AN6
	7,		//*	A4						AN7
	8,		//*	A5						AN8
	9,		//*	A6						AN9
	10,		//*	A7						AN10
	15,		//*	A8						AN15
	14		//*	A9						AN14
};

#endif	// _BOARD_DATA_

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
