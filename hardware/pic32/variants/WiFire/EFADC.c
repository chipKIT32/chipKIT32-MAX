/************************************************************************/
/*                                                                      */
/*  EFADC.cpp   WiFIRE ADC code for the EF MZ processor line            */
/*                                                                      */
/************************************************************************/
/*  Author:     Keith Vogel                                             */
/*  Copyright 2015, Digilent Inc.                                       */
/************************************************************************/
/* 
*
* Copyright (c) 2015, Digilent <www.digilentinc.com>
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
/*  Module Description:                                                 */
/*                                                                      */
/*      Implements the WiFIRE EF ADC                                    */
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*      6/8/2011(KeithV): Created                                     */
/*                                                                      */
/************************************************************************/

#include <Arduino.h>
#include	"EFADC.h"

/************************************************************************/
/************************************************************************/
/*  Memory map placing of all of the EF ADC sfrs                        */
/************************************************************************/
/************************************************************************/
volatile unsigned int        ADCCON1 __attribute__((section("sfrs"), address(0xBF84B000)));
volatile unsigned int        ADCCON2 __attribute__((section("sfrs"), address(0xBF84B004)));
volatile unsigned int        ADCCON3 __attribute__((section("sfrs"), address(0xBF84B008)));
volatile unsigned int        ADCTRGMODE __attribute__((section("sfrs"), address(0xBF84B00C)));
volatile unsigned int        ADCIMCON1 __attribute__((section("sfrs"), address(0xBF84B010)));
volatile unsigned int        ADCIMCON2 __attribute__((section("sfrs"), address(0xBF84B014)));
volatile unsigned int        ADCIMCON3 __attribute__((section("sfrs"), address(0xBF84B018)));
volatile unsigned int        ADCGIRQEN1 __attribute__((section("sfrs"), address(0xBF84B020)));
volatile unsigned int        ADCGIRQEN2 __attribute__((section("sfrs"), address(0xBF84B024)));
volatile unsigned int        ADCCSS1 __attribute__((section("sfrs"), address(0xBF84B028)));
volatile unsigned int        ADCCSS2 __attribute__((section("sfrs"), address(0xBF84B02C)));
volatile unsigned int        ADCDSTAT1 __attribute__((section("sfrs"), address(0xBF84B030)));
volatile unsigned int        ADCDSTAT2 __attribute__((section("sfrs"), address(0xBF84B034)));
volatile unsigned int        ADCCMPEN1 __attribute__((section("sfrs"), address(0xBF84B038)));
volatile unsigned int        ADCCMP1 __attribute__((section("sfrs"), address(0xBF84B03C)));
volatile unsigned int        ADCCMPEN2 __attribute__((section("sfrs"), address(0xBF84B040)));
volatile unsigned int        ADCCMP2 __attribute__((section("sfrs"), address(0xBF84B044)));
volatile unsigned int        ADCCMPEN3 __attribute__((section("sfrs"), address(0xBF84B048)));
volatile unsigned int        ADCCMP3 __attribute__((section("sfrs"), address(0xBF84B04C)));
volatile unsigned int        ADCCMPEN4 __attribute__((section("sfrs"), address(0xBF84B050)));
volatile unsigned int        ADCCMP4 __attribute__((section("sfrs"), address(0xBF84B054)));
volatile unsigned int        ADCCMPEN5 __attribute__((section("sfrs"), address(0xBF84B058)));
volatile unsigned int        ADCCMP5 __attribute__((section("sfrs"), address(0xBF84B05C)));
volatile unsigned int        ADCCMPEN6 __attribute__((section("sfrs"), address(0xBF84B060)));
volatile unsigned int        ADCCMP6 __attribute__((section("sfrs"), address(0xBF84B064)));
volatile unsigned int        ADCFLTR1 __attribute__((section("sfrs"), address(0xBF84B068)));
volatile unsigned int        ADCFLTR2 __attribute__((section("sfrs"), address(0xBF84B06C)));
volatile unsigned int        ADCFLTR3 __attribute__((section("sfrs"), address(0xBF84B070)));
volatile unsigned int        ADCFLTR4 __attribute__((section("sfrs"), address(0xBF84B074)));
volatile unsigned int        ADCFLTR5 __attribute__((section("sfrs"), address(0xBF84B078)));
volatile unsigned int        ADCFLTR6 __attribute__((section("sfrs"), address(0xBF84B07C)));
volatile unsigned int        ADCTRG1 __attribute__((section("sfrs"), address(0xBF84B080)));
volatile unsigned int        ADCTRG2 __attribute__((section("sfrs"), address(0xBF84B084)));
volatile unsigned int        ADCTRG3 __attribute__((section("sfrs"), address(0xBF84B088)));
volatile unsigned int        ADCCMPCON1 __attribute__((section("sfrs"), address(0xBF84B0A0)));
volatile unsigned int        ADCCMPCON2 __attribute__((section("sfrs"), address(0xBF84B0A4)));
volatile unsigned int        ADCCMPCON3 __attribute__((section("sfrs"), address(0xBF84B0A8)));
volatile unsigned int        ADCCMPCON4 __attribute__((section("sfrs"), address(0xBF84B0AC)));
volatile unsigned int        ADCCMPCON5 __attribute__((section("sfrs"), address(0xBF84B0B0)));
volatile unsigned int        ADCCMPCON6 __attribute__((section("sfrs"), address(0xBF84B0B4)));
volatile unsigned int        ADCBASE __attribute__((section("sfrs"), address(0xBF84B0C0)));
volatile unsigned int        ADCTRGSNS __attribute__((section("sfrs"), address(0xBF84B0D0)));
volatile unsigned int        ADC0TIME __attribute__((section("sfrs"), address(0xBF84B0D4)));
volatile unsigned int        ADC1TIME __attribute__((section("sfrs"), address(0xBF84B0D8)));
volatile unsigned int        ADC2TIME __attribute__((section("sfrs"), address(0xBF84B0DC)));
volatile unsigned int        ADC3TIME __attribute__((section("sfrs"), address(0xBF84B0E0)));
volatile unsigned int        ADC4TIME __attribute__((section("sfrs"), address(0xBF84B0E4)));
volatile unsigned int        ADCEIEN1 __attribute__((section("sfrs"), address(0xBF84B0F0)));
volatile unsigned int        ADCEIEN2 __attribute__((section("sfrs"), address(0xBF84B0F4)));
volatile unsigned int        ADCEISTAT1 __attribute__((section("sfrs"), address(0xBF84B0F8)));
volatile unsigned int        ADCEISTAT2 __attribute__((section("sfrs"), address(0xBF84B0FC)));
volatile unsigned int        ADCANCON __attribute__((section("sfrs"), address(0xBF84B100)));
volatile unsigned int        ADC0CFG __attribute__((section("sfrs"), address(0xBF84B180)));
volatile unsigned int        ADC1CFG __attribute__((section("sfrs"), address(0xBF84B184)));
volatile unsigned int        ADC2CFG __attribute__((section("sfrs"), address(0xBF84B188)));
volatile unsigned int        ADC3CFG __attribute__((section("sfrs"), address(0xBF84B18C)));
volatile unsigned int        ADC4CFG __attribute__((section("sfrs"), address(0xBF84B190)));
volatile unsigned int        ADC7CFG __attribute__((section("sfrs"), address(0xBF84B19C)));
volatile unsigned int        ADCSYSCFG0 __attribute__((section("sfrs"), address(0xBF84B1C0)));
volatile unsigned int        ADCSYSCFG1 __attribute__((section("sfrs"), address(0xBF84B1C4)));
volatile unsigned int        ADCDATA0 __attribute__((section("sfrs"), address(0xBF84B200)));
volatile unsigned int        ADCDATA1 __attribute__((section("sfrs"), address(0xBF84B204)));
volatile unsigned int        ADCDATA2 __attribute__((section("sfrs"), address(0xBF84B208)));
volatile unsigned int        ADCDATA3 __attribute__((section("sfrs"), address(0xBF84B20C)));
volatile unsigned int        ADCDATA4 __attribute__((section("sfrs"), address(0xBF84B210)));
volatile unsigned int        ADCDATA5 __attribute__((section("sfrs"), address(0xBF84B214)));
volatile unsigned int        ADCDATA6 __attribute__((section("sfrs"), address(0xBF84B218)));
volatile unsigned int        ADCDATA7 __attribute__((section("sfrs"), address(0xBF84B21C)));
volatile unsigned int        ADCDATA8 __attribute__((section("sfrs"), address(0xBF84B220)));
volatile unsigned int        ADCDATA9 __attribute__((section("sfrs"), address(0xBF84B224)));
volatile unsigned int        ADCDATA10 __attribute__((section("sfrs"), address(0xBF84B228)));
volatile unsigned int        ADCDATA11 __attribute__((section("sfrs"), address(0xBF84B22C)));
volatile unsigned int        ADCDATA12 __attribute__((section("sfrs"), address(0xBF84B230)));
volatile unsigned int        ADCDATA13 __attribute__((section("sfrs"), address(0xBF84B234)));
volatile unsigned int        ADCDATA14 __attribute__((section("sfrs"), address(0xBF84B238)));
volatile unsigned int        ADCDATA15 __attribute__((section("sfrs"), address(0xBF84B23C)));
volatile unsigned int        ADCDATA16 __attribute__((section("sfrs"), address(0xBF84B240)));
volatile unsigned int        ADCDATA17 __attribute__((section("sfrs"), address(0xBF84B244)));
volatile unsigned int        ADCDATA18 __attribute__((section("sfrs"), address(0xBF84B248)));
volatile unsigned int        ADCDATA19 __attribute__((section("sfrs"), address(0xBF84B24C)));
volatile unsigned int        ADCDATA20 __attribute__((section("sfrs"), address(0xBF84B250)));
volatile unsigned int        ADCDATA21 __attribute__((section("sfrs"), address(0xBF84B254)));
volatile unsigned int        ADCDATA22 __attribute__((section("sfrs"), address(0xBF84B258)));
volatile unsigned int        ADCDATA23 __attribute__((section("sfrs"), address(0xBF84B25C)));
volatile unsigned int        ADCDATA24 __attribute__((section("sfrs"), address(0xBF84B260)));
volatile unsigned int        ADCDATA25 __attribute__((section("sfrs"), address(0xBF84B264)));
volatile unsigned int        ADCDATA26 __attribute__((section("sfrs"), address(0xBF84B268)));
volatile unsigned int        ADCDATA27 __attribute__((section("sfrs"), address(0xBF84B26C)));
volatile unsigned int        ADCDATA28 __attribute__((section("sfrs"), address(0xBF84B270)));
volatile unsigned int        ADCDATA29 __attribute__((section("sfrs"), address(0xBF84B274)));
volatile unsigned int        ADCDATA30 __attribute__((section("sfrs"), address(0xBF84B278)));
volatile unsigned int        ADCDATA31 __attribute__((section("sfrs"), address(0xBF84B27C)));
volatile unsigned int        ADCDATA32 __attribute__((section("sfrs"), address(0xBF84B280)));
volatile unsigned int        ADCDATA33 __attribute__((section("sfrs"), address(0xBF84B284)));
volatile unsigned int        ADCDATA34 __attribute__((section("sfrs"), address(0xBF84B288)));
volatile unsigned int        ADCDATA43 __attribute__((section("sfrs"), address(0xBF84B2AC)));
volatile unsigned int        ADCDATA44 __attribute__((section("sfrs"), address(0xBF84B2B0)));

/* ------------------------------------------------------------ */
/***	initWiFIREadcEF
**
**	Parameters:
**		none
**
**	Return Value:
**      none
**
**	Errors:
**     none
**
**	Description:
**      Initialize the MZ EF ADCs for the WiFIRE
**
*/
void initWiFIREadcEF(void)
{
    uint32_t    cTADWarmUp = 0;
    uint32_t    i = 0;

    // initialize configuration registers
    ADCCON1     = 0; 
    ADCCON2     = 0; 
    ADCCON3     = 0; 
    ADCANCON    = 0;

    // resolution 0 - 6bits, 1 - 8bits, 2 - 10bits, 3 - 12bits
    ADCCON1bits.SELRES  =   3;  // shared ADC, 12 bits resolution (bits+2 TADs, 12bit resolution = 14 TAD).

    // 0 - no trigger, 1 - clearing software trigger, 2 - not clearing software trigger, the rest see datasheet
    ADCCON1bits.STRGSRC     = 1;    //Global software trigger / self clearing.

    // 0 - internal 3.3, 1 - use external VRef+, 2 - use external VRef-
    ADCCON3bits.VREFSEL     = 0;    // use internal 3.3 reference

    // this should be set if VRef+ - VRef - < 0.65 VCC; this may not need to be on
    // ADCCON1bits.AICPMPEN    = 1;    // turn on the analog charge pump

    // set up the TQ and TAD and S&H times

    // TCLK: 00- pbClk3, 01 - SysClk, 10 - External Clk3, 11 - interal 8 MHz clk
    ADCCON3bits.ADCSEL      = 0b01;             // TCLK clk == Sys Clock == F_CPU  

    // Global ADC TQ Clock: Global ADC prescaler 0 - 63; Divide by (CONCLKDIV*2) However, the value 0 means divide by 1
    ADCCON3bits.CONCLKDIV   = 0;                // Divide by 1 == TCLK == SYSCLK == F_CPU

    // must be divisible by 2 (25 - 50MHz should be good; we are not in a hurry, so 25MHz).
    ADCCON2bits.ADCDIV      = ((F_CPU / ADCTADFREQ) + 1) / 2;   // run TAD at 25MHz

    ADCCON2bits.SAMC        = ADCTADSH;   // for the shared S&H this will allow source impedances < 10Kohm

    // with 25MHz TAD and 68 TAD S&H and 14 TAD for 12 bit resolution, that is 25000000 / (68+14) = 304,878 Sps or 3.28 us/sample

    // initialize the warm up timer
    // 20us or 500 TAD which ever is higher 1/20us == 50KHz
    cTADWarmUp = ((F_CPU / (ADCCON3bits.CONCLKDIV == 0 ? 1 : (ADCCON3bits.CONCLKDIV * 2))) / (F_CPU / ADCTADFREQ) / 50000ul);
    if(cTADWarmUp < 500) 
    {
        cTADWarmUp = 500;
    }

    // get the next higher power of the count
    for(i=0; i<16; i++)
    {
        if((cTADWarmUp >> i) == 0)
        {
            break;
        }
    }

    // the warm up count is 2^^X where X = 0 -15
    ADCANCONbits.WKUPCLKCNT = i; // Wakeup exponent = 2^^15 * TADx   
  
    // ADC 0
    ADC0TIMEbits.ADCDIV     = ADCCON2bits.ADCDIV;       // ADC0 clock frequency is half of control clock = TAD0 200 / 2 (pb) / 2 (clkdiv) / 2 (adcdiv) == TAD == 25 MHz
    ADC0TIMEbits.SAMC       = ADCCON2bits.SAMC;    // ADC0 sampling time = (SAMC+2) * TAD0
    ADC0TIMEbits.SELRES     = ADCCON3bits.VREFSEL;             // ADC0 resolution is 12 bits 

    // ADC 1
    ADC1TIMEbits.ADCDIV     = ADCCON2bits.ADCDIV;       // ADC0 clock frequency is half of control clock = TAD0 200 / 2 (pb) / 2 (clkdiv) / 2 (adcdiv) == TAD == 25 MHz
    ADC1TIMEbits.SAMC       = ADCCON2bits.SAMC;    // ADC0 sampling time = (SAMC+2) * TAD0
    ADC1TIMEbits.SELRES     = ADCCON3bits.VREFSEL;             // ADC0 resolution is 12 bits 

    // ADC 2
    ADC2TIMEbits.ADCDIV     = ADCCON2bits.ADCDIV;       // ADC0 clock frequency is half of control clock = TAD0 200 / 2 (pb) / 2 (clkdiv) / 2 (adcdiv) == TAD == 25 MHz
    ADC2TIMEbits.SAMC       = ADCCON2bits.SAMC;    // ADC0 sampling time = (SAMC+2) * TAD0
    ADC2TIMEbits.SELRES     = ADCCON3bits.VREFSEL;             // ADC0 resolution is 12 bits 

    // ADC 3
    ADC3TIMEbits.ADCDIV     = ADCCON2bits.ADCDIV;       // ADC0 clock frequency is half of control clock = TAD0 200 / 2 (pb) / 2 (clkdiv) / 2 (adcdiv) == TAD == 25 MHz
    ADC3TIMEbits.SAMC       = ADCCON2bits.SAMC;    // ADC0 sampling time = (SAMC+2) * TAD0
    ADC3TIMEbits.SELRES     = ADCCON3bits.VREFSEL;             // ADC0 resolution is 12 bits 

    // ADC 4
    ADC4TIMEbits.ADCDIV     = ADCCON2bits.ADCDIV;       // ADC0 clock frequency is half of control clock = TAD0 200 / 2 (pb) / 2 (clkdiv) / 2 (adcdiv) == TAD == 25 MHz
    ADC4TIMEbits.SAMC       = ADCCON2bits.SAMC;    // ADC0 sampling time = (SAMC+2) * TAD0
    ADC4TIMEbits.SELRES     = ADCCON3bits.VREFSEL;             // ADC0 resolution is 12 bits 

    /* Configure ADCIRQENx */
    ADCCMPEN1 = 0; // No interrupts are used
    ADCCMPEN2 = 0;
    
    /* Configure ADCCSSx */
    ADCCSS1 = 0; // No scanning is used
    ADCCSS2 = 0;
    
    /* Configure ADCCMPxCON */
    ADCCMP1 = 0; // No digital comparators are used. Setting the ADCCMPxCON
    ADCCMP2 = 0; // register to '0' ensures that the comparator is disabled.
    ADCCMP3 = 0; // Other registers are ?don't care?.
    ADCCMP4 = 0;
    ADCCMP5 = 0;
    ADCCMP6 = 0;    

    /* Configure ADCFLTRx */
    ADCFLTR1 = 0; // Clear all bits
    ADCFLTR2 = 0;
    ADCFLTR3 = 0;
    ADCFLTR4 = 0;
    ADCFLTR5 = 0;
    ADCFLTR6 = 0;
    
    // disable all global interrupts
    ADCGIRQEN1 = 0;
    ADCGIRQEN2 = 0;
    
    /* Early interrupt */
    ADCEIEN1 = 0; // No early interrupt
    ADCEIEN2 = 0;

    // no dedicated trigger sources
    ADCTRGMODE  =   0;

    // put everything in single ended unsigned mode
    ADCIMCON1   = 0;
    ADCIMCON2   = 0;
    ADCIMCON3   = 0;
//        ADCIMCON4   = 0;

    // triggers are all edge trigger
    ADCTRGSNS = 0;

    // turn on the ADCs
    ADCCON1bits.ON = 1;

    /* Wait for voltage reference to be stable */
    while(!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while(ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN0 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN1 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN2 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN3 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN4 = 1; // Enable the clock to analog bias and digital control
    ADCANCONbits.ANEN7 = 1; // Enable the clock to analog bias and digital control
   
    /* Wait for ADC to be ready */
    while(!ADCANCONbits.WKRDY0); // Wait until ADC0 is ready
    while(!ADCANCONbits.WKRDY1); // Wait until ADC1 is ready
    while(!ADCANCONbits.WKRDY2); // Wait until ADC2 is ready
    while(!ADCANCONbits.WKRDY3); // Wait until ADC3 is ready
    while(!ADCANCONbits.WKRDY4); // Wait until ADC3 is ready
    while(!ADCANCONbits.WKRDY7); // Wait until ADC0 is ready
        
    /* Enable the ADC module */
    ADCCON3bits.DIGEN0 = 1; // Enable ADC0
    ADCCON3bits.DIGEN1 = 1; // Enable ADC1
    ADCCON3bits.DIGEN2 = 1; // Enable ADC2
    ADCCON3bits.DIGEN3 = 1; // Enable ADC3
    ADCCON3bits.DIGEN4 = 1; // Enable ADC3
    ADCCON3bits.DIGEN7 = 1; // Enable shared ADC
}

/* ------------------------------------------------------------ */
/***	convertWiFIREadcEF
**
**	Parameters:
**		channelNumber - The PIC32 analog channel number as in the PIC32 datasheet
**
**	Return Value:
**      The converted value for that channel
**
**	Errors:
**     If return value of zero and error may have occured
**
**	Description:
**      Coverts the analog signal to a digital value on the 
**      given pic32 analog channel number
*/
int convertWiFIREadcEF(uint8_t channelNumber)
{ 
    uint8_t vcn = channelNumber;        // assume our vitual channel number is the real one
    uint32_t adcTRGmode = ADCTRGMODE;   // save trigger mode

    // see if we are using alternate inputs
    switch(vcn)
    {
        case 43:
        case 44:
        case 50:
            return(0);
            break;

        case 45:
            ADCTRGMODEbits.SH0ALT = 1;
            vcn -= 45;
            break;

        case 46:
            ADCTRGMODEbits.SH1ALT = 1;
            vcn -= 45;
            break;

        case 47:
            ADCTRGMODEbits.SH2ALT = 1;
            vcn -= 45;
            break;

        case 48:
            ADCTRGMODEbits.SH3ALT = 1;
            vcn -= 45;
            break;

        case 49:
            ADCTRGMODEbits.SH4ALT = 1;
            vcn -= 45;
            break;

        default:
            break;
    }

    ADCCON3bits.ADINSEL   = vcn;            // say which channel to manually trigger
    ADCCON3bits.RQCNVRT  = 1;               // manually trigger it.

    // wait for completion of the conversion
    if(vcn < 32)
    {
        uint32_t mask = 0x1 << vcn;
        while((ADCDSTAT1 & mask) == 0);
    }
    else
    {
        uint32_t mask = 0x1 << (vcn - 32);
        while((ADCDSTAT2 & mask) == 0);
    }

    // return the trigger mode to what it was
    ADCTRGMODE = adcTRGmode;

    // return the converted data
    return((int) ((uint32_t *) &ADCDATA0)[vcn]);
}
