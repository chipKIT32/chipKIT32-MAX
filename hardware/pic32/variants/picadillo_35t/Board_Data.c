#if !defined(BOARD_DATA_C)
#define BOARD_DATA_C

#include <inttypes.h>

#if defined(OPT_BOARD_DATA)

/* ------------------------------------------------------------ */
/* This table is used to map from port number to the address of
** the TRIS register for the port. This is used for setting the
** pin direction.
*/
const uint32_t port_to_tris_PGM[NUM_DIGITAL_PINS] = {
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
const uint8_t digital_pin_to_port_PGM[NUM_DIGITAL_PINS] = {
	_IOPORT_PF,		//	0 RF2		U1RX/SDI3/SDA3/RF2
	_IOPORT_PF,		//	1 RF8		U1TX/SDO3/SCL3/RF8
	_IOPORT_PE,		//	2 RE8		INT1/RE8
	_IOPORT_PA,		//	3 RA3		SDA2/RA3
	_IOPORT_PF,		//	4 RF3		USBID/RF3
	_IOPORT_PG,		//	5 RG15	    AERXERR/RG15
	_IOPORT_PD,		//	6 RD11      EMDC/IC4/PMCS1/PMA14/RD11
	_IOPORT_PE,		//	7 RE9		INT2/RE9

	_IOPORT_PD,		//	8 RD15		SCK3/U4TX/CN21/RD15
	_IOPORT_PD,		//	9 RD3		OC4/RD3
	_IOPORT_PC,		//	10 RC4      T5CK/SDI1/RC4
	_IOPORT_PD,		//	11 RD10     SCK1/IC3/PMCS2/PMA15/RD10
	_IOPORT_PD,		//	12 RD9      SS1/IC2/RD9
	_IOPORT_PD,		//	13 RD0      SDO1/OC1/INT0/RD0

	_IOPORT_PB,		//	14 RB0		AN0/CN2/RB0
	_IOPORT_PB,		//	15 RB1		AN1/CN3/RB1
	_IOPORT_PB,		//	16 RB2		AN2/CN4/RB2
	_IOPORT_PB,		//	17 RB3 		AN3/CN5/RB3
	_IOPORT_PB,		//	18 RB4 		AN4/CN6/RB4
	_IOPORT_PB,		//	19 RB5 		AN5/CN7/RB5

	_IOPORT_PB,		//	20 RB6		AN6/RB6
	_IOPORT_PB,		//	21 RB7		AN7/RB7
	_IOPORT_PB,		//	22 RB8		AN8/RB8
	_IOPORT_PB,		//	23 RB9 		AN9/RB9
	_IOPORT_PB,		//	24 RB10		AN10/RB10
	_IOPORT_PB,		//	25 RB11		AN11/RB11

	_IOPORT_PA,		//	26 RA0		RA0
	_IOPORT_PA,		//	27 RA1		RA1
	_IOPORT_PA,		//	28 RA4		RA4
	_IOPORT_PA,		//	29 RA5		RA5
	_IOPORT_PA,		//	30 RA2      SCL2/RA2
	_IOPORT_PD,		//	31 RD1      OC2/RD1
	_IOPORT_PD,		//	32 RD2      OC3/RD2
	_IOPORT_PB,		//	33 RB14	    AN14/RB14

	_IOPORT_PD,		//	34 RD14     AETXD0/SS1A/U1BRX/U1ACTS/CN20/RD14
	_IOPORT_PD,		//	35 RD8 		RTCC/IC1/RD8
	_IOPORT_PA,		//	36 RA6      TRCLK/RA6
	_IOPORT_PA,		//	37 RA7		RA7
	_IOPORT_PG,		//	38 RG14	    RG14
	_IOPORT_PG,		//	39 RG12	    RG12
	_IOPORT_PG,		//	40 RG13	    RG13
	_IOPORT_PA,		//	41 RA9 	    RA9

	_IOPORT_PA,		//	42 RA10	    RA10

    _IOPORT_PB,     //  43 RB12     LCD YU
    _IOPORT_PB,     //  44 RB13     LCD XL
    _IOPORT_PC,     //  45 RC2      LCD YD
    _IOPORT_PC,     //  46 RC3      LCD XR
    _IOPORT_PC,     //  47 RC1      LCD RESET

    _IOPORT_PG,     //  48 SS2/RG9  SD SS

    // SPI port
    _IOPORT_PF,     // 49 RF4       MISO
    _IOPORT_PF,     // 50 RF13      SCK
    _IOPORT_PF,     // 51 RF5       MOSI
    _IOPORT_PF,     // 52 RF12      SS

    // I2C port
    _IOPORT_PA,     // 53 RA15      SDA
    _IOPORT_PA,     // 54 RA14      SCL

    // SD card SPI Port
    _IOPORT_PG,     // 55 RG7       SD MOSI
    _IOPORT_PG,     // 56 RG8       SD MISO
    _IOPORT_PG,     // 57 RG6       SD SCK
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to a bit mask
** for the corresponding bit within the port.
*/
const uint16_t digital_pin_to_bit_mask_PGM[NUM_DIGITAL_PINS] = 
{
	_BV( 2 ),   //  0 RF2       U1RX/SDI3/SDA3/RF2
	_BV( 8 ),   //  1 RF8       U1TX/SDO3/SCL3/RF8
	_BV( 8 ),   //  2 RE8       INT1/RE8
	_BV( 3 ),   //  3 RA3       SDA2/RA3
	_BV( 3 ),   //  4 RF3       USBID/RF3
	_BV( 15 ),  //  5 RG15      AERXERR/RG15
	_BV( 11 ),  //  6 RD11      EMDC/IC4/PMCS1/PMA14/RD11
	_BV( 9 ),   //  7 RE9       INT2/RE9

	_BV( 15 ),  //  8 RD15      SCK3/U4TX/CN21/RD15
	_BV( 3 ),	//  9 RD3       OC4/RD3
	_BV( 4 ),   //  10 RC4      T5CK/SDI1/RC4
	_BV( 10 ),  //  11 RD10     SCK1/IC3/PMCS2/PMA15/RD10
	_BV( 9 ),   //  12 RD9      SS1/IC2/RD9
	_BV( 0 ),   //  13 RD0      SDO1/OC1/INT0/RD0

	_BV( 0 ),   //  14 RB0      AN0/CN2/RB0
	_BV( 1 ),   //  15 RB1      AN1/CN3/RB1
	_BV( 2 ),   //  16 RB2      AN2/CN4/RB2
	_BV( 3 ),   //  17 RB3      AN3/CN5/RB3
	_BV( 4 ),   //  18 RB4      AN4/CN6/RB4
	_BV( 5 ),   //  19 RB5      AN5/CN7/RB5

	_BV( 6 ),   //  20 RB6      AN6/RB6
	_BV( 7 ),   //  21 RB7      AN7/RB7
	_BV( 8 ),   //  22 RB8      AN8/RB8
	_BV( 9 ),   //  23 RB9      AN9/RB9
	_BV( 10 ),  //  24 RB10     AN10/RB10
	_BV( 11 ),  //  25 RB11     AN11/RB11

	_BV( 0 ),   //  26 RA0      RA0
	_BV( 1 ),   //  27 RA1      RA1
	_BV( 4 ),   //  28 RA4      RA4
	_BV( 5 ),   //  29 RA5      RA5
	_BV( 2 ),   //  30 RA2      SCL2/RA2
	_BV( 1 ),   //  31 RD1      OC2/RD1
	_BV( 2 ),   //  32 RD2      OC3/RD2
	_BV( 14 ),  //  33 RB14     AN14/RB14

	_BV( 14 ),  //  34 RD14     AETXD0/SS1A/U1BRX/U1ACTS/CN20/RD14
	_BV( 8 ),   //  35 RD8      RTCC/IC1/RD8
	_BV( 6 ),	//  36 RA6      TRCLK/RA6
	_BV( 7 ),   //  37 RA7      RA7
	_BV( 14 ),  //  38 RG14     RG14
	_BV( 12 ),  //  39 RG12     RG12
	_BV( 13 ),  //  40 RG13     RG13
	_BV( 9 ),   //  41 RA9      RA9

	_BV( 10 ),  //  42 RA10     RA10

    _BV( 12 ),  //  43 RB12     LCD YU
    _BV( 13 ),  //  44 RB13     LCD XL
    _BV( 2 ),   //  45 RC2      LCD YD
    _BV( 3 ),   //  46 RC3      LCD XR
    _BV( 1 ),   //  47 RC1      LCD RESET

    _BV( 9 ),   //  48 SS2/RG9  SD SS

    _BV( 4 ),   //  49 RF4      MISO
    _BV( 13 ),  //  50 RF13     SCK
    _BV( 5 ),   //  51 RF5      MOSI
    _BV( 12 ),  //  52 RF12     SS

    _BV( 15 ),  //  53 RA15     SDA
    _BV( 14 ),  //  54 RA14     SCL

    _BV( 7 ),   //  55 RG7      SD MOSI
    _BV( 8 ),   //  56 RG8      SD MISO
    _BV( 6 ),   //  56 RG6      SD SCK
};

/* ------------------------------------------------------------ */
/* This table is used to map from digital pin number to the output
** compare number, input capture number, and timer external clock
** input associated with that pin.
*/
const uint16_t digital_pin_to_timer_PGM[NUM_DIGITAL_PINS] =
{
	NOT_ON_TIMER,	//  0 RF2       U1RX/SDI3/SDA3/RF2
	NOT_ON_TIMER,   //  1 RF8       U1TX/SDO3/SCL3/RF8
	NOT_ON_TIMER,   //  2 RE8       INT1/RE8
	NOT_ON_TIMER,   //  3 RA3       SDA2/RA3
	NOT_ON_TIMER,   //  4 RF3       USBID/RF3
	NOT_ON_TIMER,   //  5 RG15      AERXERR/RG15
	NOT_ON_TIMER,   //  6 RD11      EMDC/IC4/PMCS1/PMA14/RD11
	NOT_ON_TIMER,   //  7 RE9       INT2/RE9

	NOT_ON_TIMER,   //  8 RD15      SCK3/U4TX/CN21/RD15
	_TIMER_OC4,     //  9 RD3       OC4/RD3
	NOT_ON_TIMER,   //  10 RC4      T5CK/SDI1/RC4
	NOT_ON_TIMER,   //  11 RD10     SCK1/IC3/PMCS2/PMA15/RD10
	_TIMER_IC2,     //  12 RD9      SS1/IC2/RD9
	_TIMER_OC1,     //  13 RD0      SDO1/OC1/INT0/RD0

	NOT_ON_TIMER,   //  14 RB0      AN0/CN2/RB0
	NOT_ON_TIMER,   //  15 RB1      AN1/CN3/RB1
	NOT_ON_TIMER,   //  16 RB2      AN2/CN4/RB2
	NOT_ON_TIMER,   //  17 RB3      AN3/CN5/RB3
	NOT_ON_TIMER,   //  18 RB4      AN4/CN6/RB4
	NOT_ON_TIMER,   //  19 RB5      AN5/CN7/RB5

	NOT_ON_TIMER,   //  20 RB6      AN6/RB6
	NOT_ON_TIMER,   //  21 RB7      AN7/RB7
	NOT_ON_TIMER,   //  22 RB8      AN8/RB8
	NOT_ON_TIMER,   //  23 RB9      AN9/RB9
	NOT_ON_TIMER,   //  24 RB10     AN10/RB10
	NOT_ON_TIMER,   //  25 RB11     AN11/RB11

	NOT_ON_TIMER,   //  26 RA0      RA0
	NOT_ON_TIMER,   //  27 RA1      RA1
	NOT_ON_TIMER,   //  28 RA4      RA4
	NOT_ON_TIMER,   //  29 RA5      RA5
	NOT_ON_TIMER,   //  30 RA2      SCL2/RA2
	_TIMER_OC2,     //  31 RD1      OC2/RD1
	_TIMER_OC3,     //  32 RD2      OC3/RD2
	NOT_ON_TIMER,   //  33 RB14     AN14/RB14

	NOT_ON_TIMER,   //  34 RD14     AETXD0/SS1A/U1BRX/U1ACTS/CN20/RD14
	_TIMER_IC1,     //  35 RD8      RTCC/IC1/RD8
	NOT_ON_TIMER,   //  36 RA6      TRCLK/RA6
	NOT_ON_TIMER,   //  37 RA7      RA7
	NOT_ON_TIMER,   //  38 RG14     RG14
	NOT_ON_TIMER,   //  39 RG12     RG12
	NOT_ON_TIMER,   //  40 RG13     RG13
	NOT_ON_TIMER,   //  41 RA9      RA9

	NOT_ON_TIMER,   //  42 RA10     RA10

	NOT_ON_TIMER,   //  43 RB12     LCD YU
	NOT_ON_TIMER,   //  44 RB13     LCD XL
	NOT_ON_TIMER,   //  45 RC2      LCD YD
	NOT_ON_TIMER,   //  46 RC3      LCD XR
	NOT_ON_TIMER,   //  47 RC1      LCD RESET

	NOT_ON_TIMER,   //  48 SS2/RG9  SD SS

	NOT_ON_TIMER,   // 49 RF4       MISO
	NOT_ON_TIMER,   // 50 RF13      SCK
	NOT_ON_TIMER,   // 51 RF5       MOSI
	NOT_ON_TIMER,   // 52 RF12      SS

	NOT_ON_TIMER,   // 53 RA15      SDA
	NOT_ON_TIMER,   // 54 RA14      SCL

	NOT_ON_TIMER,   // 55 RG7       SD MOSI
	NOT_ON_TIMER,   // 56 RG8       SD MISO
	NOT_ON_TIMER,   // 57 RG6       SD SCK
};

/* ------------------------------------------------------------ */
/* This table is used to map from the analog pin number to the
** actual A/D converter channel used for that pin.
*/
const uint8_t analog_pin_to_channel_PGM[] =
{
			//*	chipKIT Pin		PIC32 Analog channel
	0,		//*	A0						AN0
	1,		//*	A1						AN1
	2,		//*	A2						AN2
	3,		//*	A3						AN3
	4,		//*	A4						AN4
	5,		//*	A5						AN5
	6,		//*	A6						AN6
	7,		//*	A7						AN7
	8,		//*	A8						AN8
	9,		//*	A9						AN9
	10,		//*	A10						AN10
	11,		//*	A11						AN11
    12,     //* A12 - LCD Y
    13,     //* A13 - LCD X
};

const uint8_t digital_pin_to_analog_PGM[NUM_DIGITAL_PINS] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,   // 0-11
    NOT_ANALOG_PIN,                         // 12
    NOT_ANALOG_PIN,                         // 13
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,   // 14-25
    NOT_ANALOG_PIN,                         // 26
    NOT_ANALOG_PIN,                         // 27
    NOT_ANALOG_PIN,                         // 28
    NOT_ANALOG_PIN,                         // 29
    NOT_ANALOG_PIN,                         // 30
    NOT_ANALOG_PIN,                         // 31
    NOT_ANALOG_PIN,                         // 32
    NOT_ANALOG_PIN,                         // 33
    NOT_ANALOG_PIN,                         // 34
    NOT_ANALOG_PIN,                         // 35
    NOT_ANALOG_PIN,                         // 36
    NOT_ANALOG_PIN,                         // 37
    NOT_ANALOG_PIN,                         // 38
    NOT_ANALOG_PIN,                         // 39
    NOT_ANALOG_PIN,                         // 40
    NOT_ANALOG_PIN,                         // 41
    NOT_ANALOG_PIN,                         // 42
    12,                                     // 43
    13,                                     // 44
    NOT_ANALOG_PIN,                         // 45
    NOT_ANALOG_PIN,                         // 46
    NOT_ANALOG_PIN,                         // 47
    NOT_ANALOG_PIN,                         // 48
    NOT_ANALOG_PIN,                         // 49
    NOT_ANALOG_PIN,                         // 50
    NOT_ANALOG_PIN,                         // 51
    NOT_ANALOG_PIN,                         // 52
    NOT_ANALOG_PIN,                         // 53
    NOT_ANALOG_PIN,                         // 54
    NOT_ANALOG_PIN,                         // 55
    NOT_ANALOG_PIN,                         // 56
    NOT_ANALOG_PIN,                         // 57
};

const uint32_t digital_pin_to_cn_PGM[NUM_DIGITAL_PINS] = 
{
    NOT_CN_PIN, //  0 RF2       U1RX/SDI3/SDA3/RF2
    NOT_CN_PIN, //  1 RF8       U1TX/SDO3/SCL3/RF8
    NOT_CN_PIN, //  2 RE8       INT1/RE8
    NOT_CN_PIN, //  3 RA3       SDA2/RA3
    NOT_CN_PIN, //  4 RF3       USBID/RF3
    NOT_CN_PIN, //  5 RG15      AERXERR/RG15
    NOT_CN_PIN, //  6 RD11      EMDC/IC4/PMCS1/PMA14/RD11
    NOT_CN_PIN, //  7 RE9       INT2/RE9

    _BV( 21 ),  //  8 RD15      SCK3/U4TX/CN21/RD15
    NOT_CN_PIN, //  9 RD3       OC4/RD3
    NOT_CN_PIN, //  10 RC4      T5CK/SDI1/RC4
    NOT_CN_PIN, //  11 RD10     SCK1/IC3/PMCS2/PMA15/RD10
    NOT_CN_PIN, //  12 RD9      SS1/IC2/RD9
    NOT_CN_PIN, //  13 RD0      SDO1/OC1/INT0/RD0

    _BV (  2 ), //  14 RB0      AN0/CN2/RB0
    _BV (  3 ), //  15 RB1      AN1/CN3/RB1
    _BV (  4 ), //  16 RB2      AN2/CN4/RB2
    _BV (  5 ), //  17 RB3      AN3/CN5/RB3
    _BV (  6 ), //  18 RB4      AN4/CN6/RB4
    _BV (  7 ), //  19 RB5      AN5/CN7/RB5

    NOT_CN_PIN, //  20 RB6      AN6/RB6
    NOT_CN_PIN, //  21 RB7      AN7/RB7
    NOT_CN_PIN, //  22 RB8      AN8/RB8
    NOT_CN_PIN, //  23 RB9      AN9/RB9
    NOT_CN_PIN, //  24 RB10     AN10/RB10
    NOT_CN_PIN, //  25 RB11     AN11/RB11

    NOT_CN_PIN, //  26 RA0      RA0
    NOT_CN_PIN, //  27 RA1      RA1
    NOT_CN_PIN, //  28 RA4      RA4
    NOT_CN_PIN, //  29 RA5      RA5
    NOT_CN_PIN, //  30 RA2      SCL2/RA2
    NOT_CN_PIN, //  31 RD1      OC2/RD1
    NOT_CN_PIN, //  32 RD2      OC3/RD2
    NOT_CN_PIN, //  33 RB14     AN14/RB14

    _BV ( 20 ), //  34 RD14     AETXD0/SS1A/U1BRX/U1ACTS/CN20/RD14
    NOT_CN_PIN, //  35 RD8      RTCC/IC1/RD8
    NOT_CN_PIN, //  36 RA6      TRCLK/RA6
    NOT_CN_PIN, //  37 RA7      RA7
    NOT_CN_PIN, //  38 RG14     RG14
    NOT_CN_PIN, //  39 RG12     RG12
    NOT_CN_PIN, //  40 RG13     RG13
    NOT_CN_PIN, //  41 RA9      RA9

    NOT_CN_PIN, //  42 RA10     RA10

    NOT_CN_PIN, //  43 RB12     LCD YU
    NOT_CN_PIN, //  44 RB13     LCD XL
    NOT_CN_PIN, //  45 RC2      LCD YD
    NOT_CN_PIN, //  46 RC3      LCD XR
    NOT_CN_PIN, //  47 RC1      LCD RESET

    NOT_CN_PIN, //  48 SS2/RG9  SD SS

    NOT_CN_PIN, // 49 RF4       MISO
    NOT_CN_PIN, // 50 RF13      SCK
    NOT_CN_PIN, // 51 RF5       MOSI
    NOT_CN_PIN, // 52 RF12      SS

    NOT_CN_PIN, // 53 RA15      SDA
    NOT_CN_PIN, // 54 RA14      SCL

    NOT_CN_PIN, // 55 RG7       SD MOSI
    NOT_CN_PIN, // 56 RG8       SD MISO
    NOT_CN_PIN, // 57 RG6       SD SCK
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

#endif // OPT_BOARD_DATA

/* ------------------------------------------------------------ */

#endif	// BOARD_DATA_C

/************************************************************************/
