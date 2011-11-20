/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent Cerebot MX3ck		*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declartions and data structure	*/
/* to customize the chipKIT MPIDE for use with the Digilent Cerebot		*/
/* MX3ck board.															*/
/*																		*/
/* This code is based on earlier work:									*/
/*		Copyright (c) 2010, 2011 by Mark Sproul							*/
/*		Copyright (c) 2005, 2006 by David A. Mellis						*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	10/05/2011(GeneA): Created											*/
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

#define	_BOARD_NAME_	"Cerebot MX3cK"

/* Define the processor on the board.
*/
#define	_CPU_NAME_	"32MX320F128H"
#define	FLASHEND	(((128 - 4) * 1024L) - 1)
#define	RAMEND		((16 * 1024L) - 1)

/* Define the peripherals available on the board.
*/
#define	NUM_DIGITAL_PINS	44
#define	NUM_ANALOG_PINS		11
#define	NUM_OC_PINS			5
#define	NUM_IC_PINS			5
#define	NUM_TCK_PINS		0
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	2
#define	NUM_SPI_PORTS		1
#define	NUM_I2C_PORTS		1

#define NUM_DSPI_PORTS		2
#define NUM_DTWI_PORTS		2

/* Define I/O devices on the board.
*/
#define	NUM_LED				2		//number of discrete LEDs
#define NUM_BTN				0		//number of push buttons
#define	NUM_SWT				0		//number of slide/toggle switches
#define NUM_SERVO			0		//number of servo connectors

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs
*/
#define	PIN_LED1	42
#define	PIN_LED2	43

/* ------------------------------------------------------------ */
/*					Button Declarations							*/
/* ------------------------------------------------------------ */

/* No buttons on this board.
*/

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

#define PIN_OC1		22
#define	PIN_OC2		23
#define	PIN_OC3		25
#define	PIN_OC4		29
#define	PIN_OC5		14

#define PIN_IC1		36
#define PIN_IC2		8
#define PIN_IC3		26
#define PIN_IC4		30
#define	PIN_IC5		14

//#define	PIN_TCK1	not connected
//#define	PIN_TCK2	not available on the chip
//#define	PIN_TCK3	not available on the chip
//#define	PIN_TCK4	not available on the chip
//#define	PIN_TCK5	not available on the chip

/* ------------------------------------------------------------ */
/*					Interrupt Pin Declarations					*/
/* ------------------------------------------------------------ */

#define	PIN_INT0	11
#define	PIN_INT1	36
#define PIN_INT2	8
#define	PIN_INT3	26
#define	PIN_INT4	30

/* ------------------------------------------------------------ */
/*					SPI Pin Declarations						*/
/* ------------------------------------------------------------ */
/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h
*/
const static uint8_t SS   = 32;		// PIC32 SS2
const static uint8_t MOSI = 33;		// PIC32 SDO2
const static uint8_t MISO = 34;		// PIC32 SDI2
const static uint8_t SCK  = 35;		// PIC32 SCK2

/* The Digilent DSPI library uses these ports.
**		DSPI0	connector JE
**		DSPI1	connector JB
*/
#define	PIN_DSPI0_SS	32
#define	PIN_DSPI1_SS	8		// only usable as a master, not a slave

/* ------------------------------------------------------------ */
/*					Analog Pin Declarations						*/
/* ------------------------------------------------------------ */
/* Define symbols for accessing the analog pins. This table is
** used to map an analog pin number to the corresponding digital
** pin number.
*/
#define	A0		16
#define	A1		19
#define A2		20
#define A3		21
#define A4		24
#define A5		27
#define A6		28
#define A7		31
#define A8		37
#define A9		38
#define A10		39

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
#define	digitalPinToAnalog(P) ( ((P) < NUM_ANALOG_PINS) ? (P) : digital_pin_to_analog_PGM[P] )
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

/* The standard SPI port uses SPI2. Connector JE.
*/
#define	_SPI_BASE		_SPI2_BASE_ADDRESS
#define _SPI_ERR_IRQ	_SPI2_ERR_IRQ
#define	_SPI_RX_IRQ		_SPI2_RX_IRQ
#define	_SPI_TX_IRQ		_SPI2_TX_IRQ
#define	_SPI_VECTOR		_SPI_2_VECTOR

/* The Digilent DSPI library uses these ports.
**		DSPI0	connector JE
**		DSPI1	connector JB
*/
#define	_DSPI0_BASE			_SPI2_BASE_ADDRESS
#define	_DSPI0_ERR_IRQ		_SPI2_ERR_IRQ
#define	_DSPI0_RX_IRQ		_SPI2_RX_IRQ
#define	_DSPI0_TX_IRQ		_SPI2_TX_IRQ
#define	_DSPI0_VECTOR		_SPI_2_VECTOR

#define	_DSPI1_BASE			_SPI1_BASE_ADDRESS
#define	_DSPI1_ERR_IRQ		_SPI1_ERR_IRQ
#define	_DSPI1_RX_IRQ		_SPI1_RX_IRQ
#define	_DSPI1_TX_IRQ		_SPI1_TX_IRQ
#define	_DSPI1_VECTOR		_SPI_1_VECTOR

/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */

#define	_IPL_TWI_ISR	ipl3	//interrupt priority for ISR
#define	_IPL_TWI_IPC	3		//interrupt priority for IPC register
#define	_SPL_TWI_IPC	0		//interrupt subpriority for IPC register

/* The standard I2C port uses I2C1 (SCL1/SDA1). Connector J2
*/
#define	_TWI_BASE		_I2C1_BASE_ADDRESS
#define	_TWI_BUS_IRQ	_I2C1_BUS_IRQ
#define	_TWI_SLV_IRQ	_I2C1_SLAVE_IRQ
#define	_TWI_MST_IRQ	_I2C1_MASTER_IRQ
#define	_TWI_VECTOR		_I2C_1_VECTOR

/* Declarations for Digilent DTWI library.
**		DTWI0 is on connector J2
**		DTWI1 is on connector JC (requires external pullups)
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
const uint32_t port_to_tris_PGM[] = {
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
	_IOPORT_PE,		//	0  RE0		PMD0/RE0
	_IOPORT_PE,		//	1  RE1		PMD1/RE1
	_IOPORT_PE,		//	2  RE2		PMD2/RE2
	_IOPORT_PE,		//	3  RE3		PMD3/RE3
	_IOPORT_PE,		//	4  RE4		PMD4/RE4
	_IOPORT_PE,		//	5  RE5		PMD5/RE5
	_IOPORT_PE,		//	6  RE6		PMD6/RE6
	_IOPORT_PE,		//	7  RE7		PMD7/RE7
	
	//Connector JB
	_IOPORT_PD,		//	8  RD9		IC2/U1CTS/INT2/RD9
	_IOPORT_PF,		//	9  RF3		U1TX/SDO1/RF3
	_IOPORT_PF,		//	10 RF2		U1RX/SDI1/RF2
	_IOPORT_PF,		//	11 RF6		U1RTS/SCK1/INT0/RF6
	_IOPORT_PD,		//	12 RD6		CN15/RD6
	_IOPORT_PD,		//	13 RD5		PMRD/CN14/RD5	
	_IOPORT_PD,		//	14 RD4		PMWR/OC5/IC5/CN13/RD4
	_IOPORT_PD,		//	15 RD7		CN16/RD7
	
	//Connector JC
	_IOPORT_PB,		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	_IOPORT_PF,		//	17 RF5		U2TX/PMA8/SCL2/CN18/RF5
	_IOPORT_PF, 	//	18 RF4		U2RX/PMA9/SDA2/CN17/RF4
	_IOPORT_PB,		//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14
	_IOPORT_PB,		//	20 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	_IOPORT_PB,		//	21 RB1		AN1/VREF-/CVREF-/CN3/RB1
	_IOPORT_PD,		//	22 RD0		OC1/RD0
	_IOPORT_PD,		//	23 RD1		OC2/RD1
	
	//Connector JD
	_IOPORT_PB,		//	24 RB2		C2IN-/AN2/SS1/CN4/RB2
	_IOPORT_PD,		//	25 RD2		OC3/RD2
	_IOPORT_PD,		//	26 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_IOPORT_PB,		//	27 RB9		PMA7/C2OUT/AN9/RB9
	_IOPORT_PB,		//	28 RB12		TCK/PMA11/AN12/RB12
	_IOPORT_PD,		//	29 RD3		OC4/RD3
	_IOPORT_PD,		//	30 RD11		IC4/PMCS1/PMA14/INT4/RD11
	_IOPORT_PB,		//	31 RB13		TDI/PMA10/AN13/RB13
	
	//Connector JE
	_IOPORT_PG,		//  32 RG9		PMA2/SS2/CN11/RG9
	_IOPORT_PG,		//	33 RG8		MOSI/RG8
	_IOPORT_PG,		//	34 RG7		MISO/RG7
	_IOPORT_PG,		//	35 RG6		SCK2/PMA5/CN8/RG6
	_IOPORT_PD,		//	36 RD8		IC1/RTCC/INT1/RD8
	_IOPORT_PB,		//	37 RB5		C1IN+/AN5/CN7/RB5
	_IOPORT_PB,		//	38 RB4		C1IN-/AN4/CN6/RB4
	_IOPORT_PB,		//	39 RB3		C2IN+/AN3/CN5/RB3
	
	//I2C connector J2
	_IOPORT_PG,		//	40 RG3		SDA1/RG3
	_IOPORT_PG,		//	41 RG2		SCL1/RG2
	
	//LEDs	
	_IOPORT_PF,		//	42 RF0		LED4
	_IOPORT_PF,		//	43 RF1		LED5
	
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t digital_pin_to_bit_mask_PGM[] = {
	//Connector JA
	_BV( 0 ) ,		//	0  RE0		PMD0/RE0
	_BV( 1 ) ,		//	1  RE1		PMD1/RE1
	_BV( 2 ) ,		//	2  RE2		PMD2/RE2
	_BV( 3 ) ,		//	3  RE3		PMD3/RE3
	_BV( 4 ) ,		//	4  RE4		PMD4/RE4
	_BV( 5 ) ,		//	5  RE5		PMD5/RE5
	_BV( 6 ) ,		//	6  RE6		PMD6/RE6
	_BV( 7 ) ,		//	7  RE7		PMD7/RE7
	
	//Connector JB
	_BV( 9 ) ,		//	8  RD9		IC2/U1CTS/INT2/RD9
	_BV( 3 ) ,		//	9  RF3		U1TX/SDO1/RF3
	_BV( 2 ) ,		//	10 RF2		U1RX/SDI1/RF2
	_BV( 6 ) ,		//	11 RF6		U1RTS/SCK1/INT0/RF6
	_BV( 6 ) ,		//	12 RD6		CN15/RD6
	_BV( 5 ) ,		//	13 RD5		PMRD/CN14/RD5	
	_BV( 4 ) ,		//	14 RD4		PMWR/OC5/IC5/CN13/RD4
	_BV( 7 ) ,		//	15 RD7		CN16/RD7
	
	//Connector JC
	_BV( 8 ) ,		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	_BV( 5 ) ,		//	17 RF5		U2TX/PMA8/SCL2/CN18/RF5
	_BV( 4 ) , 		//	18 RF4		U2RX/PMA9/SDA2/CN17/RF4
	_BV( 14 ),		//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14
	_BV( 0 ) ,		//	20 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	_BV( 1 ) ,		//	21 RB1		AN1/VREF-/CVREF-/CN3/RB1
	_BV( 0 ) ,		//	22 RD0		OC1/RD0
	_BV( 1 ) ,		//	23 RD1		OC2/RD1
	
	//Connector JD
	_BV( 2 ) ,		//	24 RB2		C2IN-/AN2/SS1/CN4/RB2
	_BV( 2 ) ,		//	25 RD2		OC3/RD2
	_BV( 10 ) ,		//	26 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_BV( 9 ) ,		//	27 RB9		PMA7/C2OUT/AN9/RB9
	_BV( 12 ) ,		//	28 RB12		TCK/PMA11/AN12/RB12
	_BV( 3 ) ,		//	29 RD3		OC4/RD3
	_BV( 11 ) ,		//	30 RD11		IC4/PMCS1/PMA14/INT4/RD11
	_BV( 13 ) ,		//	31 RB13		TDI/PMA10/AN13/RB13
	
	//Connector JE
	_BV( 9 ) ,		//  32 RG9		PMA2/SS2/CN11/RG9
	_BV( 8 ) ,		//	33 RG8		MOSI/RG8
	_BV( 7 ) ,		//	34 RG7		MISO/RG7
	_BV( 6 ) ,		//	35 RG6		SCK2/PMA5/CN8/RG6
	_BV( 8 ) ,		//	36 RD8		IC1/RTCC/INT1/RD8
	_BV( 5 ) ,		//	37 RB5		C1IN+/AN5/CN7/RB5
	_BV( 4 ) ,		//	38 RB4		C1IN-/AN4/CN6/RB4
	_BV( 3 ) ,		//	39 RB3		C2IN+/AN3/CN5/RB3
	
	//I2C Connector J2
	_BV( 3 ) ,		//	40 RG3		SDA1/RG3
	_BV( 2 ) ,		//	41 RG2		SCL1/RG2
	
	//LEDs	
	_BV( 0 ) ,		//	42 RF0		LED4
	_BV( 1 ) ,		//	43 RF1		LED5

};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number associated with that pin.
*/
const uint16_t digital_pin_to_timer_PGM[] = {
	// Connector JA
	NOT_ON_TIMER,			//	0  RE0		PMD0/RE0
	NOT_ON_TIMER,			//	1  RE1		PMD1/RE1
	NOT_ON_TIMER,			//	2  RE2		PMD2/RE2
	NOT_ON_TIMER,			//	3  RE3		PMD3/RE3
	NOT_ON_TIMER,			//	4  RE4		PMD4/RE4
	NOT_ON_TIMER,			//	5  RE5		PMD5/RE5
	NOT_ON_TIMER,			//	6  RE6		PMD6/RE6
	NOT_ON_TIMER,			//	7  RE7		PMD7/RE7
	
	// Connector JB
	_TIMER_IC2,				//	8  RD9		IC2/U1CTS/INT2/RD9
	NOT_ON_TIMER,			//	9  RF3		U1TX/SDO1/RF3
	NOT_ON_TIMER,			//	10 RF2		U1RX/SDI1/RF2
	NOT_ON_TIMER,			//	11 RF6		U1RTS/SCK1/INT0/RF6
	NOT_ON_TIMER,			//	12 RD6		CN15/RD6
	NOT_ON_TIMER,			//	13 RD5		PMRD/CN14/RD5	
	_TIMER_OC5|_TIMER_IC5,	//	14 RD4		PMWR/OC5/IC5/CN13/RD4
	NOT_ON_TIMER,			//	15 RD7		CN16/RD7
	
	// Connector JC
	NOT_ON_TIMER,			//	16 RB8		U2CTS/C1OUT/AN8/RB8
	NOT_ON_TIMER,			//	17 RF5		U2TX/PMA8/SCL2/CN18/RF5
	NOT_ON_TIMER, 			//	18 RF4		U2RX/PMA9/SDA2/CN17/RF4
	NOT_ON_TIMER,			//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14
	NOT_ON_TIMER,			//	20 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	NOT_ON_TIMER,			//	21 RB1		AN1/VREF-/CVREF-/CN3/RB1
	_TIMER_OC1,				//	22 RD0		OC1/RD0
	_TIMER_OC2,				//	23 RD1		OC2/RD1
	
	// Connector JD
	NOT_ON_TIMER,			//	24 RB2		C2IN-/AN2/SS1/CN4/RB2
	_TIMER_OC3,				//	25 RD2		OC3/RD2
	_TIMER_IC3,				//	26 RD10		IC3/PMCS2/PMA15/INT3/RD10
	NOT_ON_TIMER,			//	27 RB9		PMA7/C2OUT/AN9/RB9
	NOT_ON_TIMER,			//	28 RB12		TCK/PMA11/AN12/RB12
	_TIMER_OC4,				//	29 RD3		OC4/RD3
	_TIMER_IC4,				//	30 RD11		IC4/PMCS1/PMA14/INT4/RD11
	NOT_ON_TIMER,			//	31 RB13		TDI/PMA10/AN13/RB13
	
	// Connector JE
	NOT_ON_TIMER,			//  32 RG9		PMA2/SS2/CN11/RG9
	NOT_ON_TIMER,			//	33 RG8		MOSI/RG8
	NOT_ON_TIMER,			//	34 RG7		MISO/RG7
	NOT_ON_TIMER,			//	35 RG6		SCK2/PMA5/CN8/RG6
	_TIMER_IC1,				//	36 RD8		IC1/RTCC/INT1/RD8
	NOT_ON_TIMER,			//	37 RB5		C1IN+/AN5/CN7/RB5
	NOT_ON_TIMER,			//	38 RB4		C1IN-/AN4/CN6/RB4
	NOT_ON_TIMER,			//	39 RB3		C2IN+/AN3/CN5/RB3
	
	// I2C Connector J2
	NOT_ON_TIMER,			//	40 RG3		SDA1/RG3
	NOT_ON_TIMER,			//	41 RG2		SCL1/RG2
	
	//LEDs	
	NOT_ON_TIMER,			//	42 RF0		LED4
	NOT_ON_TIMER,			//	43 RF1		LED5
};

/* ------------------------------------------------------------ */
/* This table maps from a digital pin number to the corresponding
** analog pin number.
*/
const uint8_t digital_pin_to_analog_PGM[] = {
	// Connector JA
	NOT_ANALOG_PIN,		//	0  RE0		PMD0/RE0
	NOT_ANALOG_PIN,		//	1  RE1		PMD1/RE1
	NOT_ANALOG_PIN,		//	2  RE2		PMD2/RE2
	NOT_ANALOG_PIN,		//	3  RE3		PMD3/RE3
	NOT_ANALOG_PIN,		//	4  RE4		PMD4/RE4
	NOT_ANALOG_PIN,		//	5  RE5		PMD5/RE5
	NOT_ANALOG_PIN,		//	6  RE6		PMD6/RE6
	NOT_ANALOG_PIN,		//	7  RE7		PMD7/RE7
	
	// Connector JB
	NOT_ANALOG_PIN,		//	8  RD9		IC2/U1CTS/INT2/RD9
	NOT_ANALOG_PIN,		//	9  RF3		U1TX/SDO1/RF3
	NOT_ANALOG_PIN,		//	10 RF2		U1RX/SDI1/RF2
	NOT_ANALOG_PIN,		//	11 RF6		U1RTS/SCK1/INT0/RF6
	NOT_ANALOG_PIN,		//	12 RD6		CN15/RD6
	NOT_ANALOG_PIN,		//	13 RD5		PMRD/CN14/RD5	
	NOT_ANALOG_PIN,		//	14 RD4		PMWR/OC5/IC5/CN13/RD4
	NOT_ANALOG_PIN,		//	15 RD7		CN16/RD7
	
	// Connector JC
	_BOARD_AN0,			//	16 RB8		U2CTS/C1OUT/AN8/RB8
	NOT_ANALOG_PIN,		//	17 RF5		U2TX/PMA8/SCL2/CN18/RF5
	NOT_ANALOG_PIN, 	//	18 RF4		U2RX/PMA9/SDA2/CN17/RF4
	_BOARD_AN1,			//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14
	_BOARD_AN2,			//	20 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	_BOARD_AN3,			//	21 RB1		AN1/VREF-/CVREF-/CN3/RB1
	NOT_ANALOG_PIN,		//	22 RD0		OC1/RD0
	NOT_ANALOG_PIN,		//	23 RD1		OC2/RD1
	
	// Connector JD
	_BOARD_AN4,			//	24 RB2		C2IN-/AN2/SS1/CN4/RB2
	NOT_ANALOG_PIN,		//	25 RD2		OC3/RD2
	NOT_ANALOG_PIN,		//	26 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_BOARD_AN5,			//	27 RB9		PMA7/C2OUT/AN9/RB9
	_BOARD_AN6,			//	28 RB12		TCK/PMA11/AN12/RB12
	NOT_ANALOG_PIN,		//	29 RD3		OC4/RD3
	NOT_ANALOG_PIN,		//	30 RD11		IC4/PMCS1/PMA14/INT4/RD11
	_BOARD_AN7,			//	31 RB13		TDI/PMA10/AN13/RB13
	
	// Connector JE
	NOT_ANALOG_PIN,		//  32 RG9		PMA2/SS2/CN11/RG9
	NOT_ANALOG_PIN,		//	33 RG8		MOSI/RG8
	NOT_ANALOG_PIN,		//	34 RG7		MISO/RG7
	NOT_ANALOG_PIN,		//	35 RG6		SCK2/PMA5/CN8/RG6
	NOT_ANALOG_PIN,		//	36 RD8		IC1/RTCC/INT1/RD8
	_BOARD_AN8,			//	37 RB5		C1IN+/AN5/CN7/RB5
	_BOARD_AN9,			//	38 RB4		C1IN-/AN4/CN6/RB4
	_BOARD_AN10,		//	39 RB3		C2IN+/AN3/CN5/RB3
	
	// I2C Connector J2
	NOT_ANALOG_PIN,		//	40 RG3		SDA1/RG3
	NOT_ANALOG_PIN,		//	41 RG2		SCL1/RG2
	
	//LEDs	
	NOT_ANALOG_PIN,		//	42 RF0		LED4
	NOT_ANALOG_PIN,		//	43 RF1		LED5
};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	chipKIT Pin		PIC32 Analog channel
	8,		//*	A0						AN8
	14,		//*	A1						AN14
	0,		//*	A2						AN0
	1,		//*	A3						AN1
	2,		//*	A4						AN2
	9,		//*	A5						AN9
	12,		//*	A6						AN12
	13,		//*	A7						AN5
	5,		//*	A8						AN13
	4,		//*	A9						AN5
	3,		//*	A10						AN4
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
