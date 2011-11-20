//************************************************************************
//*	p32_defs.h
//*
//*	chipKIT core files for PIC32
//*		Copyright (c) 2011 by Digilent Inc.
//*	
//************************************************************************
//*		Author: Gene Apperson
//*		Copyright (c) 2011, Digilent Inc, All rights reserved
//************************************************************************
//*
//* This file contains hardware dependent symbol and data type declarations
//* for the PIC32 microcontroller.
//*
//************************************************************************
//*	This file is part of the core system for the chipKIT version
//* of the Arduino code base. It defines various generic symbols
//* describing the Microchip PIC32 devices.
//*	
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
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 2, 2011	<Gene Apperson> created
//************************************************************************

#if !defined(_P32_DEFS_H)
#define _P32_DEFS_H

#include	<inttypes.h>

/* ------------------------------------------------------------ */
/*				Register Declarations							*/
/* ------------------------------------------------------------ */

/* This structure describes the register layout of the primary
** register, set, clear, and invert registers associated with
** most special function registers.
*/
typedef struct {
	volatile uint32_t	reg;
	volatile uint32_t	clr;
	volatile uint32_t	set;
	volatile uint32_t	inv;
} p32_regset;

/* This structure describes the register layout for a buffer
** register that does't have the associated set, clear, and invert
** registers.
*/
typedef struct {
	volatile uint32_t	reg;
	volatile uint32_t	rsv1;
	volatile uint32_t	rsv2;
	volatile uint32_t	rsv3;
} p32_regbuf;

/* This structure describes the register layout of an I/O port.
*/
typedef struct {
	volatile p32_regset	tris;
	volatile p32_regset	port;
	volatile p32_regset	lat;
	volatile p32_regset	odc;
} p32_ioport;

/* This structure defines the registers for a PIC32 UART.
*/
typedef struct {
	volatile p32_regset	uxMode;
	volatile p32_regset	uxSta;
	volatile p32_regbuf	uxTx;
	volatile p32_regbuf	uxRx;
	volatile p32_regset	uxBrg;
} p32_uart;

/* UxMODE - Define bits in UART mode port
*/
#define	_UARTMODE_ON	15

/* UxSTA - Define bits in UART status/control register
*/
#define	_UARTSTA_URXEN	12
#define	_UARTSTA_UTXEN	10
#define	_UARTSTA_TMRT	8

/* Structure for the registers of a PIC32 SPI controller
*/
typedef struct {
	volatile p32_regset sxCon;
	volatile p32_regset sxStat;
	volatile p32_regbuf sxBuf;
	volatile p32_regset sxBrg;
} p32_spi;

/*	SPIxCON - Define bits in the SPI control port
*/
#define _SPICON_ON		15
#define _SPICON_SMP		9
#define	_SPICON_CKE		8
#define _SPICON_CKP		6
#define _SPICON_MSTEN	5

/*	SPIxSTAT - Define symbols in the SPI status port
*/
#define	_SPISTAT_SPIROV	6
#define	_SPISTAT_SPITBE	3
#define _SPISTAT_SPIRBF	0

/* This structure defines the registers for a PIC32 I2C port.
*/
typedef struct {
	volatile p32_regset	ixCon;
	volatile p32_regset ixStat;
	volatile p32_regset ixAdd;
	volatile p32_regset ixMsk;
	volatile p32_regset ixBrg;
	volatile p32_regset ixTrn;
	volatile p32_regbuf ixRcv;
} p32_i2c;

/* I2CxCON - Define symbols for the I2C control port bits
*/
#define	_I2CCON_ON		15
#define	_I2CCON_SIDL	13
#define	_I2CCON_SCLREL	12
#define _I2CCON_STRICT	11
#define	_I2CCON_A10M	10
#define	_I2CCON_DISSLW	9
#define	_I2CCON_SMEN	8
#define	_I2CCON_GCEN	7
#define	_I2CCON_STREN	6
#define	_I2CCON_ACKDT	5
#define	_I2CCON_ACKEN	4
#define	_I2CCON_RCEN	3
#define	_I2CCON_PEN		2
#define	_I2CCON_RSEN	1
#define	_I2CCON_SEN		0

/* I2CSTAT - Define symbols for the I2C status port bits
*/
#define	_I2CSTAT_ACKSTAT	15
#define	_I2CSTAT_TRSTAT		14
#define	_I2CSTAT_BCL		10
#define	_I2CSTAT_GCSTAT		9
#define	_I2CSTAT_ADD10		8
#define	_I2CSTAT_IWCOL		7
#define	_I2CSTAT_I2COV		6
#define	_I2CSTAT_DA			5
#define	_I2CSTAT_P			4
#define	_I2CSTAT_S			3
#define	_I2CSTAT_RW			2
#define	_I2CSTAT_RBF		1
#define	_I2CSTAT_TBF		0

/* This structure defines the registers for a PIC32 Timer.
*/
typedef struct {
	volatile p32_regset tmxCon;
	volatile p32_regset tmxTmr;
	volatile p32_regset tmxPr;
} p32_timer;

/* This structure defines the registers for a PIC32 Input Capture.
*/
typedef struct {
	volatile p32_regset icxCon;
	volatile p32_regbuf icxBuf;
} p32_ic;

/* This structure defines the registers for a PIC32 Output Compare.
*/
typedef struct {
	volatile p32_regset ocxCon;
	volatile p32_regset ocxR;
	volatile p32_regset ocxRs;
} p32_oc;

/* This structure defines the registers for a PIC32 A/D converter
*/
typedef struct {
	volatile p32_regset adxCon1;
	volatile p32_regset adxCon2;
	volatile p32_regset adxCon3;
	volatile p32_regset adxChs;
	volatile p32_regset adxPcfg;
	volatile p32_regset adxCssl;
	volatile p32_regbuf	adxBuf0;
	volatile p32_regbuf	adxBuf1;
	volatile p32_regbuf	adxBuf2;
	volatile p32_regbuf	adxBuf3;
	volatile p32_regbuf	adxBuf4;
	volatile p32_regbuf	adxBuf5;
	volatile p32_regbuf	adxBuf6;
	volatile p32_regbuf	adxBuf7;
	volatile p32_regbuf	adxBuf8;
	volatile p32_regbuf	adxBuf9;
	volatile p32_regbuf	adxBufA;
	volatile p32_regbuf	adxBufB;
	volatile p32_regbuf	adxBufC;
	volatile p32_regbuf	adxBufD;
	volatile p32_regbuf	adxBufE;
	volatile p32_regbuf	adxBufF;
} p32_adc;

/* This structure defines the change notice/pull-up enable registers.
*/
typedef struct {
	volatile p32_regset cnCon;
	volatile p32_regset cnEn;
	volatile p32_regset cnPue;
} p32_cn;

/* This structure defines the registers for the PIC32 parallel master port.
*/
typedef struct {
	volatile p32_regset pmpCon;
	volatile p32_regset pmpMode;
	volatile p32_regset pmpAddr;
	volatile p32_regset	pmpDout;
	volatile p32_regset pmpDin;
	volatile p32_regset	pmpAen;
	volatile p32_regset pmpStat;
} p32_pmp;


/* ------------------------------------------------------------ */

#endif		// P32_DEFS_H

//************************************************************************
