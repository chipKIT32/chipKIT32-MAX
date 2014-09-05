/************************************************************************/
/*																		*/
/*	Uno32-MRF24WG.x                                                     */
/*																		*/
/*	MRF24WG WiFi interrupt and SPI configuration file 				    */
/*	Specific to the Uno32 WiFiShield                                    */
/*																		*/
/************************************************************************/
/*	Author: 	Keith Vogel 											*/
/*	Copyright 2013, Digilent Inc.										*/
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
/*  Revision History:													*/
/*																		*/
/*	10/16//2013 (KeithV): Created							            */
/*																		*/
/************************************************************************/

#ifndef WiFire_MRF24WG_X
#define WiFire_MRF24WG_X

#include <p32xxxx.h>

#ifdef __cplusplus
extern "C" {
#endif

#define WF_INT              4
#define WF_SPI              4
#define WF_SPI_FREQ         10000000

#define WF_INT_TRIS         (TRISAbits.TRISA15)
#define WF_INT_IO           (PORTAbits.RA15)

#define WF_HIBERNATE_TRIS   (TRISGbits.TRISG1)
#define	WF_HIBERNATE_IO     (PORTGbits.RG1)

#define WF_RESET_TRIS       (TRISFbits.TRISF4)
#define WF_RESET_IO         (LATFbits.LATF4)

#define WF_CS_TRIS          (TRISDbits.TRISD9)
#define WF_CS_IO            (LATDbits.LATD9)

// for PPS devices
#define WF_INT_PPS()    INT4R   = 0b1101    // INT4     A15     INT4R = 0b1101
#define WF_HIB_PPS()    RPG1R   = 0b0000    // HIB      G1      GPIO
#define WF_RESET_PPS()  RPF4R   = 0b0000    // RESET    F4      GPIO
#define WF_CS_PPS()     RPD9R   = 0b0000    // CS       D9      GPIO
#define WF_SCK_PPS()    RPD10R  = 0b0000    // SCK4     RD10    GPIO
#define WF_SDI_PPS()    SDI4R   = 0b0010    // SDI4     RF5     SDI4R = 0b0010
#define WF_SDO_PPS()    RPG0R   = 0b1000    // SDO4     RG0     RPG0R = 0b1000

#include "SPIandINT.h"

#ifdef __cplusplus
}
#endif  // C++

#endif // WiFire_MRF24WG_X
