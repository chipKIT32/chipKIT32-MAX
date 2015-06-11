/************************************************************************/
/*                                                                      */
/*  EFADC.h   ADC code take directly from the Microchip                 */
/*              <proc/p32mz2048efg100.h> Headers.                       */
/*                                                                      */
/*-------------------------------------------------------------------------
 * PIC32MZ2048EFG100 processor header
 * Build date : May 01 2015
 *
 * Copyright (c) 2015, Microchip Technology Inc. and its subsidiaries ("Microchip")
 * All rights reserved.
 * 
 * This software is developed by Microchip Technology Inc. and its
 * subsidiaries ("Microchip").
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are 
 * met:
 * 
 * 1.      Redistributions of source code must retain the above copyright
 *         notice, this list of conditions and the following disclaimer.
 * 2.      Redistributions in binary form must reproduce the above 
 *         copyright notice, this list of conditions and the following 
 *         disclaimer in the documentation and/or other materials provided 
 *         with the distribution.
 * 3.      Microchip's name may not be used to endorse or promote products
 *         derived from this software without specific prior written 
 *         permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */
/************************************************************************/
/*  Modified by:     Keith Vogel    Digilent Inc.                       */
/************************************************************************/
/************************************************************************/
/*  Module Description:                                                 */
/*                                                                      */
/*      EF ADC header info to use with EC processors                    */
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*      6/9/2011(KeithV): Created                                       */
/*                                                                      */
/************************************************************************/

extern volatile unsigned int        ADCCON1 __attribute__((section("sfrs")));
typedef struct {
  unsigned :3;
  unsigned STRGLVL:1;
  unsigned IRQVS:3;
  unsigned :2;
  unsigned FSPBCLKEN:1;
  unsigned FSSCLKEN:1;
  unsigned CVDEN:1;
  unsigned AICPMPEN:1;
  unsigned SIDL:1;
  unsigned :1;
  unsigned ON:1;
  unsigned STRGSRC:5;
  unsigned SELRES:2;
  unsigned FRACT:1;
  unsigned TRBSLV:3;
  unsigned TRBMST:3;
  unsigned TRBERR:1;
  unsigned TRBEN:1;
} __ADCCON1bits_t;
extern volatile __ADCCON1bits_t ADCCON1bits __asm__ ("ADCCON1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCON2 __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned ADCEIS:3;
  unsigned :1;
  unsigned ADCEIOVR:1;
  unsigned EOSIEN:1;
  unsigned REFFLTIEN:1;
  unsigned BGVRIEN:1;
  unsigned SAMC:10;
  unsigned CVDCPL:3;
  unsigned EOSRDY:1;
  unsigned REFFLT:1;
  unsigned BGVRRDY:1;
} __ADCCON2bits_t;
extern volatile __ADCCON2bits_t ADCCON2bits __asm__ ("ADCCON2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCON3 __attribute__((section("sfrs")));
typedef struct {
  unsigned ADINSEL:6;
  unsigned GSWTRG:1;
  unsigned GLSWTRG:1;
  unsigned RQCNVRT:1;
  unsigned SAMP:1;
  unsigned UPDRDY:1;
  unsigned UPDIEN:1;
  unsigned TRGSUSP:1;
  unsigned VREFSEL:3;
  unsigned DIGEN0:1;
  unsigned DIGEN1:1;
  unsigned DIGEN2:1;
  unsigned DIGEN3:1;
  unsigned DIGEN4:1;
  unsigned :2;
  unsigned DIGEN7:1;
  unsigned CONCLKDIV:6;
  unsigned ADCSEL:2;
} __ADCCON3bits_t;
extern volatile __ADCCON3bits_t ADCCON3bits __asm__ ("ADCCON3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCTRGMODE __attribute__((section("sfrs")));
typedef struct {
  unsigned SSAMPEN0:1;
  unsigned SSAMPEN1:1;
  unsigned SSAMPEN2:1;
  unsigned SSAMPEN3:1;
  unsigned SSAMPEN4:1;
  unsigned :3;
  unsigned STRGEN0:1;
  unsigned STRGEN1:1;
  unsigned STRGEN2:1;
  unsigned STRGEN3:1;
  unsigned STRGEN4:1;
  unsigned :3;
  unsigned SH0ALT:2;
  unsigned SH1ALT:2;
  unsigned SH2ALT:2;
  unsigned SH3ALT:2;
  unsigned SH4ALT:2;
} __ADCTRGMODEbits_t;
extern volatile __ADCTRGMODEbits_t ADCTRGMODEbits __asm__ ("ADCTRGMODE") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCIMCON1 __attribute__((section("sfrs")));
typedef struct {
  unsigned SIGN0:1;
  unsigned DIFF0:1;
  unsigned SIGN1:1;
  unsigned DIFF1:1;
  unsigned SIGN2:1;
  unsigned DIFF2:1;
  unsigned SIGN3:1;
  unsigned DIFF3:1;
  unsigned SIGN4:1;
  unsigned DIFF4:1;
  unsigned SIGN5:1;
  unsigned DIFF5:1;
  unsigned SIGN6:1;
  unsigned DIFF6:1;
  unsigned SIGN7:1;
  unsigned DIFF7:1;
  unsigned SIGN8:1;
  unsigned DIFF8:1;
  unsigned SIGN9:1;
  unsigned DIFF9:1;
  unsigned SIGN10:1;
  unsigned DIFF10:1;
  unsigned SIGN11:1;
  unsigned DIFF11:1;
  unsigned SIGN12:1;
  unsigned DIFF12:1;
  unsigned SIGN13:1;
  unsigned DIFF13:1;
  unsigned SIGN14:1;
  unsigned DIFF14:1;
  unsigned SIGN15:1;
  unsigned DIFF15:1;
} __ADCIMCON1bits_t;
extern volatile __ADCIMCON1bits_t ADCIMCON1bits __asm__ ("ADCIMCON1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCIMCON2 __attribute__((section("sfrs")));
typedef struct {
  unsigned SIGN16:1;
  unsigned DIFF16:1;
  unsigned SIGN17:1;
  unsigned DIFF17:1;
  unsigned SIGN18:1;
  unsigned DIFF18:1;
  unsigned SIGN19:1;
  unsigned DIFF19:1;
  unsigned SIGN20:1;
  unsigned DIFF20:1;
  unsigned SIGN21:1;
  unsigned DIFF21:1;
  unsigned SIGN22:1;
  unsigned DIFF22:1;
  unsigned SIGN23:1;
  unsigned DIFF23:1;
  unsigned SIGN24:1;
  unsigned DIFF24:1;
  unsigned SIGN25:1;
  unsigned DIFF25:1;
  unsigned SIGN26:1;
  unsigned DIFF26:1;
  unsigned SIGN27:1;
  unsigned DIFF27:1;
  unsigned SIGN28:1;
  unsigned DIFF28:1;
  unsigned SIGN29:1;
  unsigned DIFF29:1;
  unsigned SIGN30:1;
  unsigned DIFF30:1;
  unsigned SIGN31:1;
  unsigned DIFF31:1;
} __ADCIMCON2bits_t;
extern volatile __ADCIMCON2bits_t ADCIMCON2bits __asm__ ("ADCIMCON2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCIMCON3 __attribute__((section("sfrs")));
typedef struct {
  unsigned SIGN32:1;
  unsigned DIFF32:1;
  unsigned SIGN33:1;
  unsigned DIFF33:1;
  unsigned SIGN34:1;
  unsigned DIFF34:1;
  unsigned SIGN35:1;
  unsigned DIFF35:1;
  unsigned SIGN36:1;
  unsigned DIFF36:1;
  unsigned SIGN37:1;
  unsigned DIFF37:1;
  unsigned SIGN38:1;
  unsigned DIFF38:1;
  unsigned SIGN39:1;
  unsigned DIFF39:1;
  unsigned SIGN40:1;
  unsigned DIFF40:1;
  unsigned SIGN41:1;
  unsigned DIFF41:1;
  unsigned SIGN42:1;
  unsigned DIFF42:1;
  unsigned SIGN43:1;
  unsigned DIFF43:1;
  unsigned SIGN44:1;
  unsigned DIFF44:1;
} __ADCIMCON3bits_t;
extern volatile __ADCIMCON3bits_t ADCIMCON3bits __asm__ ("ADCIMCON3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCGIRQEN1 __attribute__((section("sfrs")));
typedef struct {
  unsigned AGIEN0:1;
  unsigned AGIEN1:1;
  unsigned AGIEN2:1;
  unsigned AGIEN3:1;
  unsigned AGIEN4:1;
  unsigned AGIEN5:1;
  unsigned AGIEN6:1;
  unsigned AGIEN7:1;
  unsigned AGIEN8:1;
  unsigned AGIEN9:1;
  unsigned AGIEN10:1;
  unsigned AGIEN11:1;
  unsigned AGIEN12:1;
  unsigned AGIEN13:1;
  unsigned AGIEN14:1;
  unsigned AGIEN15:1;
  unsigned AGIEN16:1;
  unsigned AGIEN17:1;
  unsigned AGIEN18:1;
  unsigned AGIEN19:1;
  unsigned AGIEN20:1;
  unsigned AGIEN21:1;
  unsigned AGIEN22:1;
  unsigned AGIEN23:1;
  unsigned AGIEN24:1;
  unsigned AGIEN25:1;
  unsigned AGIEN26:1;
  unsigned AGIEN27:1;
  unsigned AGIEN28:1;
  unsigned AGIEN29:1;
  unsigned AGIEN30:1;
  unsigned AGIEN31:1;
} __ADCGIRQEN1bits_t;
extern volatile __ADCGIRQEN1bits_t ADCGIRQEN1bits __asm__ ("ADCGIRQEN1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCGIRQEN2 __attribute__((section("sfrs")));
typedef struct {
  unsigned AGIEN32:1;
  unsigned AGIEN33:1;
  unsigned AGIEN34:1;
  unsigned AGIEN35:1;
  unsigned AGIEN36:1;
  unsigned AGIEN37:1;
  unsigned AGIEN38:1;
  unsigned AGIEN39:1;
  unsigned AGIEN40:1;
  unsigned AGIEN41:1;
  unsigned AGIEN42:1;
  unsigned AGIEN43:1;
  unsigned AGIEN44:1;
} __ADCGIRQEN2bits_t;
extern volatile __ADCGIRQEN2bits_t ADCGIRQEN2bits __asm__ ("ADCGIRQEN2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCSS1 __attribute__((section("sfrs")));
typedef struct {
  unsigned CSS0:1;
  unsigned CSS1:1;
  unsigned CSS2:1;
  unsigned CSS3:1;
  unsigned CSS4:1;
  unsigned CSS5:1;
  unsigned CSS6:1;
  unsigned CSS7:1;
  unsigned CSS8:1;
  unsigned CSS9:1;
  unsigned CSS10:1;
  unsigned CSS11:1;
  unsigned CSS12:1;
  unsigned CSS13:1;
  unsigned CSS14:1;
  unsigned CSS15:1;
  unsigned CSS16:1;
  unsigned CSS17:1;
  unsigned CSS18:1;
  unsigned CSS19:1;
  unsigned CSS20:1;
  unsigned CSS21:1;
  unsigned CSS22:1;
  unsigned CSS23:1;
  unsigned CSS24:1;
  unsigned CSS25:1;
  unsigned CSS26:1;
  unsigned CSS27:1;
  unsigned CSS28:1;
  unsigned CSS29:1;
  unsigned CSS30:1;
  unsigned CSS31:1;
} __ADCCSS1bits_t;
extern volatile __ADCCSS1bits_t ADCCSS1bits __asm__ ("ADCCSS1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCSS2 __attribute__((section("sfrs")));
typedef struct {
  unsigned CSS32:1;
  unsigned CSS33:1;
  unsigned CSS34:1;
  unsigned CSS35:1;
  unsigned CSS36:1;
  unsigned CSS37:1;
  unsigned CSS38:1;
  unsigned CSS39:1;
  unsigned CSS40:1;
  unsigned CSS41:1;
  unsigned CSS42:1;
  unsigned CSS43:1;
  unsigned CSS44:1;
} __ADCCSS2bits_t;
extern volatile __ADCCSS2bits_t ADCCSS2bits __asm__ ("ADCCSS2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDSTAT1 __attribute__((section("sfrs")));
typedef struct {
  unsigned ARDY0:1;
  unsigned ARDY1:1;
  unsigned ARDY2:1;
  unsigned ARDY3:1;
  unsigned ARDY4:1;
  unsigned ARDY5:1;
  unsigned ARDY6:1;
  unsigned ARDY7:1;
  unsigned ARDY8:1;
  unsigned ARDY9:1;
  unsigned ARDY10:1;
  unsigned ARDY11:1;
  unsigned ARDY12:1;
  unsigned ARDY13:1;
  unsigned ARDY14:1;
  unsigned ARDY15:1;
  unsigned ARDY16:1;
  unsigned ARDY17:1;
  unsigned ARDY18:1;
  unsigned ARDY19:1;
  unsigned ARDY20:1;
  unsigned ARDY21:1;
  unsigned ARDY22:1;
  unsigned ARDY23:1;
  unsigned ARDY24:1;
  unsigned ARDY25:1;
  unsigned ARDY26:1;
  unsigned ARDY27:1;
  unsigned ARDY28:1;
  unsigned ARDY29:1;
  unsigned ARDY30:1;
  unsigned ARDY31:1;
} __ADCDSTAT1bits_t;
extern volatile __ADCDSTAT1bits_t ADCDSTAT1bits __asm__ ("ADCDSTAT1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDSTAT2 __attribute__((section("sfrs")));
typedef struct {
  unsigned ARDY32:1;
  unsigned ARDY33:1;
  unsigned ARDY34:1;
  unsigned ARDY35:1;
  unsigned ARDY36:1;
  unsigned ARDY37:1;
  unsigned ARDY38:1;
  unsigned ARDY39:1;
  unsigned ARDY40:1;
  unsigned ARDY41:1;
  unsigned ARDY42:1;
  unsigned ARDY43:1;
  unsigned ARDY44:1;
} __ADCDSTAT2bits_t;
extern volatile __ADCDSTAT2bits_t ADCDSTAT2bits __asm__ ("ADCDSTAT2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN1 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN1bits_t;
extern volatile __ADCCMPEN1bits_t ADCCMPEN1bits __asm__ ("ADCCMPEN1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP1 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP1bits_t;
extern volatile __ADCCMP1bits_t ADCCMP1bits __asm__ ("ADCCMP1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN2 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN2bits_t;
extern volatile __ADCCMPEN2bits_t ADCCMPEN2bits __asm__ ("ADCCMPEN2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP2 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP2bits_t;
extern volatile __ADCCMP2bits_t ADCCMP2bits __asm__ ("ADCCMP2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN3 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN3bits_t;
extern volatile __ADCCMPEN3bits_t ADCCMPEN3bits __asm__ ("ADCCMPEN3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP3 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP3bits_t;
extern volatile __ADCCMP3bits_t ADCCMP3bits __asm__ ("ADCCMP3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN4 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN4bits_t;
extern volatile __ADCCMPEN4bits_t ADCCMPEN4bits __asm__ ("ADCCMPEN4") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP4 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP4bits_t;
extern volatile __ADCCMP4bits_t ADCCMP4bits __asm__ ("ADCCMP4") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN5 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN5bits_t;
extern volatile __ADCCMPEN5bits_t ADCCMPEN5bits __asm__ ("ADCCMPEN5") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP5 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP5bits_t;
extern volatile __ADCCMP5bits_t ADCCMP5bits __asm__ ("ADCCMP5") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPEN6 __attribute__((section("sfrs")));
typedef struct {
  unsigned CMPE0:1;
  unsigned CMPE1:1;
  unsigned CMPE2:1;
  unsigned CMPE3:1;
  unsigned CMPE4:1;
  unsigned CMPE5:1;
  unsigned CMPE6:1;
  unsigned CMPE7:1;
  unsigned CMPE8:1;
  unsigned CMPE9:1;
  unsigned CMPE10:1;
  unsigned CMPE11:1;
  unsigned CMPE12:1;
  unsigned CMPE13:1;
  unsigned CMPE14:1;
  unsigned CMPE15:1;
  unsigned CMPE16:1;
  unsigned CMPE17:1;
  unsigned CMPE18:1;
  unsigned CMPE19:1;
  unsigned CMPE20:1;
  unsigned CMPE21:1;
  unsigned CMPE22:1;
  unsigned CMPE23:1;
  unsigned CMPE24:1;
  unsigned CMPE25:1;
  unsigned CMPE26:1;
  unsigned CMPE27:1;
  unsigned CMPE28:1;
  unsigned CMPE29:1;
  unsigned CMPE30:1;
  unsigned CMPE31:1;
} __ADCCMPEN6bits_t;
extern volatile __ADCCMPEN6bits_t ADCCMPEN6bits __asm__ ("ADCCMPEN6") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMP6 __attribute__((section("sfrs")));
typedef struct {
  unsigned DCMPLO:16;
  unsigned DCMPHI:16;
} __ADCCMP6bits_t;
extern volatile __ADCCMP6bits_t ADCCMP6bits __asm__ ("ADCCMP6") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR1 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR1bits_t;
extern volatile __ADCFLTR1bits_t ADCFLTR1bits __asm__ ("ADCFLTR1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR2 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR2bits_t;
extern volatile __ADCFLTR2bits_t ADCFLTR2bits __asm__ ("ADCFLTR2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR3 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR3bits_t;
extern volatile __ADCFLTR3bits_t ADCFLTR3bits __asm__ ("ADCFLTR3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR4 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR4bits_t;
extern volatile __ADCFLTR4bits_t ADCFLTR4bits __asm__ ("ADCFLTR4") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR5 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR5bits_t;
extern volatile __ADCFLTR5bits_t ADCFLTR5bits __asm__ ("ADCFLTR5") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCFLTR6 __attribute__((section("sfrs")));
typedef struct {
  unsigned FLTRDATA:16;
  unsigned CHNLID:5;
  unsigned :3;
  unsigned AFRDY:1;
  unsigned AFGIEN:1;
  unsigned OVRSAM:3;
  unsigned DFMODE:1;
  unsigned DATA16EN:1;
  unsigned AFEN:1;
} __ADCFLTR6bits_t;
extern volatile __ADCFLTR6bits_t ADCFLTR6bits __asm__ ("ADCFLTR6") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCTRG1 __attribute__((section("sfrs")));
typedef struct {
  unsigned TRGSRC0:5;
  unsigned :3;
  unsigned TRGSRC1:5;
  unsigned :3;
  unsigned TRGSRC2:5;
  unsigned :3;
  unsigned TRGSRC3:5;
} __ADCTRG1bits_t;
extern volatile __ADCTRG1bits_t ADCTRG1bits __asm__ ("ADCTRG1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCTRG2 __attribute__((section("sfrs")));
typedef struct {
  unsigned TRGSRC4:5;
  unsigned :3;
  unsigned TRGSRC5:5;
  unsigned :3;
  unsigned TRGSRC6:5;
  unsigned :3;
  unsigned TRGSRC7:5;
} __ADCTRG2bits_t;
extern volatile __ADCTRG2bits_t ADCTRG2bits __asm__ ("ADCTRG2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCTRG3 __attribute__((section("sfrs")));
typedef struct {
  unsigned TRGSRC8:5;
  unsigned :3;
  unsigned TRGSRC9:5;
  unsigned :3;
  unsigned TRGSRC10:5;
  unsigned :3;
  unsigned TRGSRC11:5;
} __ADCTRG3bits_t;
extern volatile __ADCTRG3bits_t ADCTRG3bits __asm__ ("ADCTRG3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON1 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:6;
  unsigned :2;
  unsigned CVDDATA:16;
} __ADCCMPCON1bits_t;
extern volatile __ADCCMPCON1bits_t ADCCMPCON1bits __asm__ ("ADCCMPCON1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON2 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:5;
} __ADCCMPCON2bits_t;
extern volatile __ADCCMPCON2bits_t ADCCMPCON2bits __asm__ ("ADCCMPCON2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON3 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:5;
} __ADCCMPCON3bits_t;
extern volatile __ADCCMPCON3bits_t ADCCMPCON3bits __asm__ ("ADCCMPCON3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON4 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:5;
} __ADCCMPCON4bits_t;
extern volatile __ADCCMPCON4bits_t ADCCMPCON4bits __asm__ ("ADCCMPCON4") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON5 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:5;
} __ADCCMPCON5bits_t;
extern volatile __ADCCMPCON5bits_t ADCCMPCON5bits __asm__ ("ADCCMPCON5") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCCMPCON6 __attribute__((section("sfrs")));
typedef struct {
  unsigned IELOLO:1;
  unsigned IELOHI:1;
  unsigned IEHILO:1;
  unsigned IEHIHI:1;
  unsigned IEBTWN:1;
  unsigned DCMPED:1;
  unsigned DCMPGIEN:1;
  unsigned ENDCMP:1;
  unsigned AINID:5;
} __ADCCMPCON6bits_t;
extern volatile __ADCCMPCON6bits_t ADCCMPCON6bits __asm__ ("ADCCMPCON6") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCBASE __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCBASE:16;
} __ADCBASEbits_t;
extern volatile __ADCBASEbits_t ADCBASEbits __asm__ ("ADCBASE") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCTRGSNS __attribute__((section("sfrs")));
typedef struct {
  unsigned LVL0:1;
  unsigned LVL1:1;
  unsigned LVL2:1;
  unsigned LVL3:1;
  unsigned LVL4:1;
  unsigned LVL5:1;
  unsigned LVL6:1;
  unsigned LVL7:1;
  unsigned LVL8:1;
  unsigned LVL9:1;
  unsigned LVL10:1;
  unsigned LVL11:1;
} __ADCTRGSNSbits_t;
extern volatile __ADCTRGSNSbits_t ADCTRGSNSbits __asm__ ("ADCTRGSNS") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC0TIME __attribute__((section("sfrs")));
typedef struct {
  unsigned SAMC:10;
  unsigned :6;
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned SELRES:2;
  unsigned ADCEIS:3;
} __ADC0TIMEbits_t;
extern volatile __ADC0TIMEbits_t ADC0TIMEbits __asm__ ("ADC0TIME") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC1TIME __attribute__((section("sfrs")));
typedef struct {
  unsigned SAMC:10;
  unsigned :6;
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned SELRES:2;
  unsigned ADCEIS:3;
} __ADC1TIMEbits_t;
extern volatile __ADC1TIMEbits_t ADC1TIMEbits __asm__ ("ADC1TIME") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC2TIME __attribute__((section("sfrs")));
typedef struct {
  unsigned SAMC:10;
  unsigned :6;
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned SELRES:2;
  unsigned ADCEIS:3;
} __ADC2TIMEbits_t;
extern volatile __ADC2TIMEbits_t ADC2TIMEbits __asm__ ("ADC2TIME") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC3TIME __attribute__((section("sfrs")));
typedef struct {
  unsigned SAMC:10;
  unsigned :6;
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned SELRES:2;
  unsigned ADCEIS:3;
} __ADC3TIMEbits_t;
extern volatile __ADC3TIMEbits_t ADC3TIMEbits __asm__ ("ADC3TIME") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC4TIME __attribute__((section("sfrs")));
typedef struct {
  unsigned SAMC:10;
  unsigned :6;
  unsigned ADCDIV:7;
  unsigned :1;
  unsigned SELRES:2;
  unsigned ADCEIS:3;
} __ADC4TIMEbits_t;
extern volatile __ADC4TIMEbits_t ADC4TIMEbits __asm__ ("ADC4TIME") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCEIEN1 __attribute__((section("sfrs")));
typedef struct {
  unsigned EIEN0:1;
  unsigned EIEN1:1;
  unsigned EIEN2:1;
  unsigned EIEN3:1;
  unsigned EIEN4:1;
  unsigned EIEN5:1;
  unsigned EIEN6:1;
  unsigned EIEN7:1;
  unsigned EIEN8:1;
  unsigned EIEN9:1;
  unsigned EIEN10:1;
  unsigned EIEN11:1;
  unsigned EIEN12:1;
  unsigned EIEN13:1;
  unsigned EIEN14:1;
  unsigned EIEN15:1;
  unsigned EIEN16:1;
  unsigned EIEN17:1;
  unsigned EIEN18:1;
  unsigned EIEN19:1;
  unsigned EIEN20:1;
  unsigned EIEN21:1;
  unsigned EIEN22:1;
  unsigned EIEN23:1;
  unsigned EIEN24:1;
  unsigned EIEN25:1;
  unsigned EIEN26:1;
  unsigned EIEN27:1;
  unsigned EIEN28:1;
  unsigned EIEN29:1;
  unsigned EIEN30:1;
  unsigned EIEN31:1;
} __ADCEIEN1bits_t;
extern volatile __ADCEIEN1bits_t ADCEIEN1bits __asm__ ("ADCEIEN1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCEIEN2 __attribute__((section("sfrs")));
typedef struct {
  unsigned EIEN32:1;
  unsigned EIEN33:1;
  unsigned EIEN34:1;
  unsigned EIEN35:1;
  unsigned EIEN36:1;
  unsigned EIEN37:1;
  unsigned EIEN38:1;
  unsigned EIEN39:1;
  unsigned EIEN40:1;
  unsigned EIEN41:1;
  unsigned EIEN42:1;
  unsigned EIEN43:1;
  unsigned EIEN44:1;
} __ADCEIEN2bits_t;
extern volatile __ADCEIEN2bits_t ADCEIEN2bits __asm__ ("ADCEIEN2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCEISTAT1 __attribute__((section("sfrs")));
typedef struct {
  unsigned EIRDY0:1;
  unsigned EIRDY1:1;
  unsigned EIRDY2:1;
  unsigned EIRDY3:1;
  unsigned EIRDY4:1;
  unsigned EIRDY5:1;
  unsigned EIRDY6:1;
  unsigned EIRDY7:1;
  unsigned EIRDY8:1;
  unsigned EIRDY9:1;
  unsigned EIRDY10:1;
  unsigned EIRDY11:1;
  unsigned EIRDY12:1;
  unsigned EIRDY13:1;
  unsigned EIRDY14:1;
  unsigned EIRDY15:1;
  unsigned EIRDY16:1;
  unsigned EIRDY17:1;
  unsigned EIRDY18:1;
  unsigned EIRDY19:1;
  unsigned EIRDY20:1;
  unsigned EIRDY21:1;
  unsigned EIRDY22:1;
  unsigned EIRDY23:1;
  unsigned EIRDY24:1;
  unsigned EIRDY25:1;
  unsigned EIRDY26:1;
  unsigned EIRDY27:1;
  unsigned EIRDY28:1;
  unsigned EIRDY29:1;
  unsigned EIRDY30:1;
  unsigned EIRDY31:1;
} __ADCEISTAT1bits_t;
extern volatile __ADCEISTAT1bits_t ADCEISTAT1bits __asm__ ("ADCEISTAT1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCEISTAT2 __attribute__((section("sfrs")));
typedef struct {
  unsigned EIRDY32:1;
  unsigned EIRDY33:1;
  unsigned EIRDY34:1;
  unsigned EIRDY35:1;
  unsigned EIRDY36:1;
  unsigned EIRDY37:1;
  unsigned EIRDY38:1;
  unsigned EIRDY39:1;
  unsigned EIRDY40:1;
  unsigned EIRDY41:1;
  unsigned EIRDY42:1;
  unsigned EIRDY43:1;
  unsigned EIRDY44:1;
} __ADCEISTAT2bits_t;
extern volatile __ADCEISTAT2bits_t ADCEISTAT2bits __asm__ ("ADCEISTAT2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCANCON __attribute__((section("sfrs")));
typedef struct {
  unsigned ANEN0:1;
  unsigned ANEN1:1;
  unsigned ANEN2:1;
  unsigned ANEN3:1;
  unsigned ANEN4:1;
  unsigned :2;
  unsigned ANEN7:1;
  unsigned WKRDY0:1;
  unsigned WKRDY1:1;
  unsigned WKRDY2:1;
  unsigned WKRDY3:1;
  unsigned WKRDY4:1;
  unsigned :2;
  unsigned WKRDY7:1;
  unsigned WKIEN0:1;
  unsigned WKIEN1:1;
  unsigned WKIEN2:1;
  unsigned WKIEN3:1;
  unsigned WKIEN4:1;
  unsigned :2;
  unsigned WKIEN7:1;
  unsigned WKUPCLKCNT:4;
} __ADCANCONbits_t;
extern volatile __ADCANCONbits_t ADCANCONbits __asm__ ("ADCANCON") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC0CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC0CFGbits_t;
extern volatile __ADC0CFGbits_t ADC0CFGbits __asm__ ("ADC0CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC1CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC1CFGbits_t;
extern volatile __ADC1CFGbits_t ADC1CFGbits __asm__ ("ADC1CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC2CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC2CFGbits_t;
extern volatile __ADC2CFGbits_t ADC2CFGbits __asm__ ("ADC2CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC3CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC3CFGbits_t;
extern volatile __ADC3CFGbits_t ADC3CFGbits __asm__ ("ADC3CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC4CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC4CFGbits_t;
extern volatile __ADC4CFGbits_t ADC4CFGbits __asm__ ("ADC4CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADC7CFG __attribute__((section("sfrs")));
typedef struct {
  unsigned ADCCFG:32;
} __ADC7CFGbits_t;
extern volatile __ADC7CFGbits_t ADC7CFGbits __asm__ ("ADC7CFG") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCSYSCFG0 __attribute__((section("sfrs")));
typedef struct {
  unsigned AN0:1;
  unsigned AN1:1;
  unsigned AN2:1;
  unsigned AN3:1;
  unsigned AN4:1;
  unsigned AN5:1;
  unsigned AN6:1;
  unsigned AN7:1;
  unsigned AN8:1;
  unsigned AN9:1;
  unsigned AN10:1;
  unsigned AN11:1;
  unsigned AN12:1;
  unsigned AN13:1;
  unsigned AN14:1;
  unsigned AN15:1;
  unsigned AN16:1;
  unsigned AN17:1;
  unsigned AN18:1;
  unsigned AN19:1;
  unsigned AN20:1;
  unsigned AN21:1;
  unsigned AN22:1;
  unsigned AN23:1;
  unsigned AN24:1;
  unsigned AN25:1;
  unsigned AN26:1;
  unsigned AN27:1;
  unsigned AN28:1;
  unsigned AN29:1;
  unsigned AN30:1;
  unsigned AN31:1;
} __ADCSYSCFG0bits_t;
extern volatile __ADCSYSCFG0bits_t ADCSYSCFG0bits __asm__ ("ADCSYSCFG0") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCSYSCFG1 __attribute__((section("sfrs")));
typedef struct {
  unsigned AN32:1;
  unsigned AN33:1;
  unsigned AN34:1;
  unsigned AN35:1;
  unsigned AN36:1;
  unsigned AN37:1;
  unsigned AN38:1;
  unsigned AN39:1;
  unsigned AN40:1;
  unsigned AN41:1;
  unsigned AN42:1;
  unsigned AN43:1;
  unsigned AN44:1;
  unsigned AN45:1;
  unsigned AN46:1;
  unsigned AN47:1;
  unsigned AN48:1;
  unsigned AN49:1;
  unsigned AN50:1;
  unsigned AN51:1;
  unsigned AN52:1;
  unsigned AN53:1;
  unsigned AN54:1;
  unsigned AN55:1;
  unsigned AN56:1;
  unsigned AN57:1;
  unsigned AN58:1;
  unsigned AN59:1;
  unsigned AN60:1;
  unsigned AN61:1;
  unsigned AN62:1;
  unsigned AN63:1;
} __ADCSYSCFG1bits_t;
extern volatile __ADCSYSCFG1bits_t ADCSYSCFG1bits __asm__ ("ADCSYSCFG1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA0 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA0bits_t;
extern volatile __ADCDATA0bits_t ADCDATA0bits __asm__ ("ADCDATA0") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA1 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA1bits_t;
extern volatile __ADCDATA1bits_t ADCDATA1bits __asm__ ("ADCDATA1") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA2 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA2bits_t;
extern volatile __ADCDATA2bits_t ADCDATA2bits __asm__ ("ADCDATA2") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA3 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA3bits_t;
extern volatile __ADCDATA3bits_t ADCDATA3bits __asm__ ("ADCDATA3") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA4 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA4bits_t;
extern volatile __ADCDATA4bits_t ADCDATA4bits __asm__ ("ADCDATA4") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA5 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA5bits_t;
extern volatile __ADCDATA5bits_t ADCDATA5bits __asm__ ("ADCDATA5") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA6 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA6bits_t;
extern volatile __ADCDATA6bits_t ADCDATA6bits __asm__ ("ADCDATA6") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA7 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA7bits_t;
extern volatile __ADCDATA7bits_t ADCDATA7bits __asm__ ("ADCDATA7") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA8 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA8bits_t;
extern volatile __ADCDATA8bits_t ADCDATA8bits __asm__ ("ADCDATA8") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA9 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA9bits_t;
extern volatile __ADCDATA9bits_t ADCDATA9bits __asm__ ("ADCDATA9") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA10 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA10bits_t;
extern volatile __ADCDATA10bits_t ADCDATA10bits __asm__ ("ADCDATA10") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA11 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA11bits_t;
extern volatile __ADCDATA11bits_t ADCDATA11bits __asm__ ("ADCDATA11") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA12 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA12bits_t;
extern volatile __ADCDATA12bits_t ADCDATA12bits __asm__ ("ADCDATA12") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA13 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA13bits_t;
extern volatile __ADCDATA13bits_t ADCDATA13bits __asm__ ("ADCDATA13") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA14 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA14bits_t;
extern volatile __ADCDATA14bits_t ADCDATA14bits __asm__ ("ADCDATA14") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA15 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA15bits_t;
extern volatile __ADCDATA15bits_t ADCDATA15bits __asm__ ("ADCDATA15") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA16 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA16bits_t;
extern volatile __ADCDATA16bits_t ADCDATA16bits __asm__ ("ADCDATA16") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA17 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA17bits_t;
extern volatile __ADCDATA17bits_t ADCDATA17bits __asm__ ("ADCDATA17") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA18 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA18bits_t;
extern volatile __ADCDATA18bits_t ADCDATA18bits __asm__ ("ADCDATA18") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA19 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA19bits_t;
extern volatile __ADCDATA19bits_t ADCDATA19bits __asm__ ("ADCDATA19") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA20 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA20bits_t;
extern volatile __ADCDATA20bits_t ADCDATA20bits __asm__ ("ADCDATA20") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA21 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA21bits_t;
extern volatile __ADCDATA21bits_t ADCDATA21bits __asm__ ("ADCDATA21") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA22 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA22bits_t;
extern volatile __ADCDATA22bits_t ADCDATA22bits __asm__ ("ADCDATA22") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA23 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA23bits_t;
extern volatile __ADCDATA23bits_t ADCDATA23bits __asm__ ("ADCDATA23") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA24 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA24bits_t;
extern volatile __ADCDATA24bits_t ADCDATA24bits __asm__ ("ADCDATA24") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA25 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA25bits_t;
extern volatile __ADCDATA25bits_t ADCDATA25bits __asm__ ("ADCDATA25") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA26 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA26bits_t;
extern volatile __ADCDATA26bits_t ADCDATA26bits __asm__ ("ADCDATA26") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA27 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA27bits_t;
extern volatile __ADCDATA27bits_t ADCDATA27bits __asm__ ("ADCDATA27") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA28 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA28bits_t;
extern volatile __ADCDATA28bits_t ADCDATA28bits __asm__ ("ADCDATA28") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA29 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA29bits_t;
extern volatile __ADCDATA29bits_t ADCDATA29bits __asm__ ("ADCDATA29") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA30 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA30bits_t;
extern volatile __ADCDATA30bits_t ADCDATA30bits __asm__ ("ADCDATA30") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA31 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA31bits_t;
extern volatile __ADCDATA31bits_t ADCDATA31bits __asm__ ("ADCDATA31") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA32 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA32bits_t;
extern volatile __ADCDATA32bits_t ADCDATA32bits __asm__ ("ADCDATA32") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA33 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA33bits_t;
extern volatile __ADCDATA33bits_t ADCDATA33bits __asm__ ("ADCDATA33") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA34 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA34bits_t;
extern volatile __ADCDATA34bits_t ADCDATA34bits __asm__ ("ADCDATA34") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA43 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA43bits_t;
extern volatile __ADCDATA43bits_t ADCDATA43bits __asm__ ("ADCDATA43") __attribute__((section("sfrs")));
extern volatile unsigned int        ADCDATA44 __attribute__((section("sfrs")));
typedef struct {
  unsigned DATA:32;
} __ADCDATA44bits_t;
extern volatile __ADCDATA44bits_t ADCDATA44bits __asm__ ("ADCDATA44") __attribute__((section("sfrs")));

#define _ADC_VECTOR                              44
#define _ADC_DC1_VECTOR                          46
#define _ADC_DC2_VECTOR                          47
#define _ADC_DC3_VECTOR                          48
#define _ADC_DC4_VECTOR                          49
#define _ADC_DC5_VECTOR                          50
#define _ADC_DC6_VECTOR                          51
#define _ADC_DF1_VECTOR                          52
#define _ADC_DF2_VECTOR                          53
#define _ADC_DF3_VECTOR                          54
#define _ADC_DF4_VECTOR                          55
#define _ADC_DF5_VECTOR                          56
#define _ADC_DF6_VECTOR                          57
#define _ADC_FAULT_VECTOR                        58
#define _ADC_DATA0_VECTOR                        59
#define _ADC_DATA1_VECTOR                        60
#define _ADC_DATA2_VECTOR                        61
#define _ADC_DATA3_VECTOR                        62
#define _ADC_DATA4_VECTOR                        63
#define _ADC_DATA5_VECTOR                        64
#define _ADC_DATA6_VECTOR                        65
#define _ADC_DATA7_VECTOR                        66
#define _ADC_DATA8_VECTOR                        67
#define _ADC_DATA9_VECTOR                        68
#define _ADC_DATA10_VECTOR                       69
#define _ADC_DATA11_VECTOR                       70
#define _ADC_DATA12_VECTOR                       71
#define _ADC_DATA13_VECTOR                       72
#define _ADC_DATA14_VECTOR                       73
#define _ADC_DATA15_VECTOR                       74
#define _ADC_DATA16_VECTOR                       75
#define _ADC_DATA17_VECTOR                       76
#define _ADC_DATA18_VECTOR                       77
#define _ADC_DATA19_VECTOR                       78
#define _ADC_DATA20_VECTOR                       79
#define _ADC_DATA21_VECTOR                       80
#define _ADC_DATA22_VECTOR                       81
#define _ADC_DATA23_VECTOR                       82
#define _ADC_DATA24_VECTOR                       83
#define _ADC_DATA25_VECTOR                       84
#define _ADC_DATA26_VECTOR                       85
#define _ADC_DATA27_VECTOR                       86
#define _ADC_DATA28_VECTOR                       87
#define _ADC_DATA29_VECTOR                       88
#define _ADC_DATA30_VECTOR                       89
#define _ADC_DATA31_VECTOR                       90
#define _ADC_DATA32_VECTOR                       91
#define _ADC_DATA33_VECTOR                       92
#define _ADC_DATA34_VECTOR                       93
#define _ADC_DATA43_VECTOR                       102
#define _ADC_DATA44_VECTOR                       103



