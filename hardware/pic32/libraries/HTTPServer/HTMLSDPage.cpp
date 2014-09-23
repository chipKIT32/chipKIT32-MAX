/************************************************************************/
/*                                                                      */
/*    HTMLSDPage.cpp                                                    */
/*                                                                      */
/*    Renders pages off of the SD card filesystem                       */
/*    Typically you would make this the default page handler            */
/*                                                                      */
/************************************************************************/
/*    Author:     Keith Vogel                                           */
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
/*  Revision History:                                                   */
/*    7/19/2013(KeithV): Created                                         */
/************************************************************************/
#include    <HTTPServer.h>

/************************************************************************/
/*    SD Card Reader variables                                          */
/************************************************************************/
#define pinSdCs PIN_SDCS

// used externally to this file
// this should not be used externally directly
// use the "is/take/release" functions defined in HTPServer.h
bool fSDfs = false;
uint32_t sdLockCur = SDUNLOCKED;
uint32_t sdLock = 1;

// you can use this directly externally only if you "take" the card reader
File fileSD = File();

static const char * szFileName      = NULL;
static const char   szDefaultPage[] = "HomePage.htm";
static CLIENTINFO * pClientMutex    = NULL;
static uint32_t     cbSent          = 0;
static uint32_t     tStart          = 0;
static uint32_t     sdLockId        = SDUNLOCKED;

/************************************************************************/
/*    HTML Strings                                                      */
/************************************************************************/
static const char szEndOfURL[] = " HTTP";
static const char szGET[] = "GET /";

/************************************************************************/
/*    State machine states                                              */
/************************************************************************/
typedef enum {
    PARSEFILENAME,
    BUILDHTTP,
    EXIT,
    SENDFILE,
    JMPFILENOTFOUND,
    DONE
 } STATE;

/***    void SDSetup(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *    
 *      Initializes SD Reader for HTML file operations
 *    
 * ------------------------------------------------------------ */
void SDSetup(void)
{
    // set up the lock counters
    sdLockCur   = SDUNLOCKED;
    sdLock      = SDUNLOCKED + 1; // never want this to be zero

    // Set the pin used to control the SS line on the SD card to output.
    digitalWrite(pinSdCs, HIGH);
    pinMode(pinSdCs, OUTPUT);

    // See if there is an SD card connected
    // and that the motion subdirectory exists
    fSDfs = false;
    if (SD.begin(pinSdCs))
    {
	    // Card successfully initialized, so we have a file system.
    	Serial.println("SD card initialized. File system found.");

        if(SD.exists((char *) szDefaultPage))
        {
            Serial.print("Default HTML page:");
            Serial.print(szDefaultPage);
            Serial.println(" exists!");
            fSDfs = true;
        }

        else
        {
            Serial.print("Unable to find default HTML page:");
            Serial.println(szDefaultPage);
        }
    }
    else
    {
            Serial.println("Unable to find SD Card Reader or filesystem");
    }
}

/***    GCMD::ACTION ComposeHTMLSDPage(CLIENTINFO * pClientInfo)
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
 *      This renders a page off of the SD filesystem. Pages of type
 *      .htm, .html, .jpeg, .png, .txt and more may be rendered
 *      The file extension on the filename determine the MIME type
 *      returned to the client.
 *    
 * ------------------------------------------------------------ */
GCMD::ACTION ComposeHTMLSDPage(CLIENTINFO * pClientInfo)
{
    char * pFileNameEnd     = NULL;

    GCMD::ACTION retCMD = GCMD::CONTINUE;

    switch(pClientInfo->htmlState)
    {
        case HTTPSTART:

            if(pClientMutex != NULL || (sdLockId = lockSD()) == SDUNLOCKED)
            {
                break;
            }
            pClientMutex = pClientInfo;

            Serial.println("Read an HTML page off of the SD card");

            Serial.print("Entering Client ID: 0x");
            Serial.println((uint32_t) pClientMutex, HEX);

            pClientInfo->htmlState = PARSEFILENAME;
            retCMD = GCMD::GETLINE;
            break;

        case PARSEFILENAME:

            // the assumption is that the file name will be on the first line of the command
            // there is a bunch of other stuff on the line we don't care about, but it is at the
            // end of the line.
            Serial.println((char *) pClientInfo->rgbIn);

            // find the begining of the file name
            szFileName = strstr((const char *) pClientInfo->rgbIn, szGET);
            if(szFileName == NULL)
            {
                pClientInfo->htmlState = JMPFILENOTFOUND;
                break;
            }
            szFileName += sizeof(szGET) - 1;

            // find the end of the file name
            pFileNameEnd = strstr(szFileName, szEndOfURL);

            if(pFileNameEnd == NULL)
            {
                pClientInfo->htmlState = JMPFILENOTFOUND;
                break;
            }
            else if(pFileNameEnd == szFileName)
            {
                szFileName = szDefaultPage;
            }
            else
            {
                *pFileNameEnd = '\0';
            }

            Serial.print("SD FileName:");
            Serial.println(szFileName);

            if(SD.exists((char *) szFileName))
            {
                Serial.print("HTML page:");
                Serial.print(szFileName);
                Serial.println(" exists!");
                pClientInfo->htmlState = BUILDHTTP;
            }

            else
            {
                Serial.print("Unable to find HTML page:");
                Serial.println(szFileName);
                pClientInfo->htmlState = JMPFILENOTFOUND;
            }
            break;

        // We need to build the HTTP directive
        case BUILDHTTP:

            if((fileSD = SD.open(szFileName, FILE_READ)) && fileSD.seek(0) )
            {
                pClientInfo->cbWrite = BuildHTTPOKStr(false, fileSD.size(), szFileName, (char *) pClientInfo->rgbOut, sizeof(pClientInfo->rgbOut));
                if(pClientInfo->cbWrite > 0)
                {
                    pClientInfo->pbOut = pClientInfo->rgbOut;
                    retCMD = GCMD::WRITE;
                    pClientInfo->htmlState = SENDFILE;
                    cbSent = 0;
                    tStart = millis();

                    Serial.print("Writing file:");
                    Serial.println(szFileName);
                }
                else
                {
                    Serial.print("Unable to build HTTP directive for file:");
                    Serial.println(szFileName);
                    pClientInfo->htmlState = JMPFILENOTFOUND;
                }
            }
            else
            {
                Serial.print("Unable to open HTML page:");
                Serial.println(szFileName);
                pClientInfo->htmlState = JMPFILENOTFOUND;
            }
            break;

        // Send the file
        case SENDFILE:
            {
                uint32_t    cbT = 0;

                if((cbT = SDRead(fileSD, pClientInfo->rgbOut, sizeof(pClientInfo->rgbOut))) > 0)
                {
                    cbSent += cbT;
                    pClientInfo->pbOut = pClientInfo->rgbOut;
                    pClientInfo->cbWrite = cbT;
                    tStart = millis();
                    retCMD = GCMD::WRITE;
                }
                else if(cbSent == fileSD.size())
                {
                   pClientInfo->htmlState = EXIT;
                }
                else if((millis() - tStart) > SDREADTIMEOUT)
                {
                   pClientInfo->htmlState = HTTPTIMEOUT;
                }
            }
            break;
    
         case EXIT:
            Serial.println("Wrote page cleanly");
            pClientInfo->htmlState = HTTPDISCONNECT;
            break;

        case JMPFILENOTFOUND:
            Serial.println("Jumping to HTTP File Not Found page");
            if(isMySD(sdLockId))
            {
                fileSD.close();
                sdLockId = unlockSD(sdLockId);
            }
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
                if(isMySD(sdLockId))
                {
                    fileSD.close();
                    sdLockId = unlockSD(sdLockId);
                }
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
