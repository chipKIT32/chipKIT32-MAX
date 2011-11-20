/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent Cerebot MX7ck		*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declartions and data structure	*/
/* to customize the chipKIT MPIDE for use with the Digilent Cerebot		*/
/* MX7ck board.															*/
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

#define	_BOARD_NAME_	"Cerebot MX7cK"

/* Define the processor on the board.
*/
#define	_CPU_NAME_	"32MX795F512L"
#define	FLASHEND	(((512 - 4) * 1024L) - 1)
#define	RAMEND		((128 * 1024L) - 1)

/* Define the peripherals available on the board.
*/
#define	NUM_DIGITAL_PINS	61
#define	NUM_ANALOG_PINS		10
#define	NUM_OC_PINS			5
#define	NUM_IC_PINS			3
#define	NUM_TCK_PINS		2
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	2
#define	NUM_SPI_PORTS		1
#define	NUM_I2C_PORTS		1

#define	NUM_DSPI_PORTS		3
#define	NUM_DTWI_PORTS		4

/* Define I/O devices on the board.
*/
#define	NUM_LED				4
#define NUM_BTN				3
#define	NUM_SWT				0
#define NUM_SERVO			0

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
/*					Switch Declarations							*/
/* ------------------------------------------------------------ */

/* No switches on this board.
*/

/* ------------------------------------------------------------ */
/*					Servo Pin Declarations						*/
/* ------------------------------------------------------------ */

/* No servo connectors on this board.
*/

/* ------------------------------------------------------------ */
/*					Timer Pin Declarations						*/
/* ------------------------------------------------------------ */

#define PIN_OC1		25
#define	PIN_OC2		28
#define	PIN_OC3		29
#define	PIN_OC4		30
#define	PIN_OC5		22

//#define PIN_IC1		not connected
#define PIN_IC2		24
#define PIN_IC3		27
//#define PIN_IC4		not connected
#define	PIN_IC5		31

//#define	PIN_TCK1	not connected
#define	PIN_TCK2	16
//#define	PIN_TCK3	not connected
//#define	PIN_TCK4	not connected
#define	PIN_TCK5	26

/* ------------------------------------------------------------ */
/*					Interrupt Pin Declarations					*/
/* ------------------------------------------------------------ */

#define	PIN_INT0	25
#define	PIN_INT1	36
#define PIN_INT2	44
#define	PIN_INT3	57
#define	PIN_INT4	58

/* ------------------------------------------------------------ */
/*					SPI Pin Declarations						*/
/* ------------------------------------------------------------ */
/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h
*/
const static uint8_t SS   = 40;		// PIC32 SS2
const static uint8_t MOSI = 41;		// PIC32 SDO2
const static uint8_t MISO = 42;		// PIC32 SDI2
const static uint8_t SCK  = 43;		// PIC32 SCK2

/* The Digilent DSPI library uses these ports.
**		DSPI0	connector JD
**		DSPI1	connector JE
**		DSPI2	connector JF
*/
#define	PIN_DSPI0_SS	24
#define	PIN_DSPI1_SS	32
#define	PIN_DSPI2_SS	40

/* ------------------------------------------------------------ */
/*					Analog Pins									*/
/* ------------------------------------------------------------ */
/* Define symbols for accessing the analog pins. This table is
** used to map an analog pin number to the corresponding digital
** pin number.
*/
#define	A0		0
#define	A1		1
#define A2		2
#define A3		3
#define A4		4
#define A5		5
#define A6		6
#define A7		7
#define A8		20
#define A9		23

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
#define digitalPinToTimerOC(P) ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_OC)  )
#define digitalPinToTimerIC(P) ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_IC)  )
#define digitalPinToTimerTCK(P) ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_TCK)  )
#define portRegisters(P) ( port_to_tris_PGM[P])
#define	digitalPinToAnalog(P) ( (P) < 10 ? (P) : digital_pin_to_analog_PGM[P] )
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

#define	_IPL_UART_ISR	ipl2	//interrupt priority for ISR
#define	_IPL_UART_IPC	2		//interrupt priority for IPC register
#define	_SPL_UART_IPC	0		//interrupt subpriority for IPC register

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

#define	_IPL_SPI_ISR	ipl3	//interrupt priority for the ISR
#define	_IPL_SPI_IPC	3		//interrupt priority for the IPC register
#define	_SPL_SPI_IPC	0		//interrupt subpriority for the IPC register

/* The standard library SPI port uses SPI4. Connector JF
*/
#define	_SPI_BASE		_SPI4_BASE_ADDRESS
#define _SPI_ERR_IRQ	_SPI4_ERR_IRQ
#define	_SPI_RX_IRQ		_SPI4_RX_IRQ
#define	_SPI_TX_IRQ		_SPI4_TX_IRQ
#define	_SPI_VECTOR		_SPI_4_VECTOR

/* The Digilent DSPI library uses these ports.
**		DSPI0	connector JD
**		DSPI1	connector JE
**		DSPI2	connector JF
*/
#define	_DSPI0_BASE			_SPI1_BASE_ADDRESS
#define	_DSPI0_ERR_IRQ		_SPI1_ERR_IRQ
#define	_DSPI0_RX_IRQ		_SPI1_RX_IRQ
#define	_DSPI0_TX_IRQ		_SPI1_TX_IRQ
#define	_DSPI0_VECTOR		_SPI_1_VECTOR

#define	_SPI3_ERR_IRQ	_SPI1A_ERR_IRQ	//this definition is missing from
										// the Microchip header file.
#define	_DSPI1_BASE			_SPI3_BASE_ADDRESS
#define	_DSPI1_ERR_IRQ		_SPI3_ERR_IRQ
#define	_DSPI1_RX_IRQ		_SPI3_RX_IRQ
#define	_DSPI1_TX_IRQ		_SPI3_TX_IRQ
#define	_DSPI1_VECTOR		_SPI_3_VECTOR

#define	_DSPI2_BASE			_SPI4_BASE_ADDRESS
#define	_DSPI2_ERR_IRQ		_SPI4_ERR_IRQ
#define	_DSPI2_RX_IRQ		_SPI4_RX_IRQ
#define	_DSPI2_TX_IRQ		_SPI4_TX_IRQ
#define	_DSPI2_VECTOR		_SPI_4_VECTOR

/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */

#define	_IPL_TWI_ISR	ipl3	//interrupt priority for ISR
#define	_IPL_TWI_IPC	3		//interrupt priority for IPC register
#define	_SPL_TWI_IPC	0		//interrupt subpriority for IPC register

/* The standard I2C port uses I2C2 (SCL2/SDA2) on connector J8.
** This bus has fixed pull-ups and contains the EEPROM.
*/
#define	_TWI_BASE		_I2C2_BASE_ADDRESS
#define	_TWI_BUS_IRQ	_I2C2_BUS_IRQ
#define	_TWI_SLV_IRQ	_I2C2_SLAVE_IRQ
#define	_TWI_MST_IRQ	_I2C2_MASTER_IRQ
#define	_TWI_VECTOR		_I2C_2_VECTOR

/* Declarations for Digilent DTWI library. DTWI0 and DTWI0 are
** connected to the 2x4 I2C daisy chain connectors. The pins for the
** other DTWI are on Pmod connectors.
**		DTWI0 is on J7, has jumperable current mirrors for pull-ups
**		DTWI1 is on J8, has fixed pullups and EEPROM
**		DTWI2 is on JE (pins 2&3), digital pins 33 (SCL) & 34 (SDA)
**		DTWI3 is on JF (pins 2&3), digital pins 41 (SCL) & 42 (SDA)
*/
#define	_DTWI0_BASE		_I2C1_BASE_ADDRESS
#define	_DTWI0_BUS_IRQ	_I2C1_BUS_IRQ
#define	_DTWI0_SLV_IRQ	_I2C1_SLAVE_IRQ
#define	_DTWI0_MST_IRQ	_I2C1_MASTER_IRQ
#define	_DTWI0_VECTOR	_I2C_1_VECTOR

#define	_DTWI1_BASE		_I2C2_BASE_ADDRESS
#define	_DTWI1_BUS_IRQ	_I2C2_BUS_IRQ
#define	_DTWI1_SLV_IRQ	_I2C2_SLAVE_IRQ
#define	_DTWI1_MST_IRQ	_I2C2_MASTER_IRQ
#define	_DTWI1_VECTOR	_I2C_2_VECTOR

#define	_DTWI2_BASE		_I2C3_BASE_ADDRESS
#define	_DTWI2_BUS_IRQ	_I2C3_BUS_IRQ
#define	_DTWI2_SLV_IRQ	_I2C3_SLAVE_IRQ
#define	_DTWI2_MST_IRQ	_I2C3_MASTER_IRQ
#define	_DTWI2_VECTOR	_I2C_3_VECTOR

#define	_DTWI3_BASE		_I2C5_BASE_ADDRESS
#define	_DTWI3_BUS_IRQ	_I2C5_BUS_IRQ
#define	_DTWI3_SLV_IRQ	_I2C5_SLAVE_IRQ
#define	_DTWI3_MST_IRQ	_I2C5_MASTER_IRQ
#define	_DTWI3_VECTOR	_I2C_5_VECTOR

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

#if !defined(OPT_BOARD_DATA)

extern const uint32_t	port_to_tris_PGM[];
extern const uint8_t	digital_pin_to_port_PGM[];
extern const uint16_t	digital_pin_to_bit_mask_PGM[];
extern const uint16_t	digital_pin_to_timer_PGM[];
extern const uint8_t 	digital_pin_to_analog_PGM[];
extern const uint8_t	analog_pin_to_channel_PGM[];

#endif

/* The following declarations define data used in the pin mapping.
** These will be compiled when compiling main.cpp so that this
** header file can be included in multiple modules, be we only 
** get one copy of the data.
*/

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
** containing that pin.
*/
const uint8_t	digital_pin_to_port_PGM[] = {
    // Connector JA
	_IOPORT_PB,		//  0 RB2 		AN2/C2IN-/CN4/RB2
	_IOPORT_PB,		//  1 RB3		AN3/C2IN+/CN5/RB3
	_IOPORT_PB,		//  2 RB4		AN4/C1IN-/CN6/RB4
	_IOPORT_PB,		//  3 RB6		AN6/PGEC2/OCFA/RB6
	_IOPORT_PB,		//  4 RB7		AN7/PGED2/RB7
	_IOPORT_PB,		//  5 RB8		AN8/C1OUT/RB8
	_IOPORT_PB,		//  6 RB9		AN9/C2OUT/RB9
	_IOPORT_PB,		//  7 RB10		AN10/PMA13/RB10

    // Connector JB
	_IOPORT_PE,		//  8 RE0		PMD0/RE0
	_IOPORT_PE,		//  9 RE1		PMD1/RE1
	_IOPORT_PE,		// 10 RE2		PMD2/RE2
	_IOPORT_PE,		// 11 RE3		PMD3/RE3
	_IOPORT_PE,		// 12 RE4		PMD4/RE4
	_IOPORT_PE,		// 13 RE5		PMD5/RE5
	_IOPORT_PE,		// 14 RE6		PMD6/RE6
	_IOPORT_PE,		// 15 RE7		PMD7/RE7
	
    // Connector JC
	_IOPORT_PC,		// 16 RC1		T2CK/RC1
	_IOPORT_PG,		// 17 RG0		PMD8/RG0
	_IOPORT_PG,		// 18 RG1		PMD9/RG1
	_IOPORT_PD,		// 19 RD7		PMD15/CN16/RD7
	_IOPORT_PB,		// 20 RB15		AN15/PMA0/CN12
	_IOPORT_PD,		// 21 RD5		PMRD/CN14/RD5
	_IOPORT_PD,		// 22 RD4		PMWR/OC5/CN13/RD4
	_IOPORT_PB,		// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	_IOPORT_PD,		// 24 RD9		SS1/IC2/RD9
	_IOPORT_PD,		// 25 RD0		SDO1/OC1/INT0/RD0
	_IOPORT_PC,		// 26 RC4		T5CK/SDI1/RC4
	_IOPORT_PD,		// 27 RD10		SCK1/IC3/RD10
	_IOPORT_PD,		// 28 RD1		OC2/RD1
	_IOPORT_PD,		// 29 RD2		OC3/RD2
	_IOPORT_PD,		// 30 RD3		OC4/RD3
	_IOPORT_PD,		// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	_IOPORT_PD,		// 32 RD14		SS1A/U1ACTS/CN20/RD14
	_IOPORT_PF,		// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	_IOPORT_PF,		// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	_IOPORT_PD,		// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	_IOPORT_PE,		// 36 RE8		INT1/RE8
	_IOPORT_PA,		// 37 RA7		TRD3/RA7
	_IOPORT_PA,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	_IOPORT_PA,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	_IOPORT_PF,		// 40 RF12		SS3A/U3ACTS/RF12
	_IOPORT_PF,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	_IOPORT_PF,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	_IOPORT_PF,		// 43 RF13		SCK3A/U3ARTS/RF13
	_IOPORT_PE,		// 44 RE9		INT2/RE9
	_IOPORT_PA,		// 45 RA1		TCK/RA1
	_IOPORT_PA,		// 46 RA4		TDI/RA4
	_IOPORT_PA,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	_IOPORT_PG,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	_IOPORT_PG,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	_IOPORT_PA,		// 50 BTN3		TMS/RA0	
	
	//LEDS
	_IOPORT_PG,		// 51 LD1		TRD1/RG12
	_IOPORT_PG,		// 52 LD2		TRD0/RG13
	_IOPORT_PG,		// 53 LD3		TRD2/RG14
	_IOPORT_PG,		// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	_IOPORT_PA,		// 55 SCL2		SCL2/RA2
	_IOPORT_PA,		// 56 SDA2		SDA2/RA3	
	
	//J7 /I2C PORT 1
	_IOPORT_PA,		// 57 SCL1		SCL1/INT3/RA14
	_IOPORT_PA,		// 58 SDA1		SDA1/INT4/RA15	
	
	//MISC
	_IOPORT_PB,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	_IOPORT_PD		// 60 RD13		ETXD3/PMD13/CN19/RD13 (P32_USBOC)
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
	_BV( 8 ) ,	// 36 RE8		INT1/RE8
	_BV( 7 ) ,	// 37 RA7		TRD3/RA7
	_BV( 9 ) ,	// 38 RA9		VREF-/CVREF-/PMA7/RA9
	_BV( 10 ) ,	// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	_BV( 12 ) ,	// 40 RF12		SS3A/U3ACTS/RF12
	_BV( 5 ) ,	// 41 RF5		SDO3A/U3ATX/CN18/RF5
	_BV( 4 ) ,	// 42 RF4		SDI3A/U3ARX/CN17/RF4
	_BV( 13 ) ,	// 43 RF13		SCK3A/U3ARTS/RF13
	_BV( 9 ) ,	// 44 RE9		INT2/RE9
	_BV( 1 ) ,	// 45 RA1		TCK/RA1
	_BV( 4 ) ,	// 46 RA4		TDI/RA4
	_BV( 5 ) ,	// 47 RA5		TDO/RA5	
	
	//BUTTONS
	_BV( 6 ) ,	// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	_BV( 7 ) ,	// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	_BV( 0 ) ,	// 50 BTN3		TMS/RA0	
	
	//LEDS
	_BV( 12 ) ,	// 51 LD1		TRD1/RG12
	_BV( 13 ) ,	// 52 LD2		TRD0/RG13
	_BV( 14 ) ,	// 53 LD3		TRD2/RG14
	_BV( 15 ) ,	// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	_BV( 2 ) ,	// 55 SCL2		SCL2/RA2
	_BV( 3 ) ,	// 56 SDA2		SDA2/RA3	
	
	//J7 /I2C PORT 1
	_BV( 14 ) ,	// 57 SCL1		SCL1/INT3/RA14
	_BV( 15 ) ,	// 58 SDA1		SDA1/INT4/RA15	
	
	//MISC
	_BV( 5 ) ,	// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	_BV( 13 ) 	// 60 RD13		ETXD3/PMD13/CN19/RD13 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number associated with that pin.
*/
const uint16_t	digital_pin_to_timer_PGM[] = {
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
	_TIMER_TCK2,		// 16 RC1		T2CK/RC1
	NOT_ON_TIMER,		// 17 RG0		PMD8/RG0
	NOT_ON_TIMER,		// 18 RG1		PMD9/RG1
	NOT_ON_TIMER,		// 19 RD7		PMD15/CN16/RD7
	NOT_ON_TIMER,		// 20 RB15		AN15/PMA0/CN12
	NOT_ON_TIMER,		// 21 RD5		PMRD/CN14/RD5
	_TIMER_OC5,			// 22 RD4		PMWR/OC5/CN13/RD4
	NOT_ON_TIMER,		// 23 RB14		AN14/PMA1/RB14

    // Connector JD
	_TIMER_IC2,			// 24 RD9		SS1/IC2/RD9
	_TIMER_OC1,			// 25 RD0		SDO1/OC1/INT0/RD0
	_TIMER_TCK5,		// 26 RC4		T5CK/SDI1/RC4
	_TIMER_IC3,			// 27 RD10		SCK1/IC3/RD10
	_TIMER_OC2,			// 28 RD1		OC2/RD1
	_TIMER_OC3,			// 29 RD2		OC3/RD2
	_TIMER_OC4,			// 30 RD3		OC4/RD3
	_TIMER_IC5,			// 31 RD12		IC5/PMD12/RD12

    // Connector JE
	NOT_ON_TIMER,		// 32 RD14		SS1A/U1ACTS/CN20/RD14
	NOT_ON_TIMER,		// 33 RF8		SCL1A/SDO1A/U1ATX/RF8
	NOT_ON_TIMER,		// 34 RF2		SDA1A/SDI1A/U1ARX/RF2
	NOT_ON_TIMER,		// 35 RD15		SCK1A/U1ARTS/CN21/RD15
	NOT_ON_TIMER,		// 36 RE8		INT1/RE8
	NOT_ON_TIMER,		// 37 RA7		TRD3/RA7
	NOT_ON_TIMER,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	NOT_ON_TIMER,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	NOT_ON_TIMER,		// 40 RF12		SS3A/U3ACTS/RF12
	NOT_ON_TIMER,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	NOT_ON_TIMER,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	NOT_ON_TIMER,		// 43 RF13		SCK3A/U3ARTS/RF13
	NOT_ON_TIMER,		// 44 RE9		INT2/RE9
	NOT_ON_TIMER,		// 45 RA1		TCK/RA1
	NOT_ON_TIMER,		// 46 RA4		TDI/RA4
	NOT_ON_TIMER,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	NOT_ON_TIMER,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	NOT_ON_TIMER,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ON_TIMER,		// 50 BTN3		TMS/RA0	
	
	//LEDS
	NOT_ON_TIMER,		// 51 LD1		TRD1/RG12
	NOT_ON_TIMER,		// 52 LD2		TRD0/RG13
	NOT_ON_TIMER,		// 53 LD3		TRD2/RG14
	NOT_ON_TIMER,		// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	NOT_ON_TIMER,		// 55 SCL2		SCL2/RA2
	NOT_ON_TIMER,		// 56 SDA2		SDA2/RA3	
	
	//J7 /I2C PORT 1
	NOT_ON_TIMER,		// 57 SCL1		SCL1/INT3/RA14
	NOT_ON_TIMER,		// 58 SDA1		SDA1/INT4/RA15	
	
	//MISC
	NOT_ON_TIMER,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	NOT_ON_TIMER		// 60 RD13		ETXD3/PMD13/CN19/RD13 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table maps from a digital pin number to the corresponding
** analog pin number.
*/
const uint8_t digital_pin_to_analog_PGM[] = {
    // Connector JA
	_BOARD_AN0,			//  0 RB2 		AN2/C2IN-/CN4/RB2
	_BOARD_AN1,			//  1 RB3		AN3/C2IN+/CN5/RB3
	_BOARD_AN2,			//  2 RB4		AN4/C1IN-/CN6/RB4
	_BOARD_AN3,			//  3 RB6		AN6/PGEC2/OCFA/RB6
	_BOARD_AN4,			//  4 RB7		AN7/PGED2/RB7
	_BOARD_AN5,			//  5 RB8		AN8/C1OUT/RB8
	_BOARD_AN6,			//  6 RB9		AN9/C2OUT/RB9
	_BOARD_AN7,			//  7 RB10		AN10/PMA13/RB10

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
	_BOARD_AN8,			// 20 RB15		AN15/PMA0/CN12
	NOT_ANALOG_PIN,		// 21 RD5		PMRD/CN14/RD5
	NOT_ANALOG_PIN,		// 22 RD4		PMWR/OC5/CN13/RD4
	_BOARD_AN9,			// 23 RB14		AN14/PMA1/RB14

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
	NOT_ANALOG_PIN,		// 36 RE8		INT1/RE8
	NOT_ANALOG_PIN,		// 37 RA7		TRD3/RA7
	NOT_ANALOG_PIN,		// 38 RA9		VREF-/CVREF-/PMA7/RA9
	NOT_ANALOG_PIN,		// 39 RA10		VREF+/CVREF+/PMA6/RA10    
    
    // Connector JF
	NOT_ANALOG_PIN,		// 40 RF12		SS3A/U3ACTS/RF12
	NOT_ANALOG_PIN,		// 41 RF5		SDO3A/U3ATX/CN18/RF5
	NOT_ANALOG_PIN,		// 42 RF4		SDI3A/U3ARX/CN17/RF4
	NOT_ANALOG_PIN,		// 43 RF13		SCK3A/U3ARTS/RF13
	NOT_ANALOG_PIN,		// 44 RE9		INT2/RE9
	NOT_ANALOG_PIN,		// 45 RA1		TCK/RA1
	NOT_ANALOG_PIN,		// 46 RA4		TDI/RA4
	NOT_ANALOG_PIN,		// 47 RA5		TDO/RA5	
	
	//BUTTONS
	NOT_ANALOG_PIN,		// 48 BTN1		ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	NOT_ANALOG_PIN,		// 49 BTN2		ECRS/SDA2A/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ANALOG_PIN,		// 50 BTN3		TMS/RA0	
	
	//LEDS
	NOT_ANALOG_PIN,		// 51 LD1		TRD1/RG12
	NOT_ANALOG_PIN,		// 52 LD2		TRD0/RG13
	NOT_ANALOG_PIN,		// 53 LD3		TRD2/RG14
	NOT_ANALOG_PIN,		// 54 LD4		AERXERR/RG15
	
	//J8 /I2C PORT 2 
	NOT_ANALOG_PIN,		// 55 SCL2		SCL2/RA2
	NOT_ANALOG_PIN,		// 56 SDA2		SDA2/RA3	
	
	//J7 /I2C PORT 1
	NOT_ANALOG_PIN,		// 57 SCL1		SCL1/INT3/RA14
	NOT_ANALOG_PIN,		// 58 SDA1		SDA1/INT4/RA15	
	
	//MISC
	NOT_ANALOG_PIN,		// 59 RB5		AN5/C1IN+/VBUSON/CN7/RB5 (P32_VBUSON)
	NOT_ANALOG_PIN		// 60 RD13		ETXD3/PMD13/CN19/RD13 (P32_USBOC)
};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	chipKIT Pin		PIC32 Analog channel
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

#endif	// _BOARD_DATA_

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
