//************************************************************************
//*	wiring.c
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
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
//*	May 18,	2011	<MLS> merged in Brian Schmalz work on microseconds timer
//************************************************************************
#include <plib.h>
#include <p32xxxx.h>

#include "wiring_private.h"
//#define _ENABLE_PIC_RTC_


//*	as per Al.Rodriguez@microchip.com, Jan 7, 2011
//*	Add the following so the secondary oscillator is disabled and the port can be used as an IO PORT.
//#pragma config FSOSCEN = OFF

//#pragma config POSCMOD=XT, FNOSC=PRIPLL
//#pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
//#pragma config FPBDIV=DIV_2, FWDTEN=OFF, CP=OFF, BWP=OFF


#pragma config FPLLODIV	=	DIV_1
#pragma config FPLLMUL	=	MUL_20
#pragma config FPLLIDIV	=	DIV_2
#pragma config FWDTEN	=	OFF
#pragma config FCKSM	=	CSECME
#pragma config FPBDIV	=	DIV_1
#pragma config OSCIOFNC	=	ON
#pragma config POSCMOD	=	XT
#pragma config FSOSCEN	=	OFF
#pragma config FNOSC	=	PRIPLL
#pragma config CP		=	OFF
#pragma config BWP		=	OFF
#pragma config PWP		=	OFF


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

// Number of CoreTimer ticks per microsecond, for micros() function
#define CORETIMER_TICKS_PER_MICROSECOND		(F_CPU / 2 / 1000000UL)


//*	the "g" prefix means global variable
// Stores the current millisecond count (from power on)
volatile unsigned long gTimer0_millis	=	0;

// Variable used to track the microsecond count (from power on)
volatile unsigned long gCore_timer_last_val		=	0;
volatile unsigned long gCore_timer_micros		=	0;
volatile unsigned long gMicros_overflows		=	0;
volatile unsigned long gCore_timer_first_val	=	0;
volatile unsigned long gMicros_calculating		=	0;

//************************************************************************
unsigned long millis()
{
	return(gTimer0_millis);
}

//************************************************************************
// Read the CoreTimer register, which counts up at a rate of 40MHz
// (CPU clock/2). Each microsecond will be 40 of these counts.
// We keep track of the total number of microseconds since the PIC
// was powered on, as an int. Which means that this value will
// overflow every 71.58 minutes. We have to keep track of the CoreTimer
// overflows. The first value of CoreTimer after an overflow is recorded,
// and all micros() calls after that (until the next overflow) are 
// referenced from that value. This insures accuracy and that micros()
// lines up perfectly with millis().
//************************************************************************
unsigned long micros()
{
unsigned int cur_timer_val	=	0;
unsigned int micros_delta	=	0;

	// Use this as a flag to tell the ISR not to touch anything
	gMicros_calculating	=	1;
	cur_timer_val	=	ReadCoreTimer();

	// Check for overflow
	if (cur_timer_val >= gCore_timer_last_val)
	{
		// Note - gCore_timer_micros is not added to here (just a =, not a +=)
		// so we don't accumulate any errors.
		micros_delta	=	(cur_timer_val - gCore_timer_first_val) / CORETIMER_TICKS_PER_MICROSECOND;
		gCore_timer_micros	=	gMicros_overflows + micros_delta;
	}
	else
	{
		// We have an overflow
		gCore_timer_micros		+=	((0xFFFFFFFF - gCore_timer_last_val) + cur_timer_val) / CORETIMER_TICKS_PER_MICROSECOND;
		// Store off the current counter value for use in all future micros() calls
		gCore_timer_first_val	=	cur_timer_val;
		// And store off current micros count for future micros() calls
		gMicros_overflows		=	gCore_timer_micros;
	}
	// Always record the current counter value and remember it for next time
	gCore_timer_last_val	=	cur_timer_val;
	gMicros_calculating		=	0;

	return(gCore_timer_micros);
}



//#define mCTClearIntFlag()					(IFS0CLR = _IFS0_CTIF_MASK)
//#define mCTGetIntFlag()					 (IFS0bits.CTIF)
//#define GetSystemClock() (80000000ul)
//************************************************************************
// Delay for a given number of milliseconds.
void delay(unsigned long ms)
{
unsigned long	startMillis;

	startMillis	=	gTimer0_millis;
	while ((gTimer0_millis - startMillis) < ms)
	{
		//*	do nothing
	}
}

//************************************************************************
//*	Delay for the given number of microseconds. Will fail on micros()
//*	rollover every 71 minutes
void delayMicroseconds(unsigned int us)
{
unsigned long	startMicros	=	micros();

	while ((micros() - startMicros) < us)
	{
		//*	do nothing
	}
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
unsigned int cur_timer_val;
	

	cur_timer_val	=	ReadCoreTimer();
	// clear the interrupt flag
	mCTClearIntFlag();

	// update the period
	UpdateCoreTimer(CORE_TICK_RATE);

	// .. things to do
	
	// Check for CoreTimer overflows, record for micros() function
	// If micros() is not called more often than every 107 seconds (the
	// period of overflow for CoreTimer) then overflows to CoreTimer
	// will be lost. So we put code here to check for this condition
	// and record it so that the next call to micros() will be accurate.
	if (!gMicros_calculating)
	{
		if (cur_timer_val < gCore_timer_last_val)
		{
			// We have an overflow
			gCore_timer_micros		+=	((0xFFFFFFFF - gCore_timer_last_val) + cur_timer_val) / CORETIMER_TICKS_PER_MICROSECOND;
			gCore_timer_first_val	=	cur_timer_val;
			gMicros_overflows	=	gCore_timer_micros;
		}
		gCore_timer_last_val	=	cur_timer_val;
	}
	
	// Count this millisecond
	gTimer0_millis++;
}


