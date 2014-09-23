/************************************************************************/
/*                                                                      */
/*    HTMLGetIO.cpp                                                    */
/*                                                                      */
/*    Renders a simple dynamically generated HTML page                  */
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
// Required header
#include    <HTTPServer.h>
#include    <IOConfig.h>

/************************************************************************/
/*    Module Variables, exported to other modules                       */
/************************************************************************/
// by default consts are internal (static) and must be explicitly declared extern
extern const uint32_t rgReplacePins[cReplacementStrings] = REPLINIT;

/************************************************************************/
/*    HTML Strings                                                      */
/************************************************************************/
static const char szContentLength[] = "Content-Length: ";
static const char szIOPage[]        = "IOPage.htm";
static const char szReplaceStr[]    = "<!--~";
static const char szChecked[]       = "checked=\"checked\"";
static const char szUnChecked[]     = "                 ";
static const char szON[]            = "ON      ";
static const char szOFF[]           = "OFF     ";

/************************************************************************/
/*    Local Module Variables                                            */
/************************************************************************/
static uint32_t iReplace = 0;
static char * pchLast = NULL;

static char szPageBuffer[2048];
static uint32_t cbFile = 0;

static CLIENTINFO * pClientMutex    = NULL;
static uint32_t     sdLockId        = SDUNLOCKED;


/************************************************************************/
/*    State machine states                                              */
/************************************************************************/
// these are local to this file, and we can duplicate the names
// in other files as the compiler will not see these in other files.
// These are your local state machine states.
typedef enum {
    READTEMPLATE,
    REPLACE,
    SENDFILE,
    EXIT,
    JMPFILENOTFOUND,
    DONE
} STATE;

/*
    There are 3 magic predefined states:

        HTTPSTART: 
            This is a required state to have.
            This is always the starting state and the first state
            in your compose function.

        HTTPDISCONNECT:
            Not a required state to have, but this state will be called whenever
            your conneciton is closed. This will always be called even if you
            return GCMD::DONE requesting the connection to be closed. This is
            nice because you can do clean up steps here, because no matter how
            the connection was closed, you get a chance to clean up.

        HTTPTIMEOUT:
            This is not a required state to have.
            This is called if the connection timed out, that is, the connection was
            made, your compose function got called but some pending data did not come in.
            For example if you returned a GCMD::GETLINE yet a line never came in.
*/

/***    GCMD::ACTION ComposeHTMLGetIO(CLIENTINFO * pClientInfo)
 *
 *    Parameters:
 *          pClientInfo - the client info representing this connection and web page
 *              
 *    Return Values:
 *          GCMD::ACTION    - GCMD::CONTINUE, just return with no outside action
 *                          - GCMD::READ, non-blocking read of input data into the rgbIn buffer appended to the end of cbRead
 *                          - GCMD::GETLINE, blocking read until a line of input is read or until the rgbIn buffer is full, always the line starts at the beginnig of the rgbIn
 *                          - GCMD::WRITE, loop writing until all cbWrite bytes are written from the pbOut buffer
 *                          - GCMD::DONE, we are done processing and the connection can be closed
 *
 *    Description: 
 *    
 *      This renders a page of the LEDs, BTNs, or SWTs on the device
 *      It reads a template page from the SD card, puts it into a temp
 *      RAM buffer, and then updates the template with acutal values
 * ------------------------------------------------------------ */
GCMD::ACTION ComposeHTMLGetIO(CLIENTINFO * pClientInfo)
{
    char * pFileNameEnd     = NULL;

    GCMD::ACTION retCMD = GCMD::CONTINUE;

    switch(pClientInfo->htmlState)
    {
        case HTTPSTART:

            // serialize so we only do this page once at a time
            // this protects the szPageBuffer
            if(pClientMutex != NULL)
            {
                break;
            }
            pClientMutex = pClientInfo;

            Serial.println("Get IO Page Detected");

            Serial.print("Entering Client ID: 0x");
            Serial.println((uint32_t) pClientMutex, HEX);

            pClientInfo->htmlState = READTEMPLATE;
            break;

        // Read the template htm
        case READTEMPLATE:

            // We want to serialize usage to the SD card
            if((sdLockId = lockSD()) == SDUNLOCKED)
            {
                break;
            }

            // open the templeate file
            if((fileSD = SD.open(szIOPage, FILE_READ)) && fileSD.seek(0) )
            {
                // because we have the SD file data now, build the HTTP header in the output temp buffer
                // we will only use this if all goes well.
                // this will be held for 2 states
                cbFile = fileSD.size();
                pClientInfo->cbWrite = BuildHTTPOKStr(false, cbFile, szIOPage, (char *) pClientInfo->rgbOut, sizeof(pClientInfo->rgbOut));

                // since szIOPage is a template .htm, this better always be true!
                if( 0 < cbFile && cbFile < sizeof(szPageBuffer) && SDRead(fileSD, (uint8_t *) szPageBuffer, cbFile) == cbFile )
                {

                    // That Read could have takin some time, so lets release and pick up
                    // on another state
                    szPageBuffer[cbFile] = '\0';
                    iReplace = 0;
                    pchLast = szPageBuffer;
                    pClientInfo->htmlState = REPLACE;
                }

                // not good, not expected either
                else
                {
                    Serial.print("Unable to build HTTP directive for file:");
                    Serial.println(szIOPage);
                    Serial.print("Sizeof ");
                    Serial.print(szIOPage);
                    Serial.print(" is ");
                    Serial.print(cbFile, DEC);
                    Serial.println(" bytes");                 
                    Serial.print("Sizeof page buffer is");
                    Serial.print(sizeof(szPageBuffer), DEC);
                    Serial.println(" bytes");
                    pClientInfo->htmlState = JMPFILENOTFOUND;
                }
            }

            // something is wrong with the SD card; which happens  :-(
            else
            {
                Serial.print("Unable to open HTML page:");
                Serial.println(szIOPage);
                pClientInfo->htmlState = JMPFILENOTFOUND;
            }

            // no matter what, were are done with the SD Card
            fileSD.close();
            sdLockId = unlockSD(sdLockId);
            break;

        case REPLACE:

            // do our replacentments one string at a time.
            if(iReplace < cReplacementStrings)
            {
                if((pchLast = strstr(pchLast, szReplaceStr)) == NULL)
                {
                    // oh this is not good, something is wrong with the template file
                    Serial.print("Unable able to find template replacemnt on index ");
                    Serial.print(iReplace, DEC);
                    Serial.print(" in template file ");
                    Serial.println(szIOPage);
                    pClientInfo->htmlState = JMPFILENOTFOUND;
                }
                else
                {
                    bool isOn = digitalRead(rgReplacePins[iReplace]);

                    if(iReplace < HTTPCIO)
                    {
                        if(isOn)
                        {
                            memcpy(pchLast, szON, sizeof(szON)-1);
                        }
                        else
                        {
                            memcpy(pchLast, szOFF, sizeof(szOFF)-1);
                        }
                    }
                    else if((iReplace - HTTPCIO) < HTTPCLED)
                    {
                        if(isOn)
                        {
                            memcpy(pchLast, szChecked, sizeof(szChecked)-1);
                        }
                        else
                        {
                            memcpy(pchLast, szUnChecked, sizeof(szUnChecked)-1);
                        }
                    }

                    // do the next replacement string.
                    iReplace++;
                }
            }
            
            // time to start writing stuff out, first the HTTP header that has
            // been sitting in pClientInfo->rgbOut
            else
            {
                pClientInfo->pbOut = pClientInfo->rgbOut;
                retCMD = GCMD::WRITE;
                pClientInfo->htmlState = SENDFILE;
            }
            break;

        // Send the file
        case SENDFILE:
            pClientInfo->cbWrite = cbFile;
            pClientInfo->pbOut = (byte *) szPageBuffer;
            retCMD = GCMD::WRITE;
            pClientInfo->htmlState = EXIT;
            break;
    
         case EXIT:
            Serial.println("Wrote page cleanly");
            pClientInfo->htmlState = HTTPDISCONNECT;
            break;

        case JMPFILENOTFOUND:
            Serial.println("Jumping to HTTP File Not Found page");
            pClientMutex = NULL;
            return(JumpToComposeHTMLPage(pClientInfo, ComposeHTTP404Error));
            break;

        case HTTPTIMEOUT:
            Serial.println("Timeout error occured, closing the session");

            // fall thru to close

        case HTTPDISCONNECT:
            if(pClientMutex == pClientInfo)
            {
                Serial.print("Closing Client ID: 0x");
                Serial.println((uint32_t) pClientMutex, HEX);
                pClientMutex = NULL;
            }
            // fall thru Done

        case DONE:
        default:
            pClientInfo->cbWrite = 0;
            retCMD = GCMD::DONE;
            break;
    }

    return(retCMD);
}



