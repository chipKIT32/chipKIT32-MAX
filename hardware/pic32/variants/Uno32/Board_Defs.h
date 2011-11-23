/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent chipKIT Uno32		*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declartions and data structure	*/
/* to customize the chipKIT MPIDE for use with the Digilent chipKIT		*/
/* Uno32 board.															*/
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

#define	_BOARD_NAME_	"chipKIT Uno32"

/* Define the processor on the board.
*/
#define	_CPU_NAME_	"32MX320F128H"
#define	FLASHEND	(((128 - 4) * 1024L) - 1)
#define	RAMEND		((16 * 1024L) - 1)

/* Define the Microcontroller peripherals available on the board.
*/
#define	NUM_DIGITAL_PINS	47
#define	NUM_ANALOG_PINS		12
#define NUM_OC_PINS			5
#define	NUM_IC_PINS			5
#define	NUM_TCK_PINS		0
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	2
#define	NUM_SPI_PORTS		1
#define	NUM_I2C_PORTS		1

#define NUM_DSPI_PORTS		2
#define	NUM_DTWI_PORTS		2

/* Define I/O devices on the board.
*/
#define	NUM_LED				2
#define NUM_BTN				0
#define	NUM_SWT				0
#define NUM_SERVO			0

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs.
*/
#define	PIN_LED1	13
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

#define PIN_OC1		3
#define	PIN_OC2		5
#define	PIN_OC3		6
#define	PIN_OC4		9
#define	PIN_OC5		10

#define PIN_IC1		2
#define PIN_IC2		7
#define PIN_IC3		8
#define PIN_IC4		35
#define	PIN_IC5		10

//#define	PIN_TCK1	not connected
//#define	PIN_TCK2	not available on the chip
//#define	PIN_TCK3	not available on the chip
//#define	PIN_TCK4	not available on the chip
//#define	PIN_TCK5	not available on the chip

/* ------------------------------------------------------------ */
/*					Interrupt Pin Declarations					*/
/* ------------------------------------------------------------ */

#define	PIN_INT0	38
#define	PIN_INT1	2
#define PIN_INT2	7
#define	PIN_INT3	8
#define	PIN_INT4	35

/* ------------------------------------------------------------ */
/*					SPI Pin Declarations						*/
/* ------------------------------------------------------------ */
/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h
*/
const static uint8_t SS   = 10;		// for SPI master operation, this
									// is actually RD4 (JP4 in RD4 pos)
const static uint8_t MOSI = 11;		// PIC32 SDO2
const static uint8_t MISO = 12;		// PIC32 SDI2
const static uint8_t SCK  = 13;		// PIC32 SCK2

/* The Digilent DSPI library uses these ports.
*/
#define	PIN_DSPI0_SS	10
#define	PIN_DSPI1_SS	14

/* ------------------------------------------------------------ */
/*					Analog Pins									*/
/* ------------------------------------------------------------ */
/* Define symbols for accessing the analog pins. This table is
** used to map an analog pin number to the corresponding digital
** pin number.
*/
#define	A0		14
#define	A1		15
#define A2		16
#define A3		17
#define A4		18
#define A5		19
#define A6		20
#define A7		21
#define A8		22
#define A9		23
#define A10		24
#define A11		25

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
#define digitalPinToTimerOC(P)  ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_OC)  )
#define digitalPinToTimerIC(P)  ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_IC)  )
#define digitalPinToTimerTCK(P) ( (digital_pin_to_timer_PGM[P] & _MSK_TIMER_TCK) )
#define	digitalPinToTimer(P)	digitalPinToTimerOC(P)
#define portRegisters(P) ( port_to_tris_PGM[P] )
#define portModeRegister(P) ( (volatile uint32_t *)port_to_tris_PGM[P] )
#define portInputRegister(P) ( (volatile uint32_t *)(port_to_tris_PGM[P] + 0x0010) )
#define portOutputRegister(P) ( (volatile uint32_t *)(port_to_tris_PGM[P] + 0x0020) )
#define	digitalPinToAnalog(P) ( (P) < 12 ? (P) : ((P) >= 14) && ((P) < 26) ? (P)-14 : NOT_ANALOG_PIN )
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

/* The standard SPI port uses SPI2.
*/
#define	_SPI_BASE		_SPI2_BASE_ADDRESS
#define _SPI_ERR_IRQ	_SPI2_ERR_IRQ
#define	_SPI_RX_IRQ		_SPI2_RX_IRQ
#define	_SPI_TX_IRQ		_SPI2_TX_IRQ
#define	_SPI_VECTOR		_SPI_2_VECTOR

/* The Digilent DSPI library uses these ports.
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

/* The standard I2C port uses I2C1 (SCL1/SDA1). These come to pins
** A4/A5 on the analog connector. It is necessary to have jumpers
** JP6/JP8 set appropriately (RG2/RG3 position) to access the I2C
** signals.
*/
#define	_TWI_BASE		_I2C1_BASE_ADDRESS
#define	_TWI_BUS_IRQ	_I2C1_BUS_IRQ
#define	_TWI_SLV_IRQ	_I2C1_SLAVE_IRQ
#define	_TWI_MST_IRQ	_I2C1_MASTER_IRQ
#define	_TWI_VECTOR		_I2C_1_VECTOR

/* Declarations for Digilent DTWI library.
**		DTWI0 is on A4/A5 (see above comment).
**		DTWI1 is on digital pins 38 & 39.
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
extern const uint8_t	analog_pin_to_channel_PGM[];

#endif

/* The following declarations define data used in the pin mapping.
** These will be compiled only when compiling pins_arduino.c so 
** that this header file can be included in multiple modules, but
** there will only be one copy of the data.
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
const uint8_t digital_pin_to_port_PGM[] = {
	_IOPORT_PF,		//	0 RF2		U1RX/SDI1/RF2
	_IOPORT_PF,		//	1 RF3		U1TX/SDO1/RF3
	_IOPORT_PD,		//	2 RD8		IC1/RTCC/INT1/RD8
	_IOPORT_PD,		//	3 RD0		OC1/RD0
	_IOPORT_PF,		//	4 RF1
	_IOPORT_PD,		//	5 RD1		OC2/RD1
	_IOPORT_PD,		//	6 RD2		OC3/RD2
	_IOPORT_PD,		//	7 RD9		IC2/U1CTS/INT2/RD9
	_IOPORT_PD,		//	8 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_IOPORT_PD,		//	9 RD3		OC4/RD3
	_IOPORT_PD,		//	10 RD4		PMWR/OC5/IC5/CN13/RD4)
	_IOPORT_PG,		//	11 RG8		(SDO2/PMA3/CN10/RG8) or (SDI2/PMA5/CN8/RG7)
	_IOPORT_PG,		//	12 RG7		(SDI2/PMA5/CN8/RG7) or (SDO2/PMA3/CN10/RG8)
	_IOPORT_PG,		//	13 RG6		SCK2/PMA5/CN8/RG6		LD4
	_IOPORT_PB,		//	14 RB2		C2IN-/AN2/SS1/CN4/RB2
	_IOPORT_PB,		//	15 RB4		C1IN-/AN4/CN6/RB4
	_IOPORT_PB,		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	_IOPORT_PB,		//	17 RB10		TMS/CVREFOUT/PMA13/AN10/RB10
	_IOPORT_PB,		//	18 RB12		TCK/PMA11/AN12/RB12
	_IOPORT_PB,		//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14

	_IOPORT_PB,		//	20 RB3		C2IN+/AN3/CN5/RB3
	_IOPORT_PB,		//	21 RB5		C1IN+/AN5/CN7/RB5
	_IOPORT_PB,		//	22 RB9		PMA7/C2OUT/AN9/RB9
	_IOPORT_PB,		//	23 RB11		TDO/PMA12/AN11/RB11
	_IOPORT_PB,		//	24 RB13		TDI/PMA10/AN13/RB13
	_IOPORT_PB,		//	25 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15

	_IOPORT_PE,		//	26 RE0		PMD0/RE0
	_IOPORT_PE,		//	27 RE1		PMD1/RE1
	_IOPORT_PE,		//	28 RE2		PMD2/RE2
	_IOPORT_PE,		//	29 RE3		PMD3/RE3
	_IOPORT_PE,		//	30 RE4		PMD4/RE4
	_IOPORT_PE,		//	31 RE5		PMD5/RE5
	_IOPORT_PE,		//	32 RE6		PMD6/RE6
	_IOPORT_PE,		//	33 RE7		PMD7/RE7
	_IOPORT_PD,		//	34 RD5		PMRD/CN14/RD5
	_IOPORT_PD,		//	35 RD11		IC4/PMCS1/PMA14/INT4/RD11
	_IOPORT_PD,		//	36 RD6		CN15/RD6
	_IOPORT_PD,		//	37 RD7		CN16/RD7
	_IOPORT_PF,		//	38 RF6		U1RTS/BCLK1/SCK1/INT0/RF6
	_IOPORT_PF,		//	39 RF4		PMA9/U2RX/SDA2/CN17/RF4
	_IOPORT_PF,		//	40 RF5		PMA8/U2TX/SCL2/CN18/RF5
	_IOPORT_PB,		//	41 RB1		PGC1/AN1/VREF-/CVREF-/CN3/RB1
	_IOPORT_PB,		//	42 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	
	_IOPORT_PF,		//	43 RF0		RF0						LD5
	_IOPORT_PG,		//	44 RG9		SS2/PMA2/CN11/RG9
	_IOPORT_PG,		//	45 RG3		SDA1/RG3
	_IOPORT_PG,		//	46 RG2		SCL1/RG2
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t digital_pin_to_bit_mask_PGM[] = 
{
	_BV( 2 ),		//	0 RF2		U1RX/SDI1/RF2
	_BV( 3 ),		//	1 RF3		U1TX/SDO1/RF3
	_BV( 8 ),		//	2 RD8		IC1/RTCC/INT1/RD8
	_BV( 0 ),		//	3 RD0		OC1/RD0
	_BV( 1 ),		//	4 RF1
	_BV( 1 ),		//	5 RD1		OC2/RD1
	_BV( 2 ),		//	6 RD2		OC3/RD2
	_BV( 9 ),		//	7 RD9		IC2/U1CTS/INT2/RD9
	_BV( 10 ),		//	8 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_BV( 3 ),		//	9 RD3		OC4/RD3
	_BV( 4 ),		//	10 RD4		PMWR/OC5/IC5/CN13/RD4
	_BV( 8 ),		//	11 RG8		(SDO2/PMA3/CN10/RG8) or (SDI2/PMA5/CN8/RG7)
	_BV( 7 ),		//	12 RG7		(SDI2/PMA5/CN8/RG7) or (SDO2/PMA3/CN10/RG8)
	_BV( 6 ),		//	13 RG6		SCK2/PMA5/CN8/RG6		LD4
	_BV( 2 ),		//	14 RB2		C2IN-/AN2/SS1/CN4/RB2
	_BV( 4 ),		//	15 RB4		C1IN-/AN4/CN6/RB4
	_BV( 8 ),		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	_BV( 10 ),		//	17 RB10		TMS/CVREFOUT/PMA13/AN10/RB10
	_BV( 12 ),		//	18 RB12		TCK/PMA11/AN12/RB12
	_BV( 14 ),		//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14
	_BV( 3 ),		//	20 RB3		C2IN+/AN3/CN5/RB3
	_BV( 5 ),		//	21 RB5		C1IN+/AN5/CN7/RB5
	_BV( 9 ),		//	22 RB9		PMA7/C2OUT/AN9/RB9
	_BV( 11 ),		//	23 RB11		TDO/PMA12/AN11/RB11
	_BV( 13 ),		//	24 RB13		TDI/PMA10/AN13/RB13
	_BV( 15 ),		//	25 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15
	_BV( 0 ),		//	26 RE0		PMD0/RE0
	_BV( 1 ),		//	27 RE1		PMD1/RE1
	_BV( 2 ),		//	28 RE2		PMD2/RE2
	_BV( 3 ),		//	29 RE3		PMD3/RE3
	_BV( 4 ),		//	30 RE4		PMD4/RE4
	_BV( 5 ),		//	31 RE5		PMD5/RE5
	_BV( 6 ),		//	32 RE6		PMD6/RE6
	_BV( 7 ),		//	33 RE7		PMD7/RE7
	_BV( 5 ),		//	34 RD5		PMRD/CN14/RD5
	_BV( 11 ),		//	35 RD11		IC4/PMCS1/PMA14/INT4/RD11
	_BV( 6 ),		//	36 RD6		CN15/RD6
	_BV( 7 ),		//	37 RD7		CN16/RD7
	_BV( 6 ),		//	38 RF6		U1RTS/BCLK1/SCK1/INT0/RF6
	_BV( 4 ),		//	39 RF4		PMA9/U2RX/SDA2/CN17/RF4
	_BV( 5 ),		//	40 RF5		PMA8/U2TX/SCL2/CN18/RF5
	_BV( 1 ),		//	41 RB1		PGC1/AN1/VREF-/CVREF-/CN3/RB1
	_BV( 0 ),		//	42 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	
	_BV( 0 ),		//	43 RF0		RF0						LD5
	_BV( 9 ),		//	44 RG9		SS2/PMA2/CN11/RG9
	_BV( 3 ),		//	45 RG3		SDA1/RG3
	_BV( 2 ),		//	46 RG2		SCL1/RG2

};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number, input capture number, and timer external clock
** input associated with that pin.
*/
const uint16_t digital_pin_to_timer_PGM[] =
{
	NOT_ON_TIMER,			//	0 RF2		U1RX/SDI1/RF2
	NOT_ON_TIMER,			//	1 RF3		U1TX/SDO1/RF3
	_TIMER_IC1,				//	2 RD8		IC1/RTCC/INT1/RD8
	_TIMER_OC1,				//	3 RD0		OC1/RD0
	NOT_ON_TIMER,			//	4 RF1		RF1
	_TIMER_OC2,				//	5 RD1		OC2/RD1
	_TIMER_OC3,				//	6 RD2		OC3/RD2
	_TIMER_IC2,				//	7 RD9		IC2/U1CTS/INT2/RD9
	_TIMER_IC3,				//	8 RD10		IC3/PMCS2/PMA15/INT3/RD10
	_TIMER_OC4,				//	9 RD3		OC4/RD3
	_TIMER_OC5|_TIMER_IC5,	//	10 RD4		PMWR/OC5/IC5/CN13/RD4
	NOT_ON_TIMER,			//	11 RG8		(SDO2/PMA3/CN10/RG8) or (SDI2/PMA5/CN8/RG7)
	NOT_ON_TIMER,			//	12 RG7		(SDI2/PMA5/CN8/RG7) or (SDO2/PMA3/CN10/RG8)
	NOT_ON_TIMER,			//	13 RG6		SCK2/PMA5/CN8/RG6
	NOT_ON_TIMER,			//	14 RB2		C2IN-/AN2/SS1/CN4/RB2
	NOT_ON_TIMER,			//	15 RB4		C1IN-/AN4/CN6/RB4
	NOT_ON_TIMER,			//	16 RB8		U2CTS/C1OUT/AN8/RB8
	NOT_ON_TIMER,			//	17 RB10		TMS/CVREFOUT/PMA13/AN10/RB10
	NOT_ON_TIMER,			//	18 RB12		TCK/PMA11/AN12/RB12
	NOT_ON_TIMER,			//	19 RB14		PMALH/PMA1/U2RTS/AN14/RB14

	NOT_ON_TIMER,			//	20 RB3		C2IN+/AN3/CN5/RB3
	NOT_ON_TIMER,			//	21 RB5		C1IN+/AN5/CN7/RB5
	NOT_ON_TIMER,			//	22 RB9		PMA7/C2OUT/AN9/RB9
	NOT_ON_TIMER,			//	23 RB11		TDO/PMA12/AN11/RB11
	NOT_ON_TIMER,			//	24 RB13		TDI/PMA10/AN13/RB13
	NOT_ON_TIMER,			//	25 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15

	NOT_ON_TIMER,			//	26 RE0		PMD0/RE0
	NOT_ON_TIMER,			//	27 RE1		PMD1/RE1
	NOT_ON_TIMER,			//	28 RE2		PMD2/RE2
	NOT_ON_TIMER,			//	29 RE3		PMD3/RE3
	NOT_ON_TIMER,			//	30 RE4		PMD4/RE4
	NOT_ON_TIMER,			//	31 RE5		PMD5/RE5
	NOT_ON_TIMER,			//	32 RE6		PMD6/RE6
	NOT_ON_TIMER,			//	33 RE7		PMD7/RE7
	NOT_ON_TIMER,			//	34 RD5		PMRD/CN14/RD5
	_TIMER_IC4,				//	35 RD11		IC4/PMCS1/PMA14/INT4/RD11
	NOT_ON_TIMER,			//	36 RD6		CN15/RD6
	NOT_ON_TIMER,			//	37 RD7		CN16/RD7
	NOT_ON_TIMER,			//	38 RF6		U1RTS/BCLK1/SCK1/INT0/RF6
	NOT_ON_TIMER,			//	39 RF4		PMA9/U2RX/SDA2/CN17/RF4
	NOT_ON_TIMER,			//	40 RF5		PMA8/U2TX/SCL2/CN18/RF5
	NOT_ON_TIMER,			//	41 RB1		PGC1/EMUC1/AN1/VREF-/CVREF-/CN3/RB1
	NOT_ON_TIMER,			//	42 RB0		PGD1/EMUD1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	
	NOT_ON_TIMER,			//	43 RF0		RF0
	NOT_ON_TIMER,			//	44 RG9		SS2/PMA2/CN11/RG9
	NOT_ON_TIMER,			//	45 RG3		SDA1/RG3
	NOT_ON_TIMER,			//	46 RG2		SCL1/RG2

};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	chipKIT Pin		PIC32 Analog channel
	2,		//*	A0						AN2
	4,		//*	A1						AN4
	8,		//*	A2						AN8
	10,		//*	A3						AN10
	12,		//*	A4						AN12
	14,		//*	A5						AN14
	3,		//*	A6						AN3
	5,		//*	A7						AN5
	9,		//*	A8						AN9
	11,		//*	A9						AN11
	13,		//*	A10						AN13
	15,		//*	A11						AN15

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
*/
#if	(OPT_BOARD_DIGITAL_IO != 0)

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

/* ------------------------------------------------------------ */

#endif	// _BOARD_DATA_

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
