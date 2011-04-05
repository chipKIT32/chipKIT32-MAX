//************************************************************************
//*	pins_arduino_pic32_mega.cxx
//*
//*	Arduino core files for PIC32
//*		Copyright (c) 2010 by Mark Sproul
//*	
//*	pins_arduino.c - pin definitions for the Arduino board
//*	Part of Arduino / Wiring libraries
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*	See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA  02111-1307  USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	<MLS> Got MPLAB X working on MacOSX 1.6 for the first time
//*	Oct 20,	2010	<MLS> First phase of Arduino port working
//*	Dec 17,	2010	<MLS> Working on pin mapping
//*	Jan  2,	2011	<MLS> First pass at Pic32-mega pin map working
//************************************************************************

//************************************************************************
const uint8_t	digital_pin_to_port_PGM[] = {
	// PORTLIST
	// -------------------------------------------
	PF,		//	0 RF2		U1RX/SDI1/RF2
	PF,		//	1 RF3		U1TX/SDO1/RF3
	PD,		//	2 RD8		IC1/RTCC/INT1/RD8
	PD,		//	3 RD0		OC1/RD0
	PF,		//	4 RF1
	PD,		//	5 RD1		OC2/RD1
	PD,		//	6 RD2		OC3/RD2
	PD,		//	7 RD9		IC2/U1CTS/INT2/RD9
	PD,		//	8 RD10		IC3/PMCS2/PMA15/INT3/RD10
	PD,		//	9 RD3		OC4/RD3
	PD,		//	10 RD4		(PMWR/OC5/IC5/CN13/RD4) or (SS2/PMA2/CN11/RG9)
	PG,		//	11 RG8		(SDO2/PMA3/CN10/RG8) or (SDI2/PMA5/CN8/RG7)
	PG,		//	12 RG7		(SDI2/PMA5/CN8/RG7) or (SDO2/PMA3/CN10/RG8)
	PG,		//	13 RG6		SCK2/PMA5/CN8/RG6
	PB,		//	14 RB2		C2IN-/AN2/SS1/CN4/RB2
	PB,		//	15 RB4		C1IN-/AN4/CN6/RB4
	PB,		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	PB,		//	17 RB10		TMS/CVREFOUT/PMA13/AN10/RB10
	PB,		//	18 RB12		(TCK/PMA11/AN12/RB12) or (SDA1/RG3)
	PB,		//	19 RB14		(PMALH/PMA1/U2RTS/AN14/RB14) or (SCL1/RG2)


	PB,		//	20 RB3		C2IN+/AN3/CN5/RB3
	PB,		//	21 RB5		C1IN+/AN5/CN7/RB5
	PB,		//	22 RB9		PMA7/C2OUT/AN9/RB9
	PB,		//	23 RB11		TDO/PMA12/AN11/RB11
	PB,		//	24 RB13		TDI/PMA10/AN13/RB13
	PB,		//	25 RB15		PMALL/PMA0/AN15/OCFB/CN12/RB15

	PE,		//	26 RE0		PMD0/RE0
	PE,		//	27 RE1		PMD1/RE1
	PE,		//	28 RE2		PMD2/RE2
	PE,		//	29 RE3		PMD3/RE3
	PE,		//	30 RE4		PMD4/RE4
	PE,		//	31 RE5		PMD5/RE5
	PE,		//	32 RE6		PMD6/RE6
	PE,		//	33 RE7		PMD7/RE7
	PD,		//	34 RD5		PMRD/CN14/RD5
	PD,		//	35 RD11		IC4/PMCS1/PMA14/INT4/RD11
	PD,		//	36 RD6		CN15/RD6
	PD,		//	37 RD7		CN16/RD7
	PF,		//	38 RF6		U1RTS/BCLK1/SCK1/INT0/RF6
	PF,		//	39 RF4		PMA9/U2RX/SDA2/CN17/RF4
	PF,		//	40 RF5		PMA8/U2TX/SCL2/CN18/RF5
	PB,		//	41 RB1		PGC1/AN1/VREF-/CVREF-/CN3/RB1
	PB,		//	42 RB0		PGED1/PMA6/AN0/VREF+/CVREF+/CN2/RB0
	
};

//************************************************************************
const uint16_t PROGMEM digital_pin_to_bit_mask_PGM[] = 
{
	// PIN IN PORT
	// ------------------------------------------
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
	_BV( 4 ),		//	10 RD4		(PMWR/OC5/IC5/CN13/RD4) or (SS2/PMA2/CN11/RG9)
	_BV( 8 ),		//	11 RG8		(SDO2/PMA3/CN10/RG8) or (SDI2/PMA5/CN8/RG7)
	_BV( 7 ),		//	12 RG7		(SDI2/PMA5/CN8/RG7) or (SDO2/PMA3/CN10/RG8)
	_BV( 6 ),		//	13 RG6		SCK2/PMA5/CN8/RG6
	_BV( 2 ),		//	14 RB2		C2IN-/AN2/SS1/CN4/RB2
	_BV( 4 ),		//	15 RB4		C1IN-/AN4/CN6/RB4
	_BV( 8 ),		//	16 RB8		U2CTS/C1OUT/AN8/RB8
	_BV( 10 ),		//	17 RB10		TMS/CVREFOUT/PMA13/AN10/RB10
	_BV( 12 ),		//	18 RB12		(TCK/PMA11/AN12/RB12) or (SDA1/RG3)
	_BV( 14 ),		//	19 RB14		(PMALH/PMA1/U2RTS/AN14/RB14) or (SCL1/RG2)
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
	

};

//************************************************************************
//* TODO implement for PIC32
const uint8_t PROGMEM digital_pin_to_timer_PGM[] = {
	// TIMERS
	// -------------------------------------------

	// -------------------------------------------
	NOT_ON_TIMER,		//	0 RF2	SDA1A/SDI1A/U1ARX/RF2
	NOT_ON_TIMER,		//	1 RF8	SCL1A/SDO1A/U1ATX/RF8
	NOT_ON_TIMER,		//	2 RE8	AERXD0/INT1/RE8
	TIMER_OC1,			//	3 RD0	SDO1/OC1/INT0/RD0
	NOT_ON_TIMER,		//	4 RC14	SOSCO/T1CK/CN0/RC14
	TIMER_OC2,			//	5 RD1	OC2/RD1
	TIMER_OC3,			//	6 RD2	OC3/RD2
	NOT_ON_TIMER,		//	7 RE9	AERXD1/INT2/RE9
	NOT_ON_TIMER,		//	8 RD12	ETXD2/IC5/PMD12/RD12
	TIMER_OC4,			//	9 RD3	OC4/RD3
	TIMER_OC5,			//	10 RD4	OC5/PMWR/CN13/RD4
	NOT_ON_TIMER,		//	11 RC4	T5CK/SDI1/RC4
	NOT_ON_TIMER,		//	12 RA2	SCL2/RA2
	NOT_ON_TIMER,		//	13 RA3	SDA2/RA3
	NOT_ON_TIMER,		//	14 RF13	AC1TX/SCK3A/U3BTX/U3ARTS/RF13
	NOT_ON_TIMER,		//	15 RF12	AC1RX/SS3A/U3BRX/U3ACTS/RF12
	NOT_ON_TIMER,		//	16 RF5	SCL3A/SDO3A/U3ATX/PMA8/CN18/RF5
	NOT_ON_TIMER,		//	17 RF4	SDA3A/SDI3A/U3ARX/PMA9/CN17/RF4
	NOT_ON_TIMER,		//	18 RD15	AETXD1/SCK1A/U1BTX/U1ARTS/CN21/RD15
	NOT_ON_TIMER,		//	19 RD14	AETXD0/SS1A/U1BRX/U1ACTS/CN20/RD14
	NOT_ON_TIMER,		//	20 RA15	AETXEN/SDA1/INT4/RA15
	NOT_ON_TIMER,		//	21 RA14	AETXCLK/SCL1/INT3/RA14
	NOT_ON_TIMER,		//	22 RC2	T3CK/AC2TX/RC2
	NOT_ON_TIMER,		//	23 RC3	T4CK/AC2RX/RC3
	NOT_ON_TIMER,		//	24 VBUS
	NOT_ON_TIMER,		//	25 RF3	USBID/RF3
	NOT_ON_TIMER,		//	26 RG3	D-/RG3
	NOT_ON_TIMER,		//	27 RG2	D+/RG2
	NOT_ON_TIMER,		//	28 RA9	VREF-/CVREF0/AERXD2/PMA7/RA9
	NOT_ON_TIMER,		//	29 RG7	????
	NOT_ON_TIMER,		//	30 RE7	PMD7/RE7
	NOT_ON_TIMER,		//	31 RE6	PMD6/RE6
	NOT_ON_TIMER,		//	32 RE5	PMD5/RE5
	NOT_ON_TIMER,		//	33 RE4	PMD4/RE4
	NOT_ON_TIMER,		//	34 RE3	PMD3/RE3
	NOT_ON_TIMER,		//	35 RE2	PMD2/RE2
	NOT_ON_TIMER,		//	36 RE1	PMD1/RE1
	NOT_ON_TIMER,		//	37 RE0	PMD0/RE0
	NOT_ON_TIMER,		//	38 RD10	SCK1/IC3/PMCS2/PMA15/RD10
	NOT_ON_TIMER,		//	39 RD5	PMRD/CN14/RD5
	NOT_ON_TIMER,		//	40 RB11	AN11/EREXERR/AETXERR/PMA12/RB11
	NOT_ON_TIMER,		//	41 RB13	AN13/ERXD1/AECOL/PMA10/RB13
	NOT_ON_TIMER,		//	42 RB12	AN12/ERXD0/AECRS/PMA11/RB12
	NOT_ON_TIMER,		//	43 RG8	ERXDV/AERXDV/ECRSDV/AECRSDV/SCL2A/SDO2A/U2ATX/PMA3/CN10/RG8
	NOT_ON_TIMER,		//	44 RA10	VREF+/CVREF+/AERXD3/PMA6/RA10
	NOT_ON_TIMER,		//	45 RF0	C1RX/ETXD1/PMD11/RF0
	NOT_ON_TIMER,		//	46 RF1	C1TX/ETXD0/RMD10/RF1
	NOT_ON_TIMER,		//	47 RD6	ETXEN/PMD14/CN15/RD6
	NOT_ON_TIMER,		//	48 RD8	PTCC/EMDIO/AEMDIO/IC1/RD8
	NOT_ON_TIMER,		//	49 RD11	EMDC/AEMDC/IC4/PMCS1/PMA14/RD11
	NOT_ON_TIMER,		//	50 RG7	ECRX/SDA2/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ON_TIMER,		//	51 RG7	ECRX/SDA2/SDI2A/U2ARX/PMA4/CN9/RG7
	NOT_ON_TIMER,		//	52 RG6	ECOL/SCK2A/U2BTX/U2ARTS/PMA5/CN8/RG6
	NOT_ON_TIMER,		//	53 RG9	ERXCLK/AERXCLK/EREFCLK/AEREFCLK/SS2A/U2BRX/U2ACTS/PMA2/CN11/RG9
	//*	the analog ports start with 54
	NOT_ON_TIMER,		//	54	RB0	PGED1/AN0/CN2/RB0
	NOT_ON_TIMER,		//	55	RB1	PGEC1/AN1/CN3/RB1
	NOT_ON_TIMER,		//	56	RB2	AN2/C2IN-/CN4/RB2
	NOT_ON_TIMER,		//	57	RB3	AN3/C2IN+/CN5/RB3
	NOT_ON_TIMER,		//	58	RB4	AN4/C1IN-/CN6/RB4
	NOT_ON_TIMER,		//	59	RB5	AN5/C1IN+/VBUSON/CN7/RB5
	NOT_ON_TIMER,		//	60	RB6	PGEC2/AN6/OCFA/RB6
	NOT_ON_TIMER,		//	61	RB7	PGED2/AN7/RB7
	NOT_ON_TIMER,		//	62	RB8	AN8/C1OUT/RB8
	NOT_ON_TIMER,		//	63	RB9	AN9/C2OUT/RB9
	NOT_ON_TIMER,		//	64	RB10	AN10/CVREFOUT/PMA13/RB10
	NOT_ON_TIMER,		//	65	RB11	AN11/EREXERR/AETXERR/PMA12/RB11
	NOT_ON_TIMER,		//	66	RB12	AN13/ERXD1/AECOL/PMA10/RB13
	NOT_ON_TIMER,		//	67	RB13	AN12/ERXD0/AECRS/PMA11/RB12
	NOT_ON_TIMER,		//	68	RB14	AN14/ERXD2/AETXD3/PMALH/PMA1/RB14
	NOT_ON_TIMER,		//	69	RB15	AN15/ERXD3/AETXD2/OCFB/PMALL/PMA0/CN12/RB15

	//*	Pic32 EXTRAS start here (with #70)
	NOT_ON_TIMER,		//	70 RA0	TMS/RA0
	NOT_ON_TIMER,		//	71 RA1	TCK/RA1
	NOT_ON_TIMER,		//	72 RA4	TDI/RA4
	NOT_ON_TIMER,		//	73 RA5	TDO/RA5
	NOT_ON_TIMER,		//	74 RD9	SS1/IC2/RD9
	NOT_ON_TIMER,		//	75 RC13	SOSCI/CN1/RC13
	NOT_ON_TIMER,		//	76 RD13	ETXD3/PMD13/CN19/RD13
	NOT_ON_TIMER,		//	77 RD7	ETXCLK/PMD15/CN16/RD7
	NOT_ON_TIMER,		//	78 RG1	C2TX/ETXERR/PMD9/RG1
	NOT_ON_TIMER,		//	79 RG0	C2RX/PMD8/RG0
	NOT_ON_TIMER,		//	80 RA6	TRCLK/RA6
	NOT_ON_TIMER,		//	81 RA7	TRD3/RA7
	NOT_ON_TIMER,		//	82 RG14	TRD2/RG14
	NOT_ON_TIMER,		//	83 RG12	TRD1/RG12
	NOT_ON_TIMER,		//	84 RG13	TRD0/RG13
	NOT_ON_TIMER,		//	85 RG15 AERXERR/RG15

};

