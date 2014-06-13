
#if !defined(BOARD_DEFS_H)
#define BOARD_DEFS_H

#include <inttypes.h>

#define	_BOARD_NAME_	"PICadillo-35T"

// Define the Microcontroller peripherals available on the board.
#define	NUM_DIGITAL_PINS	58
#define	NUM_ANALOG_PINS		14
#define NUM_OC_PINS			4
#define	NUM_IC_PINS			5
#define	NUM_TCK_PINS		0
#define	NUM_INT_PINS		5

#define	NUM_SERIAL_PORTS	3
#define	NUM_SPI_PORTS		1
#define	NUM_I2C_PORTS		1

#define NUM_DSPI_PORTS		4
#define	NUM_DTWI_PORTS		1

// Define I/O devices on the board.
#define	NUM_LED				1
#define NUM_BTN				0
#define	NUM_SWT				0
#define NUM_SERVO			0

#define	NUM_DIGITAL_PINS_EXTENDED	NUM_DIGITAL_PINS
#define	NUM_ANALOG_PINS_EXTENDED	NUM_ANALOG_PINS

// LED is the LCD backlight RD2, "pin" 32.
#define PIN_LED1    32
#define PIN_BACKLIGHT   32

// Audio is on pin RD1, which is IDE pin 31
#define PIN_AUDIO   31
// And the enable signal is on RB14, which is pin 33
#define PIN_AUDENB  33

#define PIN_OC1		13
#define	PIN_OC2		31
#define	PIN_OC3		32
#define	PIN_OC4		9

#define	PIN_INT0	13
#define	PIN_INT1	2
#define PIN_INT2	7
#define PIN_INT3    54
#define PIN_INT4    53

// These are mapped to the special SPI header
const static uint8_t SS   = 52;		
const static uint8_t MOSI = 51;
const static uint8_t MISO = 49;
const static uint8_t SCK  = 50;

// SD card, SS2
#define	PIN_DSPI0_SS	48 

// SPI Header, SS4
#define	PIN_DSPI1_SS	52

// Normal SPI interface, SS1
// oops, this port is mapped wrong.  Fix in the next edition.
#define	PIN_DSPI2_SS	12

#define	PIN_DSPI3_SS	34

#define PIN_SD_SS       48

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
#define A12     43
#define A13     44
#define A14     33
#define A33     33

#define LCD_YU  43
#define LCD_XL  44
#define LCD_YD  45
#define LCD_XR  46
#define LCD_RESET 47

/* ------------------------------------------------------------ */
/*					Change Notice Pins							*/
/* ------------------------------------------------------------ */
/* These define the pin numbers for the various change notice
** pins.
*/
#define PIN_CN21    8
#define PIN_CN2     14
#define PIN_CN3     15
#define PIN_CN4     16
#define PIN_CN5     17
#define PIN_CN6     18
#define PIN_CN7     19
#define PIN_CN20    34

/* ------------------------------------------------------------ */
/*					Pin Mapping Macros							*/
/* ------------------------------------------------------------ */
/* This section contains the definitions for pin mapping macros that
** are being redefined for this board variant.
**/

#undef digitalPinToAnalog
#define	digitalPinToAnalog(P) ( digital_pin_to_analog_PGM[P] )
//(P) < 12 ? (P) : ((P) >= 14) && ((P) < 26) ? (P)-14 : NOT_ANALOG_PIN )

#undef analogInPinToChannel
#define analogInPinToChannel(P) ( analog_pin_to_channel_PGM[P]  )

#undef digitalPinToCN
#define digitalPinToCN(P) ( digital_pin_to_cn_PGM[P] )

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
extern const uint8_t	analog_pin_to_channel_PGM[];
extern const uint32_t   digital_pin_to_cn_PGM[];
extern const uint8_t    digital_pin_to_analog_PGM[];

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

// Serial port 0 uses UART1
#define	_SER0_BASE		_UART1_BASE_ADDRESS
#define	_SER0_IRQ		_UART1_ERR_IRQ
#define	_SER0_VECTOR	_UART_1_VECTOR
#define	_SER0_IPL_ISR	_UART1_IPL_ISR
#define	_SER0_IPL		_UART1_IPL_IPC
#define	_SER0_SPL		_UART1_SPL_IPC

// Serial port 1 (pins 8 and 10) uses UART4
#define	_SER1_BASE		_UART4_BASE_ADDRESS
#define	_SER1_IRQ		_UART4_ERR_IRQ
#define	_SER1_VECTOR	_UART_4_VECTOR
#define	_SER1_IPL_ISR	_UART4_IPL_ISR
#define	_SER1_IPL		_UART4_IPL_IPC
#define	_SER1_SPL		_UART4_SPL_IPC

// Serial 2 (UART 2) is on the SPI header
#define	_SER2_BASE		_UART2_BASE_ADDRESS
#define	_SER2_IRQ		_UART2_ERR_IRQ
#define	_SER2_VECTOR	_UART_2_VECTOR
#define	_SER2_IPL_ISR	_UART2_IPL_ISR
#define	_SER2_IPL		_UART2_IPL_IPC
#define	_SER2_SPL		_UART2_SPL_IPC

/* ------------------------------------------------------------ */
/*					SPI Port Declarations						*/
/* ------------------------------------------------------------ */

/* The standard SPI port uses SPI4.  This is the 6 pin SPI header.
*/
#define	_SPI_BASE		_SPI4_BASE_ADDRESS
#define _SPI_ERR_IRQ	_SPI4_ERR_IRQ
#define	_SPI_RX_IRQ		_SPI4_RX_IRQ
#define	_SPI_TX_IRQ		_SPI4_TX_IRQ
#define	_SPI_VECTOR		_SPI_4_VECTOR
#define _SPI_IPL_ISR	_SPI4_IPL_ISR
#define	_SPI_IPL		_SPI4_IPL_IPC
#define	_SPI_SPL		_SPI4_SPL_IPC

/* The Digilent DSPI library uses these ports.
*/

// DSPI0 talks to the SD card direct (SPI2)
#define	_DSPI0_BASE			_SPI2_BASE_ADDRESS
#define	_DSPI0_ERR_IRQ		_SPI2_ERR_IRQ
#define	_DSPI0_RX_IRQ		_SPI2_RX_IRQ
#define	_DSPI0_TX_IRQ		_SPI2_TX_IRQ
#define	_DSPI0_VECTOR		_SPI_2_VECTOR
#define _DSPI0_IPL_ISR		_SPI2_IPL_ISR
#define	_DSPI0_IPL			_SPI2_IPL_IPC
#define	_DSPI0_SPL			_SPI2_SPL_IPC

// DSPI1 is the 6 pin SPI header (SPI4)
#define	_DSPI1_BASE			_SPI4_BASE_ADDRESS
#define	_DSPI1_ERR_IRQ		_SPI4_ERR_IRQ
#define	_DSPI1_RX_IRQ		_SPI4_RX_IRQ
#define	_DSPI1_TX_IRQ		_SPI4_TX_IRQ
#define	_DSPI1_VECTOR		_SPI_4_VECTOR
#define _DSPI1_IPL_ISR		_SPI4_IPL_ISR
#define	_DSPI1_IPL			_SPI4_IPL_IPC
#define	_DSPI1_SPL			_SPI4_SPL_IPC

// DSPI2 is the pins 11-13 SPI interface (SPI1)
#define	_DSPI2_BASE			_SPI1_BASE_ADDRESS
#define	_DSPI2_ERR_IRQ		_SPI1_ERR_IRQ
#define	_DSPI2_RX_IRQ		_SPI1_RX_IRQ
#define	_DSPI2_TX_IRQ		_SPI1_TX_IRQ
#define	_DSPI2_VECTOR		_SPI_1_VECTOR
#define _DSPI2_IPL_ISR		_SPI1_IPL_ISR
#define	_DSPI2_IPL			_SPI1_IPL_IPC
#define	_DSPI2_SPL			_SPI1_SPL_IPC

// DSPI3 is the extra "hidden" SPI port (uses UART pins) (SPI3)
#define	_DSPI3_BASE			_SPI3_BASE_ADDRESS
#define	_DSPI3_ERR_IRQ		_SPI3_ERR_IRQ
#define	_DSPI3_RX_IRQ		_SPI3_RX_IRQ
#define	_DSPI3_TX_IRQ		_SPI3_TX_IRQ
#define	_DSPI3_VECTOR		_SPI_3_VECTOR
#define _DSPI3_IPL_ISR		_SPI3_IPL_ISR
#define	_DSPI3_IPL			_SPI3_IPL_IPC
#define	_DSPI3_SPL			_SPI3_SPL_IPC

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
#define _TWI_IPL_ISR	_I2C1_IPL_ISR
#define _TWI_IPL		_I2C1_IPL_IPC
#define	_TWI_SPL		_I2C1_SPL_IPC

/* Declarations for Digilent DTWI library. (which doesn't yet exist)
**		DTWI0 is on A4/A5 (see above comment).
*/
#define	_DTWI0_BASE		_I2C1_BASE_ADDRESS
#define	_DTWI0_BUS_IRQ	_I2C1_BUS_IRQ
#define	_DTWI0_SLV_IRQ	_I2C1_SLAVE_IRQ
#define	_DTWI0_MST_IRQ	_I2C1_MASTER_IRQ
#define	_DTWI0_VECTOR	_I2C_1_VECTOR
#define	_DTWI0_IPL_ISR	_I2C1_IPL_ISR
#define	_DTWI0_IPL		_I2C1_IPL_IPC
#define	_DTWI0_SPL		_I2C1_SPL_IPC

/* ------------------------------------------------------------ */
/*					A/D Converter Declarations					*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */

#endif	// OPT_BOARD_INTERNAL

/* ------------------------------------------------------------ */

#endif	// BOARD_DEFS_H

/************************************************************************/
