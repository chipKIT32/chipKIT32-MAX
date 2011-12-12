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
//*	May 20,	2011	<MLS> For mega board, disabling secondary oscillator
//*	Aug 17,	2011	<MLS> Issue #84 disable the uart on init so that the pins can be used as general purpose I/O
//*	Aug  1,	2011	<BPS> added softpwm
//* Sept 12, 2011	<GeneApperson> Fixed bug in core timer interrupt service routine
//*						when some interrupts had been missed due to interrupts disabled
//* Nov 12, 2011	<GeneApperson> revised for board variant support
//* Nov 19, 2011    <BPS> Added WestfW's code from ChipKit forum - fixes
//*                 lost millisecond and microsecond times during rollover
//*	Dec 11,	2011	<MLS> Issue #151 added INTEnableInterrupts and INTDisableInterrupts
//************************************************************************
#include <plib.h>
#include <p32xxxx.h>

#define	OPT_SYSTEM_INTERNAL
#define OPT_BOARD_INTERNAL	//pull in internal symbol definitons
#include "p32_defs.h"
#include "pins_arduino.h"

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

// SoftPWM library update function pointer
uint32_t (*gSoftPWMServoUpdate)(void) = NULL;

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

	unsigned int result;
	
	INTDisableInterrupts();
	result = gTimer0_millis * 1000;
	cur_timer_val = ReadCoreTimer();
	cur_timer_val -= gCore_timer_last_val;
	cur_timer_val += CORETIMER_TICKS_PER_MICROSECOND/2;  // rounding
	cur_timer_val /= CORETIMER_TICKS_PER_MICROSECOND;  // convert to microseconds
	INTEnableInterrupts();
	return (result + cur_timer_val);

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
	mConfigIntCoreTimer(CT_INT_ON | _CT_IPL_IPC | (_CT_SPL_IPC << 4));

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


#if (OPT_BOARD_INIT != 0)
void	_board_init(void);
	_board_init();
#endif

	//*	Issue #84
	//*	disable the uart so that the pins can be used as general purpose I/O
#if defined(_SER0_BASE)
	p32_uart *	uart;
	uart = (p32_uart *)_SER0_BASE;
	uart->uxMode.clr = (1 << _UARTMODE_ON);
#endif
}


//************************************************************************
#define read_count(dest) __asm__ __volatile__("mfc0 %0,$9" : "=r" (dest))
#define read_comp(dest) __asm__ __volatile__("mfc0 %0,$11" : "=r" (dest))
#define write_comp(src) __asm__ __volatile__("mtc0 %0,$11" : "=r" (src))

void __ISR(_CORE_TIMER_VECTOR, _CT_IPL_ISR) CoreTimerHandler(void)
{
    static uint32_t compare = 0;
    uint32_t count, millisLocal;
    uint32_t softPWMreturnFlag = 1;
    
    millisLocal = gTimer0_millis;  // defeat volatility

    // Only call the SoftPMW update function if it has been hooked into by the
    // SoftPWM library. Otherwise, always just do the normal 1ms update stuff
    if (gSoftPWMServoUpdate != NULL)
    {
        softPWMreturnFlag       =       gSoftPWMServoUpdate();
    }

    if (softPWMreturnFlag)
    {
        // Handle updates that need to happen at the 1ms rate:
        do {
            millisLocal++;                  /* At least one tick */
            read_count(count);              /* keep current count current */
            compare += CORE_TICK_RATE;      /* increment next compare */
            /*
             * In the common case, we're done.  Now we check special
             * circumstances.  1st, see if the next target compare value has
             * wrapped around, but the current count hasn't.  That means the
             * counter is behind the target, and will deliver another interrupt.
             */
            if (compare < CORE_TICK_RATE) { // next compare overflow?
                if (count > 32*CORE_TICK_RATE) { // but count hasn't overflowed
                    break;
                }
            }
            /*
             * Next check for having missed one or more clock ticks entirely,
             * in which case out next computer compare value will be "before"
             * the current count.  In this case we add an extra count to make
             * up for the miss, and try again.
             */
        } while (compare < count);
        // The SoftPWMServoUpdate() writes a new compare value, so don't duplicate
        if (gSoftPWMServoUpdate == NULL) {
            write_comp(compare);           /* A compare val that is about 1ms past cur count */
        }
        gCore_timer_last_val = count;  /* Save the count, too, for calculating micros() */
        gTimer0_millis = millisLocal;  /* update millis */
    }
    
    // clear the interrupt flag
    mCTClearIntFlag();
}


//************************************************************************
//*	Interrupts are enabled by setting the IE bit in the status register
//************************************************************************
unsigned int __attribute__((nomips16))  INTEnableInterrupts(void)
{
    unsigned int status = 0;

    asm volatile("ei    %0" : "=r"(status));

    return status;
}


//************************************************************************
//*	Interrupts are disabled by clearing the IE bit in the status register
//************************************************************************
unsigned int __attribute__((nomips16)) INTDisableInterrupts(void)
{
    unsigned int status = 0;

    asm volatile("di    %0" : "=r"(status));

    return status;
}
