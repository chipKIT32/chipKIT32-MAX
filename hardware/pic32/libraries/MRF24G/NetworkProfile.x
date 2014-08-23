/************************************************************************/
/*																		*/
/*	NetworkProfile.x                                                    */
/*																		*/
/*	Network Hardware vector file for the MRF24WG PmodWiFi               */
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
/*	0/16/2013 (KeithV): Created											*/
/*																		*/
/************************************************************************/

#ifndef PMODWIFI_NETWORK_PROFILE_X
#define PMODWIFI_NETWORK_PROFILE_X

#define DWIFIcK_WiFi_Hardware
#define MRF24WG
#define DNETcK_Network_Hardware
#define DWIFIcK_PmodWiFi
#define USING_WIFI 1

// board specific stuff
#if defined(_BOARD_UC32_) || defined(_BOARD_CEREBOT_MX3CK_512_)

    #include <uC32-MRF24WG.x>

#elif defined (_BOARD_MEGA_)

    #include <Max32-MRF24WG.x>

#elif defined (_BOARD_CEREBOT_MX4CK_)

    #include <MX4cK-MRF24WG.x>

#elif defined (_BOARD_CEREBOT_MX7CK_)

    #include <MX7cK-MRF24WG.x>

#elif defined (_BOARD_WF32_)

    #include <WF32-MRF24WG.x>

#elif defined (_BOARD_FUBARINO_SD_)

    #include <FubarSD-MRF24WG.x>

#elif defined (_BOARD_WIFIRE_)

    #include <WiFire-MRF24WG.x>

#else

    #error Neither the WiFi Shield nor PmodWiFi is supported by this board.

#endif

#include <MRF24Gadaptor.h>

#endif // PMODWIFI_NETWORK_PROFILE_X
