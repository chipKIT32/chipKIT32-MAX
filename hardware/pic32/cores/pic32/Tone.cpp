//************************************************************************
//*	Tone.cpp
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010 by Mark Sproul
//*	
//*	
//************************************************************************
//*	Tone.cpp
//*	
//*	A Tone Generator Library
//*	
//*	Based on code by Brett Hagman
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General Public
//*	License along with this library; if not, write to the Free Software
//*	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
//*	
//*	
//************************************************************************
//*	The original tone supported multiple timers and multiple pins
//*	the offical Arduino documentation does not
//*	I am writing this as per the docs, not per the original code
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 15,	2010	Started on Tone.cpp for PIC32
//************************************************************************


#define __LANGUAGE_C__
//*	the Microchip .h files do not know about C++
#include <plib.h>


//#define	_DEBUG_TONE_

#ifdef _DEBUG_TONE_
	#include	"WProgram.h"
	#include	"HardwareSerial.h"
#endif

#include "wiring.h"
#include "pins_arduino.h"


// timerx_toggle_count:
//	> 0 - duration specified
//	= 0 - stopped
//	< 0 - infinitely (until stop() method called, or new play() called)


volatile long		timer1_toggle_count;
volatile uint32_t	*timer1_pin_port;
volatile uint8_t	timer1_pin_mask;

	#define AVAILABLE_TONE_PINS 1

	const uint8_t	tone_pin_to_timer_PGM[] = { 2 /*, 3, 4, 5, 1, 0 */ };
	static uint8_t tone_pins[AVAILABLE_TONE_PINS] = { 255 /*, 255, 255, 255, 255, 255 */ };




// frequency (in hertz) and duration (in milliseconds).

//************************************************************************
void tone(uint8_t _pin, unsigned int frequency, unsigned long duration)
{
unsigned long	tonePeriod;
uint32_t		ocr = 0;
int8_t			_timer;
uint8_t			port;

	timer1_toggle_count	=	duration;
	
	pinMode(_pin, OUTPUT);
	port				=	digitalPinToPort(_pin);

	timer1_pin_port		=	portOutputRegister(port);

	timer1_pin_mask		=	digitalPinToBitMask(_pin);

	//*	just to get things goin
int	ii;
unsigned long	startTime;

/*	tonePeriod	=	1000 / frequency; 
	startTime	=	millis();
	while ((millis() - startTime) < duration)
	{
		digitalWrite(_pin, HIGH);
		delay(tonePeriod / 2);
		digitalWrite(_pin, LOW);
		delay(tonePeriod / 2);
	}
*/
	
	tonePeriod	=	((F_CPU / 256) / 2 / frequency);

	ConfigIntTimer1(T1_INT_ON | T1_INT_PRIOR_3 | T1_INT_PRIOR_1);

	OpenTimer1(T1_ON | T1_PS_1_256, tonePeriod);

}


//************************************************************************
// XXX: this function only works properly for timer 2 (the only one we use
// currently). for the others, it should end the tone, but won't restore
// proper PWM functionality for the timer.
//************************************************************************
void disableTimer(uint8_t _timer)
{
	CloseTimer1();
}


//************************************************************************
void noTone(uint8_t _pin)
{
	int8_t _timer = -1;
	
	disableTimer(_timer);

	digitalWrite(_pin, 0);
}

//*******************************************************************************************
//*	we need the extern C so that the interrupt handler names dont get mangled by C++
extern "C"
{


//*	not done yet
//************************************************************************
void __ISR(_TIMER_1_VECTOR, ipl3) Timer1Handler(void)
{
	//*	degugging
	mPORTBToggleBits(0x0ffff);

	// clear the interrupt flag
	mT1ClearIntFlag();

	if (timer1_toggle_count != 0)
	{
		// toggle the pin
		*timer1_pin_port	^=	timer1_pin_mask;

		if (timer1_toggle_count > 0)
		{
			timer1_toggle_count--;
		}
	}
	else
	{
		disableTimer(2);
		*timer1_pin_port &= ~(timer1_pin_mask);		// keep pin low after stop
	}

	// update the period
//	UpdateCoreTimer(CORE_TICK_RATE);

}

};

//-		//************************************************************************
//-		ISR(TIMER2_COMPA_vect, )
//-		{
//-		
//-			if (timer2_toggle_count != 0)
//-			{
//-				// toggle the pin
//-				*timer2_pin_port ^= timer2_pin_mask;
//-		
//-				if (timer2_toggle_count > 0)
//-				timer2_toggle_count--;
//-			}
//-			else
//-			{
//-				disableTimer(2);
//-				*timer2_pin_port &= ~(timer2_pin_mask);		// keep pin low after stop
//-			}
//-		}

