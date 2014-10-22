/************************************************************************/
/*																		*/
/*	Board_Defs.h --	Board Customization for Digilent chipKIT Uno32		*/
/*																		*/
/************************************************************************/
/*	Author: Gene Apperson												*/
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
/*	11/28/2011(GeneA): Moved data definitions and configuration			*/
/*		functions to Board_Data.c										*/
/*	11/29/2011(GeneA): Moved int priority definitions to System_Defs.h	*/
/*	Feb 17, 2012	<KeithV> Added PPS support for MZ devices           */
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

    #define  _OCMP1_BASE_ADDRESS ((uint32_t) &OC1CON)
    #define  _TIMER_1_IRQ _TIMER_1_VECTOR



/* ------------------------------------------------------------ */
/*				Public Board Declarations						*/
/* ------------------------------------------------------------ */
/* The following define symbols that can be used in a sketch to
** refer to periperhals on the board generically.
*/

#define	_BOARD_NAME_	"chipKIT WiFire"

/* Define the Microcontroller peripherals available on the board.
*/
#define	NUM_DIGITAL_PINS	71
#define	NUM_ANALOG_PINS		14
#define NUM_OC_PINS			6
#define	NUM_IC_PINS			5
#define	NUM_TCK_PINS		4
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	2   
#define	NUM_SPI_PORTS		1   
#define	NUM_I2C_PORTS		1   

#define NUM_DSPI_PORTS		4
#define	NUM_DTWI_PORTS		2

/* Define I/O devices on the board.
*/
#define	NUM_LED				4
#define NUM_BTN				2
#define	NUM_SWT				0
#define NUM_SERVO			0

/* Define the number of pins including extended i/o pins.
** These are pins that are not native to the microcontroller, such
** as implemented via an i/o expander or external A/D or D/A.
** This board doesn't have any.
*/
#define	NUM_DIGITAL_PINS_EXTENDED	NUM_DIGITAL_PINS
#define	NUM_ANALOG_PINS_EXTENDED	NUM_ANALOG_PINS

/* ------------------------------------------------------------ */
/*					Virtual Program Button						*/
/* ------------------------------------------------------------ */
#define USE_VIRTUAL_PROGRAM_BUTTON      1
#define VIRTUAL_PROGRAM_BUTTON_TRIS     TRISCbits.TRISC12
#define VIRTUAL_PROGRAM_BUTTON          LATCbits.LATC12

/* ------------------------------------------------------------ */
/*						LED Declarations						*/
/* ------------------------------------------------------------ */

/* Define the pin numbers for the LEDs.
*/
#define	PIN_LED1	13
#define	PIN_LED2	43
#define	PIN_LED3	44
#define	PIN_LED4	45

/* ------------------------------------------------------------ */
/*					Button Declarations							*/
/* ------------------------------------------------------------ */

/* Define buttons on this board.
*/
#define	PIN_BTN1	46	
#define	PIN_BTN2	47

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
#define	PIN_OC6		11

#define PIN_IC1		2      
#define PIN_IC2		7      
#define PIN_IC3		8      
#define PIN_IC4		10
#define PIN_IC5		35

//#define	PIN_TCK1	not connected
#define	PIN_TCK2	34      
#define	PIN_TCK3	35      
#define	PIN_TCK4	36      
#define	PIN_TCK5	38

/* ------------------------------------------------------------ */
/*					Interrupt Pin Declarations					*/
/* ------------------------------------------------------------ */

#define	PIN_INT0	3   // uno32 is on 38
#define	PIN_INT1	2
#define PIN_INT2	7
#define	PIN_INT3	8
#define	PIN_INT4	59  // used by MRF and is not on uno32 pin 35.

/* ------------------------------------------------------------ */
/*					SPI Pin Declarations						*/
/* ------------------------------------------------------------ */
/* These symbols are defined for compatibility with the original
** SPI library and the original pins_arduino.h
*/
const static uint8_t SS   = 10;		// for SPI master operation, shared with pin 10
const static uint8_t MOSI = 11;		// PIC32 SDO2
const static uint8_t MISO = 12;		// PIC32 SDI2
const static uint8_t SCK  = 13;		// PIC32 SCK2

/* The Digilent DSPI library uses these ports.
*/
#define	PIN_DSPI0_SS	10      // SS2; 
#define	PIN_DSPI1_SS	7       // SS1; 
#define	PIN_DSPI2_SS	52      // SS3; Dedicated to the SD
#define	PIN_DSPI3_SS	56      // SS4; Dedicated to the MRF

/* ------------------------------------------------------------ */
/*					Analog Pins									*/
/* ------------------------------------------------------------ */
/* Define symbols for accessing the analog pins. This table is
** used to map an analog pin number to the corresponding digital
** pin number.
*/
#define	A0		14      // AN45
#define	A1		15      // AN49
#define A2		16      // AN21
#define A3		17      // AN10
#define A4		18      // AN13
#define A5		19      // AN12
#define A6		20      // AN3
#define A7		21      // AN2
#define A8		22      // AN4
#define A9		23      // AN1
#define A10		24      // AN48
#define A11		25      // AN0
#define A12		48      // AN8
#define A13		49      // AN7

/* ------------------------------------------------------------ */
/*					Change Notice Pins							*/
/* ------------------------------------------------------------ */
/* These define the pin numbers for the various change notice
** pins.
*/
#define	PIN_CN0		0
#define	PIN_CN1		1
#define	PIN_CN2		2      
#define	PIN_CN3		3      
#define	PIN_CN4		4
#define	PIN_CN5		5
#define	PIN_CN6		6
#define	PIN_CN7		7
#define	PIN_CN8		8
#define	PIN_CN9		9
#define	PIN_CN10	10
#define	PIN_CN11	11
#define	PIN_CN12	12
#define	PIN_CN13	13
#define	PIN_CN14	14      
#define	PIN_CN15	15
#define	PIN_CN16	16
#define	PIN_CN17	17      
#define	PIN_CN18	18      
#define	PIN_CN19	19
#define	PIN_CN20	20
#define	PIN_CN21	21
#define	PIN_CN22	22
#define	PIN_CN23	23      
#define	PIN_CN24	24
#define	PIN_CN25	25
#define	PIN_CN26	26      
#define	PIN_CN27	27      
#define	PIN_CN28	28      
#define	PIN_CN29	29      
#define	PIN_CN30	30
#define	PIN_CN31	31
#define	PIN_CN32	32
#define	PIN_CN33	33
#define	PIN_CN34	34      
#define	PIN_CN35	35
#define	PIN_CN36	36
#define	PIN_CN37	37      
#define	PIN_CN38	38      
#define	PIN_CN39	39
#define	PIN_CN40	40
#define	PIN_CN40	41

/* ------------------------------------------------------------ */
/*					Pin Mapping Macros							*/
/* ------------------------------------------------------------ */
/* This section contains the definitions for pin mapping macros that
/* are being redefined for this board variant.
*/

// NUM_ANALOG_PINS == 14, the first analog pin as represented as a digital pin is also 14
// if the analog pin is less than 14, then you can put in the analog number 
// if the pin is greater than 14, it must be a digital pin number.

#undef digitalPinToAnalog
//#define	digitalPinToAnalog(P) (digital_pin_to_analog_PGM[P])
#define digitalPinToAnalog(P) (((P) < NUM_ANALOG_PINS) ? (P) : (digital_pin_to_analog_PGM[P]))

#undef analogInPinToChannel
#define analogInPinToChannel(P) (analog_pin_to_channel_PGM[P])


/* ------------------------------------------------------------ */
/*					Data Declarations							*/
/* ------------------------------------------------------------ */

/* The following declare externals to access the pin mapping
** tables. These tables are defined in Board_Data.c.
*/

#if !defined(OPT_BOARD_DATA)

extern const uint32_t	port_to_tris_PGM[];
extern const uint8_t	digital_pin_to_port_PGM[];
extern const uint16_t	digital_pin_to_bit_mask_PGM[];
extern const uint16_t	digital_pin_to_timer_PGM[];

extern const uint8_t	output_compare_to_digital_pin_PGM[];
extern const uint8_t	external_int_to_digital_pin_PGM[];

extern const uint8_t	analog_pin_to_channel_PGM[];
extern const uint8_t 	digital_pin_to_analog_PGM[];

extern const uint8_t	digital_pin_to_pps_out_PGM[];
extern const uint8_t	digital_pin_to_pps_in_PGM[];

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

#define	OPT_BOARD_INIT			0	//board needs no special init code
#define	OPT_BOARD_DIGITAL_IO	0	//board does not extend digital i/o functions
#define	OPT_BOARD_ANALOG_READ	0	//board does not extend analogRead
#define	OPT_BOARD_ANALOG_WRITE	0	//board does not extend analogWrite

/* ------------------------------------------------------------ */
/*					Serial Port Declarations					*/
/* ------------------------------------------------------------ */

/* Serial port 0 uses UART1
*/
#define	_SER0_BASE      ((uint32_t) &U4MODE)
#define	_SER0_IRQ       _UART4_FAULT_VECTOR
#define	_SER0_VECTOR    _UART4_FAULT_VECTOR
#define	_SER0_IPL_ISR   IPL2SRS
#define	_SER0_IPL       2
#define	_SER0_SPL       0
#define _SER0_TX_OUT    PPS_OUT_U4TX     // (RPF8R = 0b0010)   RF8 -> U4TX   
#define _SER0_TX_PIN    1                // REBIRDY2/RPF8/SCL3/RF8   
#define _SER0_RX_IN     PPS_IN_U4RX      // (U4RXR = 0b1011)    RPF2 -> U4RX
#define _SER0_RX_PIN    0                // EBIRDY3/RPF2/SDA3/RF2 

/* Serial port 1 uses UART1; this goes to pins 39&40
*/
#define	_SER1_BASE		((uint32_t) &U1MODE)
#define	_SER1_IRQ		_UART1_FAULT_VECTOR
#define	_SER1_VECTOR	_UART1_FAULT_VECTOR
#define	_SER1_IPL_ISR	IPL2SRS
#define	_SER1_IPL		2
#define	_SER1_SPL		0
#define _SER1_TX_OUT    PPS_OUT_U1TX     // (RPF8R = 0b0010)   RF8 -> U4TX   
#define _SER1_TX_PIN    40                // REBIRDY2/RPF8/SCL3/RF8   
#define _SER1_RX_IN     PPS_IN_U1RX      // (U4RXR = 0b1011)    RPF2 -> U4RX
#define _SER1_RX_PIN    39                // EBIRDY3/RPF2/SDA3/RF2 


/* ------------------------------------------------------------ */
/*					SPI Port Declarations						*/
/* ------------------------------------------------------------ */

/* The standard SPI port uses SPI2.
*/
#define	_SPI_BASE		((uint32_t) &SPI2CON)
#define _SPI_ERR_IRQ	_SPI2_FAULT_VECTOR
#define	_SPI_RX_IRQ		_SPI2_RX_VECTOR
#define	_SPI_TX_IRQ		_SPI2_TX_VECTOR
#define	_SPI_VECTOR		_SPI2_FAULT_VECTOR
#define _SPI_IPL_ISR	IPL3SRS
#define	_SPI_IPL		3
#define	_SPI_SPL		0

/* SPI pin declarations
*/
#define _SPI_MISO_IN	PPS_IN_SDI2
#define	_SPI_MISO_PIN	MISO
#define _SPI_MOSI_OUT	PPS_OUT_SDO2
#define	_SPI_MOSI_PIN	MOSI


/* The Digilent DSPI library uses these ports.
*/

// same as the default SPI port
#define	_DSPI0_BASE			((uint32_t) &SPI2CON)
#define	_DSPI0_ERR_IRQ		_SPI2_FAULT_VECTOR
#define	_DSPI0_RX_IRQ		_SPI2_RX_VECTOR
#define	_DSPI0_TX_IRQ		_SPI2_TX_VECTOR
#define	_DSPI0_VECTOR		_SPI2_FAULT_VECTOR
#define _DSPI0_IPL_ISR		IPL3SRS
#define	_DSPI0_IPL			3
#define	_DSPI0_SPL			0

#define _DSPI0_MISO_IN		PPS_IN_SDI2
#define _DSPI0_MISO_PIN		MISO		    // RA1  SDI1    SDI1R = RPA1 = 0 
#define _DSPI0_MOSI_OUT		PPS_OUT_SDO2
#define _DSPI0_MOSI_PIN		MOSI		    // RA4  SDO1    RPA4R = SDO1 = 3


// 2nd SPI
#define	_DSPI1_BASE			((uint32_t) &SPI1CON)
#define	_DSPI1_ERR_IRQ		_SPI1_FAULT_VECTOR
#define	_DSPI1_RX_IRQ		_SPI1_RX_VECTOR
#define	_DSPI1_TX_IRQ		_SPI1_TX_VECTOR
#define	_DSPI1_VECTOR		_SPI1_FAULT_VECTOR
#define _DSPI1_IPL_ISR		IPL3SRS
#define	_DSPI1_IPL			3
#define	_DSPI1_SPL			0

#define _DSPI1_MISO_IN		PPS_IN_SDI1
#define _DSPI1_MISO_PIN		36		        // RA1  SDI1    SDI1R = RPA1 = 0 
#define _DSPI1_MOSI_OUT		PPS_OUT_SDO1
#define _DSPI1_MOSI_PIN		35		        // RA4  SDO1    RPA4R = SDO1 = 3

// SD Card
#define	_DSPI2_BASE			((uint32_t) &SPI3CON)
#define	_DSPI2_ERR_IRQ		_SPI3_FAULT_VECTOR
#define	_DSPI2_RX_IRQ		_SPI3_RX_VECTOR
#define	_DSPI2_TX_IRQ		_SPI3_TX_VECTOR
#define	_DSPI2_VECTOR		_SPI3_FAULT_VECTOR
#define _DSPI2_IPL_ISR		IPL3SRS
#define	_DSPI2_IPL			3
#define	_DSPI2_SPL			0

#define _DSPI2_MISO_IN		PPS_IN_SDI3
#define _DSPI2_MISO_PIN		53		    // RA1  SDI1    SDI1R = RPA1 = 0 
#define _DSPI2_MOSI_OUT		PPS_OUT_SDO3
#define _DSPI2_MOSI_PIN		54		    // RA4  SDO1    RPA4R = SDO1 = 3

// this is the MRF24
#define	_DSPI3_BASE			((uint32_t) &SPI4CON)
#define	_DSPI3_ERR_IRQ		_SPI4_FAULT_VECTOR
#define	_DSPI3_RX_IRQ		_SPI4_RX_VECTOR
#define	_DSPI3_TX_IRQ		_SPI4_TX_VECTOR
#define	_DSPI3_VECTOR		_SPI4_FAULT_VECTOR
#define _DSPI3_IPL_ISR		IPL3SRS
#define	_DSPI3_IPL			3
#define	_DSPI3_SPL			0

#define _DSPI3_MISO_IN		PPS_IN_SDI2
#define _DSPI3_MISO_PIN		57		    // RA1  SDI1    SDI1R = RPA1 = 0 
#define _DSPI3_MOSI_OUT		PPS_OUT_SDO2
#define _DSPI3_MOSI_PIN		58		    // RA4  SDO1    RPA4R = SDO1 = 3


/* ------------------------------------------------------------ */
/*					I2C Port Declarations						*/
/* ------------------------------------------------------------ */

/* The standard I2C port uses I2C4 (SCL4/SDA4). These come to pins
** A4/A5 pins 18/19 on the analog connector.
*/
#define	_TWI_BASE		((uint32_t) &I2C4CON)
#define	_TWI_BUS_IRQ	_I2C4_BUS_VECTOR
#define	_TWI_SLV_IRQ	_I2C4_SLAVE_VECTOR
#define	_TWI_MST_IRQ	_I2C4_MASTER_VECTOR
#define	_TWI_VECTOR		_I2C4_BUS_VECTOR
#define _TWI_IPL_ISR	IPL3SRS
#define _TWI_IPL		3
#define	_TWI_SPL		0

/* Declarations for Digilent DTWI library.
**		DTWI0 is SDA2/SCL2 on A4/A5 pins 18/19 (see above comment).
*/

#define	_DTWI0_BASE		((uint32_t) &I2C4CON)
#define	_DTWI0_BUS_IRQ	_I2C4_BUS_VECTOR
#define	_DTWI0_VECTOR	_I2C4_BUS_VECTOR
#define	_DTWI0_IPL_ISR	IPL3SRS 
#define	_DTWI0_IPL		3
#define	_DTWI0_SPL		0
#define _DTWI0_SCL_PIN  19 
#define _DTWI0_SDA_PIN  18

#define	_DTWI1_BASE		((uint32_t) &I2C2CON)
#define	_DTWI1_BUS_IRQ	_I2C2_BUS_VECTOR
#define	_DTWI1_VECTOR	_I2C2_BUS_VECTOR
#define	_DTWI1_IPL_ISR	IPL3SRS 
#define	_DTWI1_IPL		3
#define	_DTWI1_SPL		0
#define _DTWI1_SCL_PIN  37 
#define _DTWI1_SDA_PIN  4

/* ------------------------------------------------------------ */
/*					A/D Converter Declarations					*/
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */
/*  On MZ parts, ports are defined                              */
/* ------------------------------------------------------------ */

#define _PORTA
#define _PORTB
#define _PORTC
#define _PORTD
#define _PORTE
#define _PORTF
#define _PORTG

/* ------------------------------------------------------------ */
/*  JTAG Support, set to 1 if you want JTAG enabled             */
/*  otherwise JTAG will be disabled                             */
/* ------------------------------------------------------------ */
// Wi-FIRE supports JTAG
#define _JTAG 1

/* ------------------------------------------------------------ */

#endif	// OPT_BOARD_INTERNAL

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
