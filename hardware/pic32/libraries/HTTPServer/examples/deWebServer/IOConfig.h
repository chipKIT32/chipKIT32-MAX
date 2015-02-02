/************************************************************************/
/*                                                                      */
/*    IOConfgi.h                                                        */
/*                                                                      */
/*    Simple mapping of LEDs, BTNs, or SWTs for the demo per board      */
/*                                                                      */
/************************************************************************/
/*    Author:     Keith Vogel                                           */
/*    Copyright 2014, Digilent Inc.                                     */
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
/*  Revision History:                                                   */
/*    6/18/2014(KeithV): Created                                        */
/************************************************************************/


#if defined(_BOARD_UC32_)       // this assumes a BasicIO Shield is attached

    // define the IOs and LEDs
    #define HTTPIO1         7       // switch 2    
    #define HTTPIO2         8       // switch 3
    #define HTTPLED1        26      // LED 1
    #define HTTPLED2        27      // LED 2
    #define HTTPLED3        28      // LED 3
    #define HTTPLED4        29      // LED 4
    #define HTTPLED5        30      // LED 5
    #define HTTPLED6        31      // LED 6
    #define HTTPLED7        32      // LED 7
    #define HTTPLED8        33      // LED 8

    // set up the replacement strings
    #define HTTPCIO         2
    #define HTTPCLED        3
    #define REPLINIT {HTTPIO1, HTTPIO2, HTTPLED1, HTTPLED2, HTTPLED3}

    // services for the SD card, status LED and Serial Camera
    // these are required for the HTTP library and the Camera library
    #define PIN_SDCS        4
    #define PIN_LED_SAFE    PIN_LED2
    #define CAMSERIAL       Serial1

#elif defined (_BOARD_WF32_)

    // define the IOs and LEDs
    #define HTTPIO1         PIN_BTN1    
    #define HTTPIO2         PIN_BTN2
    #define HTTPLED1        PIN_LED1
    #define HTTPLED2        PIN_LED2
    #define HTTPLED3        PIN_LED3
    #define HTTPLED4        PIN_LED4

    // set up the replacement strings
    #define HTTPCIO         2
    #define HTTPCLED        3
    #define REPLINIT {HTTPIO1, HTTPIO2, HTTPLED1, HTTPLED2, HTTPLED3}

    // services for the SD card, status LED and Serial Camera
    // these are required for the HTTP library and the Camera library
    #define PIN_SDCS        51
    #define PIN_LED_SAFE    PIN_LED4
    #define CAMSERIAL       Serial1

#elif defined (_BOARD_WIFIRE_)

    // define the IOs and LEDs
    #define HTTPIO1         PIN_BTN1    
    #define HTTPIO2         PIN_BTN2
    #define HTTPLED1        PIN_LED1
    #define HTTPLED2        PIN_LED2
    #define HTTPLED3        PIN_LED3
    #define HTTPLED4        PIN_LED4

    // set up the replacement strings
    #define HTTPCIO         2
    #define HTTPCLED        3
    #define REPLINIT {HTTPIO1, HTTPIO2, HTTPLED1, HTTPLED2, HTTPLED3}

    // services for the SD card, status LED and Serial Camera
    // these are required for the HTTP library and the Camera library
    #define PIN_SDCS        52
    #define PIN_LED_SAFE    PIN_LED4
    #define CAMSERIAL       Serial1

#elif defined(_BOARD_CEREBOT_MX7CK_)

    // define the IOs and LEDs
    #define HTTPIO1         PIN_BTN1    
    #define HTTPIO2         PIN_BTN2
    #define HTTPLED1        PIN_LED1
    #define HTTPLED2        PIN_LED2
    #define HTTPLED3        PIN_LED3
    #define HTTPLED4        PIN_LED4

    // set up the replacement strings
    #define HTTPCIO         2
    #define HTTPCLED        3
    #define REPLINIT {HTTPIO1, HTTPIO2, HTTPLED1, HTTPLED2, HTTPLED3}

    // services for the SD card, status LED and Serial Camera
    // these are required for the HTTP library and the Camera library
    #define PIN_SDCS        SS
    #define PIN_LED_SAFE    PIN_LED4
    #define CAMSERIAL       Serial1

#else
    #error HTTP Server does not support this board
#endif

// This must match the order and number of replacement strings in IOPage.htm
#define cReplacementStrings (HTTPCLED + HTTPCIO)
extern const uint32_t rgReplacePins[];
