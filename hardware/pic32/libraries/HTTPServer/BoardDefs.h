/************************************************************************/
/*																		*/
/*	BoardDefs.h	--	Declarations for Supported Boards 					*/
/*																		*/
/************************************************************************/
/*	Author:		Gene Apperson											*/
/*    Copyright 2013, Digilent Inc.                                     */
/************************************************************************/
/* 
*
* Copyright (c) 2013-2014, Digilent <www.digilentinc.com>
* Contact Digilent for the latest version.
*
* This program is free software; distributed under the terms of 
* BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1.    Redistributions of source code must retain the above copyright notice, this
*        list of conditions and the following disclaimer.
* 2.    Redistributions in binary form must reproduce the above copyright notice,
*        this list of conditions and the following disclaimer in the documentation
*        and/or other materials provided with the distribution.
* 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
*        of its contributors may be used to endorse or promote products derived
*        from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/************************************************************************/
/*  File Description:													*/
/*																		*/
/*	This header contains pin definitions for the I/O devices (switches,	*/
/*	buttons, LEDs, etc) used by the sketch.								*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/* 05/24/2012(GeneA): Created											*/
/* 7/21/2013	KeithV: reworked for the WebServer application          */
/*																		*/
/************************************************************************/

#if !defined(_BOARDDEFS_H)
#define	_BOARDDEFS_H

/* ------------------------------------------------------------ */
/*			General Board Declarations							*/
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */
/*		Uno32 or uC32 and 64 pin WF32 prototype SD Card	        */
/* ------------------------------------------------------------ */

#if defined(_BOARD_UNO32_) || defined(_BOARD_UNO_) || defined(_BOARD_UC32_) || defined(_BOARD_WF32_64_)

#define	PIN_SDCS	    4
#define PIN_LED_SAFE    PIN_LED2
#define CAMSERIAL       Serial1

/* ------------------------------------------------------------ */
/*					WF32 on board SD Card	                    */
/* ------------------------------------------------------------ */

#elif defined(_BOARD_WF32_)

#define	PIN_SDCS	    51
#define PIN_LED_SAFE    PIN_LED1
#define CAMSERIAL       Serial1
/* ------------------------------------------------------------ */
/*					Max32 SD Card			                    */
/* ------------------------------------------------------------ */

#elif defined (_BOARD_MAX32_) || defined(_BOARD_MEGA_)

#define	PIN_SDCS	    4
#define PIN_LED_SAFE    PIN_LED1

/* ------------------------------------------------------------ */
/*					Cerebot MX3cK With Pmods					*/
/* ------------------------------------------------------------ */

#elif defined(_BOARD_CEREBOT_MX3CK_)

#define	PIN_SDCS		16
#define PIN_LED_SAFE    PIN_LED1

/* ------------------------------------------------------------ */
/*					Cerebot MX4cK With Pmods					*/
/* ------------------------------------------------------------ */

#elif defined(_BOARD_CEREBOT_MX4CK_)

#define	PIN_SDCS		64
#define PIN_LED_SAFE    PIN_LED1

/* ------------------------------------------------------------ */
/*					Cerebot MX7cK With Pmods					*/
/* ------------------------------------------------------------ */

#elif defined(_BOARD_CEREBOT_MX7CK_)

#define	PIN_SDCS		SS
#define PIN_LED_SAFE    PIN_LED1

#elif defined(_BOARD_WIFIRE_)

#define	PIN_SDCS	    52
#define PIN_LED_SAFE    PIN_LED1

/* ------------------------------------------------------------ */
/*						Unknown Board							*/
/* ------------------------------------------------------------ */

#else

#error "System board not defined"

#endif

/* ------------------------------------------------------------ */
/*			Non-Board Specific Declarations						*/
/* ------------------------------------------------------------ */

/* ------------------------------------------------------------ */

#endif

/************************************************************************/
