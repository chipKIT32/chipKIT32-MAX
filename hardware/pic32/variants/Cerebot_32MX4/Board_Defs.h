/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent Cerebot 32MX4		*/
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
/*					General Declarations						*/
/* ------------------------------------------------------------ */

#define _BV(bit) (1ul << (bit))

/* Define the port symbols used to index into the port address and
** bit tables.
*/
#define PA 1
#define PB 2
#define PC 3
#define PD 4
#define PE 5
#define PF 6
#define PG 7

/* Symbols used in pin mapping.
*/
#define	NOT_A_PIN		0
#define	NOT_A_PORT		0
#define	NOT_ON_TIMER	0
#define	NOT_ANALOG_PIN	0xFF

/* Symbols used for timer related peripherals
*/
#define	NOT_ON_TIMER	0

#define	TIMER_OC1		1
#define	TIMER_OC2		2
#define	TIMER_OC3		3
#define	TIMER_OC4		4
#define	TIMER_OC5		5

#define	TIMER_IC1		1
#define	TIMER_IC2		2
#define	TIMER_IC3		3
#define	TIMER_IC4		4
#define	TIMER_IC5		5

#define	TIMER_TCK1		1
#define	TIMER_TCK2		2
#define	TIMER_TCK3		3
#define	TIMER_TCK4		4
#define	TIMER_TCK5		5

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
/*				Board Specific Declarations						*/
/* ------------------------------------------------------------ */

#define	NUM_DIGITAL_PINS	74
#define	NUM_ANALOG_PINS		8
#define	NUM_LED				4
#define NUM_BTN				2
#define	NUM_SERIAL_PORTS	2
#define	NUM_SPI_PORTS		2
#define	NUM_I2C_PORTS		2

#define	NUM_SERVO_PINS		8

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs
*/
#define	PIN_LED1	60
#define	PIN_LED2	61
#define	PIN_LED3	62
#define	PIN_LED4	63

/* ------------------------------------------------------------ */
/*					Button Declarations							*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the buttons
*/
#define	PIN_BTN1	42	
#define	PIN_BTN2	43

/* ------------------------------------------------------------ */
/*					Servo Pin Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the servo connectors
*/
#define	PIN_SERVO1	16
#define	PIN_SERVO2	17
#define	PIN_SERVO3	18
#define	PIN_SERVO4	19
#define	PIN_SERVO5	20
#define	PIN_SERVO6	21
#define	PIN_SERVO7	22
#define	PIN_SERVO8	23

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
const static uint8_t SS   = 8;		// PIC32 SS2
const static uint8_t MOSI = 9;		// PIC32 SDO2
const static uint8_t MISO = 10;		// PIC32 SDI2
const static uint8_t SCK  = 11;		// PIC32 SCK2

/* The standard SPI port uses SPI2. Connector JB
*/
#define	_SPI_BASE	_SPI2_BASE_ADDRESS
#define _SPI_IRQ	_SPI2_ERR_IRQ
#define	_SPI_VECTOR	_SPI_2_VECTOR

/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */
/*					A/D Converter Declarations					*/
/* ------------------------------------------------------------ */


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
const uint32_t port_to_mode_PGM[] = {
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
const uint32_t port_to_output_PGM[] = {
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
const uint32_t port_to_input_PGM[] = {
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
	PE,		//  0 RE0 		PMD0
	PE,		//  1 RE1		PMD1
	PE,		//  2 RE2		PMD2
	PE,		//  3 RE3		PMD3
	PE,		//  4 RE4		PMD4
	PE,		//  5 RE5		PMD5
	PE,		//  6 RE6		PMD6
	PE,		//  7 RE7		PMD7

    // Connector JB
	PG,		//  8 RG9		PMA2/SS2/CN11/RG9
	PG,		//  9 RG8		PMA3/SDO2/CN10/RG8
	PG,		// 10 RG7		PMA4/SDI2/CN9/RG7
	PG,		// 11 RG6		PMA5/SCK2/CN8/RG6
	PB,		// 12 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15
	PD,		// 13 RD5		PMRD/CN14/RD5
	PD,		// 14 RD4		PMWR/OC5/CN13
	PB,		// 15 RB14		PMALH/PMA1/AN14/RB14

    // Connector JC
	PG,		// 16 RG12		TRD1/RG12					(S1)
	PG,		// 17 RG13		TRD0/RG13					(S2)
	PG,		// 18 RG14		TRD2/RG14					(S3)
	PG,		// 19 RG15		RG15						(S4)
	PG,		// 20 RG0		PMD8/RG0					(S5)
	PG,		// 21 RG1		PMD9/RG1					(S6)
	PF,		// 22 RF0		PMD11/RF0					(S7)
	PF,		// 23 RF1		PMD10/RF1					(S8)

    // Connector JD
	PD,		// 24 RD7		PMD15/CN16/RD7
	PD,		// 25 RD1		OC2/RD1
	PD,		// 26 RD9		TC2/SS1/RD9
	PC,		// 27 RC1		T2CK/RC1
	PD,		// 28 RD6		PMD14/CN15/RD6
	PD,		// 29 RD2		OC3/RD2
	PD,		// 30 RD10		IC3/SCK1/PMCS2/PMA15/RD10
	PC,		// 31 RC2		T3CK/RC2

    // Connector JE
	PD,		// 32 RD14		CN20/U1CTS/RD14
	PD,		// 33 RD15		U1RTS/BCLK1/CN21/RD15
	PF,		// 34 RF2		U1RX/RF2
	PF,		// 35 RF8		U1TX/RF8
	PD,		// 36 RD13		PMD13/CN19/RD13
	PD,		// 37 RD3		OC4/RD3
	PD,		// 38 RD11		IC4/PMCS1/PMA14/RD11
	PC,		// 39 RC3		T4CK/RC3    
    
    // Connector JF
	PA,		// 40 RA2		SCL2/RA2
	PA,		// 41 RA3		SDA2/RA3
	PA,		// 42 RA6		TRCLK/RA6					(BTN1)
	PA,		// 43 RA7		TRD3/RA7					(BTN2)

    // Connector JH
	PF,		// 44 RF12		U2CTS/RF12
	PF,		// 45 RF13		U2RTS/BCLK2/RF13
	PF,		// 46 RF4		PMA9/U2RX/CN17/RF4
	PF,		// 47 RF5		PMA8/U2TX/CN18/RF5
	PE,		// 48 RE8		INT1/RE8
	PD,		// 49 RD0		SDO1/OC1/INT0/RD0
	PD,		// 50 RD8		IC1/RTCC/RD8
	PE,		// 51 RE9		INT2/RE9
    
    // Connector JJ
	PB,		// 52 RB0		PGD1/FMUD1/AN0/CN2/RB0
	PB,		// 53 RB1		PGC1/FMUC1/AN1/CN3/RB1
	PB,		// 54 RB2		C2IN-/AN2/CN4/RB2
	PB,		// 55 RB3		C2IN+/AN3/CN5/RB3
	PB,		// 56 RB4		C1IN-/AN4/CN6/RB4
	PB,		// 57 RB5		VBUSON/C1IN+/AN5/CN7/RB5
	PB,		// 58 RB8		C1OUT/AN8/RB8
	PB,		// 59 RB9		C2OUT/AN9/RB9

    // Connector JK
	PB,		// 60 RB10		CVREFOUT/PMA13/AN10/RB10	(LD1)
	PB,		// 61 RB11		PMA12/AN11/RB11				(LD2)
	PB,		// 62 RB12		PMA11/AN12/RB12				(LD3)
	PB,		// 63 RB13		PMA10/AN13/RB13				(LD4)
	PA,		// 64 RA9		PMA7/VREF-/CVREF-/RA9
	PA,		// 65 RA10		PMA6/VREF+/CVREF+/RA10
	PD,		// 66 RD12		PMD12/IC5/RD12
	PC,		// 67 RC4		SDI1/T5CK/RC4
	
	//J6 I2C PORT 1
	PA,		// 68 RA14		SCL2/RA2					(P32_SCL1)
	PA,		// 69 RA15		SDA2/RA3					(P32_SDA1)
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t	digital_pin_to_bit_mask_PGM[] = {
    // Connector JA
	_BV( 0 ) ,	// 0 RE 0		PMD0
	_BV( 1 ) ,	// 1 RE 1		PMD1		
	_BV( 2 ) ,	// 2 RE 2		PMD2
	_BV( 3 ) ,	// 3 RE 3		PMD3
	_BV( 4 ) ,	// 4 RE 4		PMD4
	_BV( 5 ) ,	// 5 RE 5		PMD5
	_BV( 6 ) ,	// 6 RE 6		PMD6
	_BV( 7 ) ,	// 7 RE 7		PMD7

    // Connector JB
	_BV( 9 ) ,	// 8 RG9		PMA2/SS2/CN11/RG9
	_BV( 8 ) ,	// 9 RG8		PMA3/SDO2/CN10/RG8
	_BV( 7 ) ,	// 10 RG7		PMA4/SDI2/CN9/RG7
	_BV( 6 ) ,	// 11 RG6		PMA5/SCK2/CN8/RG6
	_BV( 15 ) ,	// 12 RB15		INT3 or PMALL/PMA0/AN15/OCFB/CN12/RB15 (Selected with JP3)
	_BV( 5 ) ,	// 13 RD5		PMRD/CN14/RD5
	_BV( 4 ) ,	// 14 RD4		PMWR/OC5/CN13
	_BV( 14 ) ,	// 15 RB14		PMALH/PMA1/AN14/RB14

    // Connector JC
	_BV( 12 ) ,	// 16 RG12		TRD1/RG12					(S1)
	_BV( 13 ) ,	// 17 RG13		TRD0/RG13					(S2)
	_BV( 14 ) ,	// 18 RG14		TRD2/RG14					(S3)
	_BV( 15 ) ,	// 19 RG15		RG15						(S4)
	_BV( 0 ) ,	// 20 RG0		PMD8/RG0					(S5)
	_BV( 1 ) ,	// 21 RG1		PMD9/RG1					(S6)
	_BV( 0 ) ,	// 22 RF0		PMD11/RF0					(S7)
	_BV( 1 ) ,	// 23 RF1		PMD10/RF1					(S8)

    // Connector JD
	_BV( 7 ) ,	// 24 RD7		PMD15/CN16/RD7
	_BV( 1 ) ,	// 25 RD1		OC2/RD1
	_BV( 9 ) ,	// 26 RD9		TC2/SS1/RD9
	_BV( 1 ) ,	// 27 RC1		T2CK/RC1
	_BV( 6 ) ,	// 28 RD6		PMD14/CN15/RD6
	_BV( 2 ) ,	// 29 RD2		OC3/RD2
	_BV( 10 ) ,	// 30 RD10		IC3/SCK1/PMCS2/PMA15/RD10
	_BV( 2 ) ,	// 31 RC2		T3CK/RC2

    // Connector JE
	_BV( 14 ) ,	// 32 RD14		CN20/U1CTS/RD14
	_BV( 15 ) ,	// 33 RD15		U1RTS/BCLK1/CN21/RD15
	_BV( 2 ) ,	// 34 RF2		U1RX/RF2
	_BV( 8 ) ,	// 35 RF8		U1TX/RF8
	_BV( 13 ) ,	// 36 RD13		PMD13/CN19/RD13
	_BV( 3 ) ,	// 37 RD3		OC4/RD3
	_BV( 11 ) ,	// 38 RD11		IC4/PMCS1/PMA14/RD11
	_BV( 3 ) ,	// 39 RC3		T4CK/RC3

    // Connector JF
	_BV( 2 ) ,	// 40 RA2		SCL2/RA2
	_BV( 3 ) ,	// 41 RA3		SDA2/RA3
	_BV( 6 ) ,	// 42 RA6		TRCLK/RA6					(BTN1)
	_BV( 7 ) ,	// 43 RA7		TRD3/RA7					(BTN2)

    // Connector JH
	_BV( 12 ) ,	// 44 RF12		U2CTS/RF12
	_BV( 13 ) ,	// 45 RF13		U2RTS/BCLK2/RF13
	_BV( 4 ) ,	// 46 RF4		PMA9/U2RX/CN17/RF4
	_BV( 5 ) ,	// 47 RF5		PMA8/U2TX/CN18/RF5
	_BV( 8 ) ,	// 48 RE8		INT1/RE8
	_BV( 0 ) ,	// 49 RD0		SDO1/OC1/INT0/RD0
	_BV( 8 ) ,	// 50 RD8		IC1/RTCC/RD8
	_BV( 9 ) ,	// 51 RE9		INT2/RE9

    // Connector JJ
	_BV( 0 ) ,	// 52 RB0		PGD1/FMUD1/AN0/CN2/RB0
	_BV( 1 ) ,	// 53 RB1		PGC1/FMUC1/AN1/CN3/RB1
	_BV( 2 ) ,	// 54 RB2		C2IN-/AN2/CN4/RB2
	_BV( 3 ) ,	// 55 RB3		C2IN+/AN3/CN5/RB3
	_BV( 4 ) ,	// 56 RB4		C1IN-/AN4/CN6/RB4
	_BV( 5 ) ,	// 57 RB5		C1IN+/AN5/CN7/RB5
	_BV( 8 ) ,	// 58 RB8		C1OUT/AN8/RB8
	_BV( 9 ) ,	// 59 RB9		C2OUT/AN9/RB9

    // Connector JK
	_BV( 10 ) ,	// 60 RB10		CVREFOUT/PMA13/AN10/RB10	(LD1)
	_BV( 11 ) ,	// 61 RB11		PMA12/AN11/RB11				(LD2)
	_BV( 12 ) ,	// 62 RB12		PMA11/AN12/RB12				(LD3)
	_BV( 13 ) ,	// 63 RB11		PMA10/AN13/RB13				(LD4)
	_BV( 9 ) ,	// 64 RA9		PMA7/VREF-/CVREF-/RA9
	_BV( 10 ) ,	// 65 RA10		PMA6/VREF+/CVREF+/RA10
	_BV( 12 ) ,	// 66 RD12		PMD12/IC5/RD12
	_BV( 4 ) ,	// 67 RC4		SDI1/T5CK/RC4
	
	//J6 I2C PORT 1
	_BV( 2 ) ,	// 68 RA14		SCL2/RA2					(P32_SCL1)
	_BV( 3 ) 	// 69 RA15		SDA2/RA3					(P32_SDA1)	
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number associated with that pin.
*/
const uint8_t	digital_pin_to_timer_PGM[] = {
    // Connector JA
	NOT_ON_TIMER,	// 0 RE 0		PMD0
	NOT_ON_TIMER,	// 1 RE 1		PMD1		
	NOT_ON_TIMER,	// 2 RE 2		PMD2
	NOT_ON_TIMER,	// 3 RE 3		PMD3
	NOT_ON_TIMER,	// 4 RE 4		PMD4
	NOT_ON_TIMER,	// 5 RE 5		PMD5
	NOT_ON_TIMER,	// 6 RE 6		PMD6
	NOT_ON_TIMER,	// 7 RE 7		PMD7

    // Connector JB
	NOT_ON_TIMER,	// 8 RG9		PMA2/SS2/CN11/RG9
	NOT_ON_TIMER,	// 9 RG8		PMA3/SDO2/CN10/RG8
	NOT_ON_TIMER,	// 10 RG7		PMA4/SDI2/CN9/RG7
	NOT_ON_TIMER,	// 11 RG6		PMA5/SCK2/CN8/RG6
	NOT_ON_TIMER,	// 12 RB15		INT3 or PMALL/PMA0/AN15/OCFB/CN12/RB15 (Selected with JP3)
	NOT_ON_TIMER,	// 13 RD5		PMRD/CN14/RD5
	TIMER_OC5,		// 14 RD4		PMWR/OC5/CN13
	NOT_ON_TIMER,	// 15 RB14		PMALH/PMA1/AN14/RB14

    // Connector JC
	NOT_ON_TIMER,	// 16 RG12		TRD1/RG12					(S1)
	NOT_ON_TIMER,	// 17 RG13		TRD0/RG13					(S2)
	NOT_ON_TIMER,	// 18 RG14		TRD2/RG14					(S3)
	NOT_ON_TIMER,	// 19 RG15		RG15						(S4)		
	NOT_ON_TIMER,	// 20 RG0		PMD8/RG0					(S5)
	NOT_ON_TIMER,	// 21 RG1		PMD9/RG1					(S6)
	NOT_ON_TIMER,	// 22 RF0		PMD11/RF0					(S7)
	NOT_ON_TIMER,	// 23 RF1		PMD10/RF1					(S8)

    // Connector JD
	NOT_ON_TIMER,	// 24 RD7		PMD15/CN16/RD7
	TIMER_OC2,		// 25 RD1		OC2/RD1
	NOT_ON_TIMER,	// 26 RD9		TC2/SS1/RD9
	NOT_ON_TIMER,	// 27 RC1		T2CK/RC1
	NOT_ON_TIMER,	// 28 RD6		PMD14/CN15/RD6
	TIMER_OC3,		// 29 RD2		OC3/RD2
	NOT_ON_TIMER,	// 30 RD10		IC3/SCK1/PMCS2/PMA15/RD10
	NOT_ON_TIMER,	// 31 RC2		T3CK/RC2

    // Connector JE
	NOT_ON_TIMER,	// 32 RD14		CN20/U1CTS/RD14
	NOT_ON_TIMER,	// 33 RF15		U1RTS/BCLK1/CN21/RD15
	NOT_ON_TIMER,	// 34 RF2		U1RX/RF2
	NOT_ON_TIMER,	// 35 RF8		U1TX/RF8
	NOT_ON_TIMER,	// 36 RD13		PMD13/CN19/RD13
	TIMER_OC4,		// 37 RD3		OC4/RD3
	NOT_ON_TIMER,	// 38 RD11		IC4/PMCS1/PMA14/RD11
	NOT_ON_TIMER,	// 39 RC3		T4CK/RC3

    // Connector JF
	NOT_ON_TIMER,	// 40 RA2		SCL2/RA2
	NOT_ON_TIMER,	// 41 RA3		SDA2/RA3
	NOT_ON_TIMER,	// 42 RA6		TRCLK/RA6					(BTN1)
	NOT_ON_TIMER,	// 43 RA7		TRD3/RA7					(BTN2)

    // Connector JH
	NOT_ON_TIMER,	// 44 RF12		U2CTS/RF12
	NOT_ON_TIMER,	// 45 RF13		U2RTS/BCLK2/RF13
	NOT_ON_TIMER,	// 46 RF4		PMA9/U2RX/CN17/RF4
	NOT_ON_TIMER,	// 47 RF5		PMA8/U2TX/CN18/RF5
	NOT_ON_TIMER,	// 48 RE8		INT1/RE8
	TIMER_OC1,		// 49 RD0		SDO1/OC1/INT0/RD0
	NOT_ON_TIMER,	// 50 RD8		IC1/RTCC/RD8
	NOT_ON_TIMER,	// 51 RE9		INT2/RE9

    // Connector JJ
	NOT_ON_TIMER,	// 52 RB0		PGD1/FMUD1/AN0/CN2/RB0
	NOT_ON_TIMER,	// 53 RB1		PGC1/FMUC1/AN1/CN3/RB1
	NOT_ON_TIMER,	// 54 RB2		C2IN-/AN2/CN4/RB2
	NOT_ON_TIMER,	// 55 RB3		C2IN+/AN3/CN5/RB3
	NOT_ON_TIMER,	// 56 RB4		C1IN-/AN4/CN6/RB4
	NOT_ON_TIMER,	// 57 RB5		C1IN+/AN5/CN7/RB5
	NOT_ON_TIMER,	// 58 RB8		C1OUT/AN8/RB8
	NOT_ON_TIMER,	// 59 RB9		C2OUT/AN9/RB9

    // Connector JK
	NOT_ON_TIMER,	// 60 RB10		CVREFOUT/PMA13/AN10/RB10	(LD1)
	NOT_ON_TIMER,	// 61 RB11		PMA12/AN11/RB11				(LD2)
	NOT_ON_TIMER,	// 62 RB12		PMA11/AN12/RB12				(LD3)
	NOT_ON_TIMER,	// 63 RB13		PMA10/AN13/RB13				(LD4)
	NOT_ON_TIMER,	// 64 RA9		PMA7/VREF-/CVREF-/RA9
	NOT_ON_TIMER,	// 65 RA10		PMA6/VREF+/CVREF+/RA10
	NOT_ON_TIMER,	// 66 RD12		PMD12/IC5/RD12
	NOT_ON_TIMER,	// 67 RC4		SDI1/T5CK/RC4	
	
	//J6 /I2C PORT 2
	NOT_ON_TIMER,	// 68 RA14		SCL2/RA2					(P32_SCL1)
	NOT_ON_TIMER	// 69 RA15		SDA2/RA3					(P32_SDA1)
};

/* ------------------------------------------------------------ */
/* This table maps from a digital pin number to the corresponding
** analog pin number.
*/
const uint8_t digital_pin_to_analog_PGM[] = {
    // Connector JA
	NOT_ANALOG_PIN,	// 0 RE0		PMD0
	NOT_ANALOG_PIN,	// 1 RE1		PMD1		
	NOT_ANALOG_PIN,	// 2 RE2		PMD2
	NOT_ANALOG_PIN,	// 3 RE3		PMD3
	NOT_ANALOG_PIN,	// 4 RE4		PMD4
	NOT_ANALOG_PIN,	// 5 RE5		PMD5
	NOT_ANALOG_PIN,	// 6 RE6		PMD6
	NOT_ANALOG_PIN,	// 7 RE7		PMD7

    // Connector JB
	NOT_ANALOG_PIN,	// 8 RG9		PMA2/SS2/CN11/RG9
	NOT_ANALOG_PIN,	// 9 RG8		PMA3/SDO2/CN10/RG8
	NOT_ANALOG_PIN,	// 10 RG7		PMA4/SDI2/CN9/RG7
	NOT_ANALOG_PIN,	// 11 RG6		PMA5/SCK2/CN8/RG6
	AN12,			// 12 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15
	NOT_ANALOG_PIN,	// 13 RD5		PMRD/CN14/RD5
	NOT_ANALOG_PIN,	// 14 RD4		PMWR/OC5/CN13
	AN13,			// 15 RB14		PMALH/PMA1/AN14/RB14

    // Connector JC
	NOT_ANALOG_PIN,	// 16 RG12		TRD1/RG12					(S1)
	NOT_ANALOG_PIN,	// 17 RG13		TRD0/RG13					(S2)
	NOT_ANALOG_PIN,	// 18 RG14		TRD2/RG14					(S3)
	NOT_ANALOG_PIN,	// 19 RG15		RG15						(S4)	
	NOT_ANALOG_PIN,	// 20 RG0		PMD8/RG0					(S5)
	NOT_ANALOG_PIN,	// 21 RG1		PMD9/RG1					(S6)
	NOT_ANALOG_PIN,	// 22 RF0		PMD11/RF0					(S7)
	NOT_ANALOG_PIN,	// 23 RF1		PMD10/RF1					(S8)

    // Connector JD
	NOT_ANALOG_PIN,	// 24 RD7		PMD15/CN16/RD7
	NOT_ANALOG_PIN,	// 25 RD1		OC2/RD1
	NOT_ANALOG_PIN,	// 26 RD9		TC2/SS1/RD9
	NOT_ANALOG_PIN,	// 27 RC1		T2CK/RC1
	NOT_ANALOG_PIN,	// 28 RD6		PMD14/CN15/RD6
	NOT_ANALOG_PIN,	// 29 RD2		OC3/RD2
	NOT_ANALOG_PIN,	// 30 RD10		IC3/SCK1/PMCS2/PMA15/RD10
	NOT_ANALOG_PIN,	// 31 RC2		T3CK/RC2

    // Connector JE
	NOT_ANALOG_PIN,	// 32 RD14		CN20/U1CTS/RD14
	NOT_ANALOG_PIN,	// 33 RD15		U1RTS/BCLK1/CN21/RD15
	NOT_ANALOG_PIN,	// 34 RF2		U1RX/RF2
	NOT_ANALOG_PIN,	// 35 RF8		U1TX/RF8
	NOT_ANALOG_PIN,	// 36 RD13		PMD13/CN19/RD13
	NOT_ANALOG_PIN,	// 37 RD3		OC4/RD3
	NOT_ANALOG_PIN,	// 38 RD11		IC4/PMCS1/PMA14/RD11
	NOT_ANALOG_PIN,	// 39 RC3		T4CK/RC3

    // Connector JF
	NOT_ANALOG_PIN,	// 40 RA2		SCL2/RA2
	NOT_ANALOG_PIN,	// 41 RA3		SDA2/RA3
	NOT_ANALOG_PIN,	// 42 RA6		TRCLK/RA6					(BTN1)
	NOT_ANALOG_PIN,	// 43 RA7		TRD3/RA7					(BTN2)

    // Connector JH
	NOT_ANALOG_PIN,	// 44 RF12		U2CTS/RF12
	NOT_ANALOG_PIN,	// 45 RF13		U2RTS/BCLK2/RF13
	NOT_ANALOG_PIN,	// 46 RF4		PMA9/U2RX/CN17/RF4
	NOT_ANALOG_PIN,	// 47 RF5		PMA8/U2TX/CN18/RF5
	NOT_ANALOG_PIN,	// 48 RE8		INT1/RE8
	NOT_ANALOG_PIN,	// 49 RD0		SDO1/OC1/INT0/RD0
	NOT_ANALOG_PIN,	// 50 RD8		IC1/RTCC/RD8
	NOT_ANALOG_PIN,	// 51 RE9		INT2/RE9

    // Connector JJ
	AN0,			// 52 RB0		PGD1/FMUD1/AN0/CN2/RB0
	AN1,			// 53 RB1		PGC1/FMUC1/AN1/CN3/RB1
	AN2,			// 54 RB2		C2IN-/AN2/CN4/RB2
	AN3,			// 55 RB3		C2IN+/AN3/CN5/RB3
	AN4,			// 56 RB4		C1IN-/AN4/CN6/RB4
	AN5,			// 57 RB5		VBUSON/C1IN+/AN5/CN7/RB5
	AN6,			// 58 RB8		C1OUT/AN8/RB8
	AN7,			// 59 RB9		C2OUT/AN9/RB9

    // Connector JK
	AN8,			// 60 RB10		CVREFOUT/PMA13/AN10/RB10	(LD1)
	AN9,			// 61 RB11		PMA12/AN11/RB11				(LD2)
	AN10,			// 62 RB12		PMA11/AN12/RB12				(LD3)
	AN11,			// 63 RB13		PMA10/AN13/RB13				(LD4)
	NOT_ANALOG_PIN,	// 64 RA9		PMA7/VREF-/CVREF-/RA9
	NOT_ANALOG_PIN,	// 65 RA10		PMA6/VREF+/CVREF+/RA10
	NOT_ANALOG_PIN,	// 66 RD12		PMD12/IC5/RD12
	NOT_ANALOG_PIN,	// 67 RC4		SDI1/T5CK/RC4	
	
	//J6 I2C PORT 1
	NOT_ANALOG_PIN,	// 68 RA14		SCL2/RA2					(P32_SCL1)
	NOT_ANALOG_PIN	// 69 RA15		SDA2/RA3					(P32_SDA1)
};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	Arduino Pin		PIC32 Analog channel
	0,		//*	A0						AN0
	1,		//*	A1						AN1
	2,		//*	A2						AN2
	3,		//*	A3						AN3
	4,		//*	A4						AN4
	5,		//*	A5						AN5
	8,		//*	A6						AN8
	9,		//*	A7						AN9
	10,		//*	A8						AN10
	11,		//*	A9						AN11
	12,		//*	A10						AN12
	13,		//*	A11						AN13
	15,		//* A12						AN15
	14		//* A13						AN14
};

#endif // _BOARD_DATA_

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
