/************************************************************************/
/*																		*/
/*	ProMX7-Pins.x                                                       */
/*																		*/
/*	Pins defined for the chipKIT Pro MX7                                */
/*																		*/
/************************************************************************/
/*  Author:     Keith Vogel                                             */
/*  Copyright 2013, Digilent Inc.                                       */
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
/*	12/6/2013(KeithV): Created											*/
/*																		*/
/************************************************************************/

#ifndef CHIPKIT_PROMX7_X
#define CHIPKIT_PROMX7_X

#include <p32xxxx.h>

#ifdef __cplusplus
extern "C" {
#endif

#define PHY_TRIS            TRISAbits.TRISA6        // = 0; output
#define PHY_ENABLE          LATAbits.LATA6          // = 1; to enable
#define PHY_ADDRESS         0x5                     // something other than 0 or 1 (although 1 is okay)

#ifdef __cplusplus
}
#endif  // C++

#endif // CHIPKIT_PROMX7_X
