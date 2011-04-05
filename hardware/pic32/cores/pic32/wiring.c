//************************************************************************
//*	wiring.c
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010 by Mark Sproul
//*	
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*	See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA	02111-1307	USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 15,	2010	<MLS> Master interrupts working to generate millis()
//************************************************************************
#include <plib.h>
#include <p32xxxx.h>

#include "wiring_private.h"

//*	as per Al.Rodriguez@microchip.com, Jan 7, 2011
//*	Add the following so the secondary oscillator is disabled and the port can be used as an IO PORT.
//#pragma config FSOSCEN = OFF

//#pragma config POSCMOD=XT, FNOSC=PRIPLL
//#pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
//#pragma config FPBDIV=DIV_2, FWDTEN=OFF, CP=OFF, BWP=OFF


#pragma config FPLLODIV = DIV_1, FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FWDTEN = OFF, FCKSM = CSECME, FPBDIV = DIV_1
#pragma config OSCIOFNC = ON, POSCMOD = XT, FSOSCEN = OFF, FNOSC = PRIPLL
#pragma config CP = OFF, BWP = OFF, PWP = OFF


//************************************************************************
//*	globals
unsigned int	__PIC32_pbClk;



// the prescaler is set so that timer0 ticks every 64 clock cycles, and the
// the overflow handler is called every 256 ticks.
#define MICROSECONDS_PER_TIMER0_OVERFLOW (clockCyclesToMicroseconds(64 * 256))

// the whole number of milliseconds per timer0 overflow
#define MILLIS_INC (MICROSECONDS_PER_TIMER0_OVERFLOW / 1000)

// the fractional number of milliseconds per timer0 overflow. we shift right
// by three to fit these numbers into a byte. (for the clock speeds we care
// about - 8 and 16 MHz - this doesn't lose precision.)
#define FRACT_INC ((MICROSECONDS_PER_TIMER0_OVERFLOW % 1000) >> 3)
#define FRACT_MAX (1000 >> 3)

//volatile unsigned long timer0_overflow_count = 0;
volatile unsigned long timer0_millis = 0;
//static unsigned char timer0_fract = 0;

//************************************************************************
unsigned long millis()
{
	return(timer0_millis);
}

//************************************************************************
unsigned long micros()
{
//*	not finished
	return(timer0_millis);
}



//#define mCTClearIntFlag()					(IFS0CLR = _IFS0_CTIF_MASK)
//#define mCTGetIntFlag()					 (IFS0bits.CTIF)
//#define GetSystemClock() (80000000ul)
//************************************************************************
void delay(unsigned long ms)
{
unsigned long	startMillis;

	startMillis	=	timer0_millis;
	while ((timer0_millis - startMillis) < ms)
	{
		//*	do nothing
	}
}

//************************************************************************
/* Delay for the given number of microseconds. Assumes a 8 or 16 MHz clock. */
void delayMicroseconds(unsigned int us)
{
	delay(1);
/*
long	ii;
long	qq;

	//*	for now
	qq	=	0;
	for (ii=0; ii<10000; ii++)
	{
		qq	+=	ii;
		if (qq > 100000)
		{
			ii	+=	2;
		}
	}
*/
}


//************************************************************************
// Let compile time pre-processor calculate the CORE_TICK_PERIOD
//	clock rate is 80000000ull
#define TOGGLES_PER_SEC			1000
#define CORE_TICK_RATE			(F_CPU / 2 / TOGGLES_PER_SEC)


//************************************************************************
void init()
{

#ifdef _ENABLE_PIC_RTC_
	// Configure the device for maximum performance but do not change the PBDIV
	// Given the options, this function will change the flash wait states, RAM
	// wait state and enable prefetch cache but will not change the PBDIV.
	// The PBDIV value is already set via the pragma FPBDIV option above..
	__PIC32_pbClk	=	SYSTEMConfig(F_CPU, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
#else
	__PIC32_pbClk	=	SYSTEMConfigPerformance(F_CPU);
#endif


	OpenCoreTimer(CORE_TICK_RATE);

	// set up the core timer interrupt with a prioirty of 2 and zero sub-priority
	mConfigIntCoreTimer((CT_INT_ON | CT_INT_PRIOR_2 | CT_INT_SUB_PRIOR_0));

	// enable multi-vector interrupts
	INTEnableSystemMultiVectoredInt();


#ifdef _ENABLE_PIC_RTC_
	RtccInit();									// init the RTCC
//	while(RtccGetClkStat() != RTCC_CLK_ON);		// wait for the SOSC to be actually running and RTCC to have its clock source
												// could wait here at most 32ms

	delay(50);
	// time is MSb: hour, min, sec, rsvd. date is MSb: year, mon, mday, wday.
	RtccOpen(0x10073000, 0x11010901, 0);	
	RtccSetTimeDate(0x10073000, 0x10101701);	
	// please note that the rsvd field has to be 0 in the time field!
#endif


	//*	as per Al.Rodriguez@microchip.com, Jan 7, 2011
	//*	Disable the JTAG interface.
	DDPCONbits.JTAGEN	=	0;


}


//************************************************************************
void __ISR(_CORE_TIMER_VECTOR, ipl2) CoreTimerHandler(void)
{
	// clear the interrupt flag
	mCTClearIntFlag();

	// .. things to do

	// update the period
	UpdateCoreTimer(CORE_TICK_RATE);

	timer0_millis++;
}


