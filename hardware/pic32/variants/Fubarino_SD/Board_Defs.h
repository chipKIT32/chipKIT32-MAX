/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Default Board Customization Declarations			*/
/*																		*/
/************************************************************************/
/*	Author: Gene Apperson												*/
/*	Copyright 2011, Digilent. All rights reserved						*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/* This file contains the board specific declarations and data structure*/
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
/*	10/07/2011(GeneA): Created											*/
/*	11/28/2011(GeneA): Moved data definitions and configuration			*/
/*		functions to Board_Data.c										*/
/*	11/29/2011(GeneA): Moved int priority definitions to System_Defs.h	*/
/*  03/11/2012(BrianS): Modified for Fubarino board                     */
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
** refer to peripherals on the board generically.
*/

#define	_BOARD_NAME_	"FubarinoSD"

/* Define the peripherals available on the board.
*/
#define	NUM_DIGITAL_PINS	45
#define	NUM_ANALOG_PINS		15
#define NUM_OC_PINS			5
#define	NUM_IC_PINS			5
#define	NUM_TCK_PINS		5
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	6
#define	NUM_SPI_PORTS		1
#define	NUM_I2C_PORTS		1

#define NUM_DSPI_PORTS		2
#define NUM_DTWI_PORTS		2

/* Define I/O devices on the board.
*/
#define	NUM_LED				1
#define NUM_BTN				1
#define	NUM_SWT				0
#define NUM_SERVO			0

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs
*/
#define	PIN_LED1	21

/* ------------------------------------------------------------ */
/*					Button Declarations							*/
/* ------------------------------------------------------------ */

/* One button (PRG) for this board
*/
#define	PIN_BTN1	23
/* Also define the virtual program button for soft reset */
#define USE_VIRTUAL_PROGRAM_BUTTON      1
#define VIRTUAL_PROGRAM_BUTTON_TRIS     TRISEbits.TRISE7
#define VIRTUAL_PROGRAM_BUTTON          LATEbits.LATE7

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

#define PIN_OC1		5
#define	PIN_OC2		8
#define	PIN_OC3		9
#define	PIN_OC4		10
#define	PIN_OC5		11

#define PIN_IC1		1
#define PIN_IC2		2
#define PIN_IC3		3
#define PIN_IC4		4
#define	PIN_IC5		11

#define	PIN_TCK1	6
//#define	PIN_TCK2	not available on the chip
//#define	PIN_TCK3	not available on the chip
//#define	PIN_TCK4	not available on the chip
//#define	PIN_TCK5	not available on the chip

/* ------------------------------------------------------------ */
/*					Interrupt Pin Declarations					*/
/* ------------------------------------------------------------ */

#define	PIN_INT0	4
#define	PIN_INT1	0
#define	PIN_INT2	1
#define	PIN_INT3	2
#define	PIN_INT4	3

/* ------------------------------------------------------------ */
/*					SPI Pin Declarations						*/
/* ------------------------------------------------------------ */
/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h. SPI2 is used for
** the default SPI port as it's pin numbers stay constant on all
** devices.
*/
/// TODO: For Fubarino, do we need these?
const static uint8_t SS   = 27;		// PIC32 SS2
const static uint8_t MOSI = 26;		// PIC32 SDO2
const static uint8_t MISO = 25;		// PIC32 SDI2
const static uint8_t SCK  = 24;		// PIC32 SCK2

/* The Digilent DSPI library uses these ports.
*/
/// TODO: For Fubarino, do we need these?
#define	PIN_DSPI0_SS	27
#define PIN_DSPI1_SS    1

/* ------------------------------------------------------------ */
/*					Analog Pins									*/
/* ------------------------------------------------------------ */
/* Define symbols for accessing the analog pins. This table is
** used to map an analog pin number to the corresponding digital
** pin number.
*/
#define	A0		44
#define	A1		43
#define A2		42
#define A3		41
#define A4		40
#define A5		39
#define A6		38
#define A7		37
#define A8		36
#define A9		35
#define A10		34
#define A11		33
#define	A12		32
#define	A13		31
#define	A14		30
//#define	A15		28

/* ------------------------------------------------------------ */
/*					Change Notice Pins							*/
/* ------------------------------------------------------------ */
/* These define the pin numbers for the various change notice
** pins.
*/
#define	PIN_CN0		7
#define	PIN_CN1		6
#define	PIN_CN2		33
#define	PIN_CN3		32
#define	PIN_CN4		31
#define	PIN_CN5		30
#define	PIN_CN6		29
#define	PIN_CN7		28
#define	PIN_CN8		24
#define	PIN_CN9		25
#define	PIN_CN10	26
#define	PIN_CN11	27
#define	PIN_CN12	44
#define	PIN_CN13	10
#define	PIN_CN14	11
#define	PIN_CN15	12
#define	PIN_CN16	13
#define	PIN_CN17	28
#define	PIN_CN18	29

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

// This definition can be used for the default mapping.
//#define	digitalPinToAnalog(P) ( (((P) > 15) && ((P) < 32)) ? (P)-16 : NOT_ANALOG_PIN )
// This definition can be used for the non-default case where there
// is a mapping table to go from digital pin to analog pin
#define	digitalPinToAnalog(P) ( ((P) > 14 ) ? digital_pin_to_analog_PGM[P] : digital_pin_to_analog_PGM[(14 - P) + 30] )

// This definition can be used for the default one-to-one mapping
//#define analogInPinToChannel(P) ( P )
// This definition is used when there isn't a one-to-one mapping
// This uses a table to do the mapping.
#define analogInPinToChannel(P) ( analog_pin_to_channel_PGM[P]  )

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

//#if defined(_NOT_USED_)
extern const uint8_t 	digital_pin_to_analog_PGM[];
//#endif

//#if defined(_NOT_USED_)
extern const uint8_t	analog_pin_to_channel_PGM[];
//#endif

#endif

/* ------------------------------------------------------------ */
/*				Internal Declarations							*/
/* ------------------------------------------------------------ */
/* The following declarations are used to map peripherals for	*/
/* the core and libraries and to provide configuration options	*/
/* for the core. They are not normally needed by a user sketch.	*/
/* ------------------------------------------------------------ */

#if defined(OPT_BOARD_INTERNAL)

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

#define	OPT_BOARD_INIT			1	//board needs special init code
#define	OPT_BOARD_DIGITAL_IO	0	//board does not extend digital i/o functions
#define	OPT_BOARD_ANALOG_READ	0	//board does not extend analogRead
#define	OPT_BOARD_ANALOG_WRITE	0	//board does not extend analogWrite

/* ------------------------------------------------------------ */
/*					Serial Port Declarations					*/
/* ------------------------------------------------------------ */

/* Serial port 0 uses UART1
*/
#define	_SER0_BASE		_UART1_BASE_ADDRESS
#define	_SER0_IRQ		_UART1_ERR_IRQ
#define	_SER0_VECTOR	_UART_1_VECTOR
#define	_SER0_IPL_ISR	IPL2SOFT
#define	_SER0_IPL		2
#define	_SER0_SPL		0
//UART1 TX = PIC pin 51, RD3, Arduino pin 9
//UART1 RX = PIC pin 50, RD2, Arduino pin 8

/* Serial port 1 uses UART2
*/
#define	_SER1_BASE		_UART2_BASE_ADDRESS
#define	_SER1_IRQ		_UART2_ERR_IRQ
#define	_SER1_VECTOR	_UART_2_VECTOR
#define	_SER1_IPL_ISR	IPL2SOFT
#define	_SER1_IPL		2
#define	_SER1_SPL		0
//UART2 TX = PIC pin 32, RF5, Arduino pin 29
//UART2 RX = PIC pin 31, RF4, Arduino pin 28

#if defined(_UART3_BASE_ADDRESS)
/* Serial port 2 uses UART3
*/
#define	_SER2_BASE		_UART3_BASE_ADDRESS
#define	_SER2_IRQ		_UART3_ERR_IRQ
#define	_SER2_VECTOR	_UART_3_VECTOR
#define	_SER2_IPL_ISR	IPL2SOFT
#define	_SER2_IPL		2
#define	_SER2_SPL		0
//UART3 TX = PIC pin 6, RG8, Arduino pin 26/SDO (in use by SPI on Fubarino SD)
//UART3 RX = PIC pin 5, RG7, Arduino pin 25/SDI (in use by SPI on Fubarino SD)
#endif

#if defined(_UART4_BASE_ADDRESS)
/* Serial port 3 uses UART4
*/
#define	_SER3_BASE		_UART4_BASE_ADDRESS
#define	_SER3_IRQ		_UART4_ERR_IRQ
#define	_SER3_VECTOR	_UART_4_VECTOR
#define	_SER3_IPL_ISR	IPL2SOFT
#define	_SER3_IPL		2
#define	_SER3_SPL		0
//UART4 TX = PIC pin 49, RD1, Arduino pin 7 
//UART4 RX = PIC pin 43, RD9, Arduino pin 1
#endif

#if defined(_UART5_BASE_ADDRESS)
/* Serial port 4 uses UART5
*/
#define	_SER4_BASE		_UART5_BASE_ADDRESS
#define	_SER4_IRQ		_UART5_ERR_IRQ
#define	_SER4_VECTOR	_UART_5_VECTOR
#define	_SER4_IPL_ISR	IPL2SOFT
#define	_SER4_IPL		2
#define	_SER4_SPL		0
//UART5 TX = PIC pin 29, RB14, Arduino pin 43/A1 
//UART5 RX = PIC pin 21, RB8, Arduino pin 37/A7
#endif

#if defined(_UART6_BASE_ADDRESS)
/* Serial port 5 uses UART6
*/
#define	_SER5_BASE		_UART6_BASE_ADDRESS
#define	_SER5_IRQ		_UART6_ERR_IRQ
#define	_SER5_VECTOR	_UART_6_VECTOR
#define	_SER5_IPL_ISR	IPL2SOFT
#define	_SER5_IPL		2
#define	_SER5_SPL		0
//UART6 TX = PIC pin 4, RG6, Arduino pin 24/SCK (in use by Fubarino SD SPI)
//UART6 RX = PIC pin 8, RG9, Arduino pin 27/SS (in use by Fubarino SD SPI)
#endif

/* ------------------------------------------------------------ */
/*					SPI Port Declarations						*/
/* ------------------------------------------------------------ */

/* The default SPI port uses SPI2. The pins for SPI2 stay the
** same on all PIC32 devices. The pins for SPI1 move around,
** and the ports beyond SPI2 aren't defined on some parts.
*/
#define	_SPI_BASE		_SPI2_BASE_ADDRESS
#define _SPI_ERR_IRQ	_SPI2_ERR_IRQ
#define	_SPI_RX_IRQ		_SPI2_RX_IRQ
#define	_SPI_TX_IRQ		_SPI2_TX_IRQ
#define	_SPI_VECTOR		_SPI_2_VECTOR
#define	_SPI_IPL_ISR	IPL3SOFT
#define	_SPI_IPL		3
#define	_SPI_SPL		0

/* The Digilent DSPI library uses the same port.
*/
#define	_DSPI0_BASE			_SPI2_BASE_ADDRESS
#define	_DSPI0_ERR_IRQ		_SPI2_ERR_IRQ
#define	_DSPI0_RX_IRQ		_SPI2_RX_IRQ
#define	_DSPI0_TX_IRQ		_SPI2_TX_IRQ
#define	_DSPI0_VECTOR		_SPI_2_VECTOR
#define	_DSPI0_IPL_ISR		IPL3SOFT
#define	_DSPI0_IPL			3
#define	_DSPI0_SPL			0

#define	_DSPI1_BASE			_SPI3_BASE_ADDRESS
#define	_DSPI1_ERR_IRQ		_SPI3_ERR_IRQ
#define	_DSPI1_RX_IRQ		_SPI3_RX_IRQ
#define	_DSPI1_TX_IRQ		_SPI3_TX_IRQ
#define	_DSPI1_VECTOR		_SPI_3_VECTOR
#define	_DSPI1_IPL_ISR		IPL3SOFT
#define	_DSPI1_IPL			3
#define	_DSPI1_SPL			0

/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */

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
#define	_TWI_IPL_ISR	IPL3SOFT
#define _TWI_IPL		3
#define	_TWI_SPL		0

/* Declarations for Digilent DTWI library.
**		DTWI0 is on 1/2
**		DTWI1 is on digital pins 29/28
*/
#define	_DTWI0_BASE		_I2C1_BASE_ADDRESS
#define	_DTWI0_BUS_IRQ	_I2C1_BUS_IRQ
#define	_DTWI0_VECTOR	_I2C_1_VECTOR
#define	_DTWI0_IPL_ISR	IPL3SOFT
#define	_DTWI0_IPL		3
#define	_DTWI0_SPL		0
#define _DTWI0_SCL_PIN  2 
#define _DTWI0_SDA_PIN  1


#if defined(__32MX795F512H__)
#define	_DTWI1_BASE		_I2C5_BASE_ADDRESS
#define	_DTWI1_BUS_IRQ	_I2C5_BUS_IRQ
#define	_DTWI1_VECTOR	_I2C_5_VECTOR
#define	_DTWI1_IPL_ISR	IPL3SOFT
#define	_DTWI1_IPL		3
#define	_DTWI1_SPL		0
#define _DTWI1_SCL_PIN  29 
#define _DTWI1_SDA_PIN  28
#else
#define	_DTWI1_BASE		_I2C2_BASE_ADDRESS
#define	_DTWI1_BUS_IRQ	_I2C2_BUS_IRQ
#define	_DTWI1_VECTOR	_I2C_2_VECTOR
#define	_DTWI1_IPL_ISR	IPL3SOFT
#define	_DTWI1_IPL		3
#define	_DTWI1_SPL		0
#define _DTWI1_SCL_PIN  29 
#define _DTWI1_SDA_PIN  28
#endif

/* ------------------------------------------------------------ */
/*					A/D Converter Declarations					*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */

#endif	// OPT_BOARD_INTERNAL

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
