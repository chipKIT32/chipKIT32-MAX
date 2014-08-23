/************************************************************************/
/*                                                                      */
/*    HTMLPostLED.cpp                                                   */
/*                                                                      */
/*    Implements the Posting of LEDs to the URL                         */
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

// when done we will jump to the is page to redraw it
GCMD::ACTION ComposeHTMLGetIO(CLIENTINFO * pClientInfo);

/************************************************************************/
/*    HTML Strings                                                      */
/************************************************************************/
static const char szContentLength[] = "Content-Length: ";
static const char szLEDS[]          = "LEDS=";
/************************************************************************/
/*    extern Module Variables, needed by HTMLPostLED                    */
/************************************************************************/
/************************************************************************/
/*    State machine states                                              */
/************************************************************************/
// these are local to this file, and we can duplicate the names
// in other files as the compiler will not see these in other files.
// These are your local state machine states.
typedef enum {
    CONTLEN,
    ENDHDR,
    DATA,
    PARSE,
    GETPAGE,
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

/***    GCMD::ACTION ComposeHTMLPostPicture(CLIENTINFO * pClientInfo)
 *
 *    Parameters:
 *          pClientInfo - the client info representing this connection and web page
 *
 *    Return Values:
 *          GCMD::ACTION    - GCMD::CONTINUE, just return with no outside action
 *                          - GCMD::READ, non-blocking read of input data into the rgbIn buffer appended to the end of rgbIn[] which has a predefined size of 256 bytes
 *                              when we return to this compose function cbRead will have the number of bytes read, and likely could be zero.
 *                          - GCMD::GETLINE, blocking read until a line of input is read or until the rgbIn buffer is full, always the line starts at the beginnig of the rgbIn
 *                              cbRead has the number of bytes read
 *                          - GCMD::WRITE, loop writing until all cbWrite bytes are written from the pbOut buffer
 *                              pbOut can point to any valid buffer that will remain unchanged until execution returns to this function. We could get a TIMOUT
 *                              if we can't write the data. cbWritten will have the number of bytes actually written. As part of each connection there is a
 *                              scratch buffer of 256 provide at rgbOut; it is optional to point pbOut to rgbOut. PbOut can point anywhere and that is what will be written
 *                              cbWrite must be set to the number of bytes to write.
 *                          - GCMD::DONE, we are done processing and the connection can be closed
 *
 *    Description:
 *
 *      This parsge the Post command and sets the picture to print
 *      and jumps to the SelPic page to redraw the picture.
 *
 * ------------------------------------------------------------ */
GCMD::ACTION ComposeHTMLPostLED(CLIENTINFO * pClientInfo)
{
    GCMD::ACTION retCMD = GCMD::CONTINUE;
    char * pPattern = NULL;

    // a word of caution... DO NOT cast htmlState to your enum type!
    // the compiler will silently remove the HTTPSTART case as
    // that state is not part of your enum. Keep the switch on typed
    // aginst the generic uint32_t.
    switch(pClientInfo->htmlState)
    {

        // Every Compose function will start at the magic HTTPSTART state
        // we MUST support this state.
        case HTTPSTART:
            Serial.println("Post LED Page Detected");
            pClientInfo->htmlState = CONTLEN;
            retCMD = GCMD::GETLINE;
            break;

        case CONTLEN:

            // if we hit the end of the header then there was no content length
            // and we don't know how to handle that, so exit with an error
            // File not found is probably the wrong error, but it does get out out
            // Fortunately all major browsers put in the content lenght, so this
            // will almost never fail.
            if(strlen((char *) pClientInfo->rgbIn) == 0)    // cbRead may be longer than just the line, so do a strlen()
            {
                return(JumpToComposeHTMLPage(pClientInfo, ComposeHTTP404Error));
            }

            // found the content lengths
            else if(memcmp((byte *) szContentLength, pClientInfo->rgbIn, sizeof(szContentLength)-1) == 0)
            {

                *((uint32_t *) pClientInfo->rgbOut) = atoi((char *) &pClientInfo->rgbIn[sizeof(szContentLength)-1]);
                pClientInfo->htmlState = ENDHDR;
            }
            retCMD = GCMD::GETLINE;
            break;

        case ENDHDR:

            // the header is ended with a double \r\n\r\n, so I will get
            // a zero length line. Just keep reading lines until we get to the blank line
            if(strlen((char *) pClientInfo->rgbIn) == 0)    // cbRead may be longer than just the line, so do a strlen()
            {
                uint32_t i = 0;

                // go to beyond the \0
                for(i = 0; i < pClientInfo->cbRead && pClientInfo->rgbIn[i] == '\0'; i++);

                // move the buffer to the front
                pClientInfo->cbRead -= i;
                if(pClientInfo->cbRead > 0)
                {
                    memcpy(pClientInfo->rgbIn, &pClientInfo->rgbIn[i], pClientInfo->cbRead);
                }

                pClientInfo->htmlState = DATA;
            }
            else
            {
                retCMD = GCMD::GETLINE;
            }
            break;

        case DATA:

            // we know the body will be small, so just keep reading until we have the full
            // body of the HTTP message read into our input buffer.
            // remember we put the lenght in out output buffer using that as temp storage
            if(pClientInfo->cbRead < *((uint32_t *) pClientInfo->rgbOut))
            {
                pClientInfo->rgbIn[*((uint32_t *) pClientInfo->rgbOut)] = '\0';
                retCMD = GCMD::READ;
            }
            else
            {
                pClientInfo->htmlState = PARSE;
            }
            break;

        case PARSE:
            {
                int ledState[HTTPCLED];
                pPattern = (char *) pClientInfo->rgbIn;

                // init all LEDS to LOW
                memset(ledState, LOW, sizeof(ledState));

                // read in the LED states
                while((pPattern = strstr(pPattern, szLEDS)) != NULL)
                {
                    int i;
                    pPattern += sizeof(szLEDS) - 1;
                    i = (int) (*pPattern - '1');

                    if(0 <= i  &&  i < HTTPCLED)
                    {
                        ledState[i] = HIGH;
                    }                    
                }

                // set the LED state
                for(int i=0; i < HTTPCLED; i++)
                {
                    digitalWrite(rgReplacePins[HTTPCIO + i], ledState[i]);
                }
            }

            pClientInfo->htmlState = GETPAGE;
            break;


        case GETPAGE:
            Serial.println("Jumping to Select Picture Page");
            return(JumpToComposeHTMLPage(pClientInfo, ComposeHTMLGetIO));
            break;

        case HTTPDISCONNECT:

        // the done state is were we say we are done, and that
        // the connection can be closed
        case DONE:
        default:

            // by returning DONE, we will close the connection
            // and be done with this page
            retCMD = GCMD::DONE;
            break;
    }

    // Return the command we want to do
    // like WRITE, or DONE
    return(retCMD);
}
