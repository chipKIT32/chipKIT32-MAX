//************************************************************************
//*	wiring_analog.c
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
//*	Boston, MA 02111-1307 USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 15,	2010	<MLS> Started on wiring_analog.c
//*	Oct 17,	2010	<MLS> analogRead working
//*	Oct 19,	2010	<MLS> analogWrite (PWM) working
//*	Oct 19,	2010	<MLS> turnOffPWM moved to wiring_analog.c from wiring_digital.c
//*	Apr 26,	2011	<MLS> Errata sheet PIC32MX5XX-6XX-7XX Errata.pdf item #26
//*	May  5,	2011	<MLS> Uno board does not have 1 to 1 pin mapping for analog, added analogInPinToBit
//*	May 18,	2011	<MLS> JP4 on the uno board must be in the RD9 position for PWM to work on pin 10
//*	May 23,	2011	<MLS> Added support for pin numbers to be remaped to analog numbers, (left out in iniitial version)
//*	Aug  7,	2011	<MarcMaccomb> fixed bug in Anaglog Read
//************************************************************************

// Master header file for all peripheral library includes
#include <plib.h>


#include "wiring_private.h"
#include "pins_arduino.h"

//uint8_t analog_reference = DEFAULT;

//*********************************************************************
void analogReference(uint8_t mode)
{
	// can't actually set the register here because the default setting
	// will connect AVCC and the AREF pin, which would cause a short if
	// there's something connected to AREF.
//	analog_reference = mode;
}

//*********************************************************************
//*	Marc McComb Aug 2011
//*	Found bug with analogRead(). When using more than one ADC input in a program, 
//*	only one result will be read with that value being mirrored in the second result.
//*	I commented out the code using the Microchip PIC32 Peripheral Libraries and substituted 
//*	direct writes to the registers as shown below. This fixed all problems and works great:
//*********************************************************************
int analogRead(uint8_t pin)
{
	int analogValue;
	uint8_t	channelNumber;

	#if defined(_BOARD_MEGA_) || defined(_BOARD_MAX32_)
		if (pin >= 54) pin -= 54; // allow for channel or pin numbers

	#else
		if (pin >= 14) pin -= 14; // allow for channel or pin numbers
	#endif


	//in most cases (except the uno board) this will be a 1 to 1 mapping
	channelNumber	=	analogInPinToBit(pin);



	switch(channelNumber)
	{
		case 0:
			AD1PCFG = 0xFFFE;
			AD1CHS = 0x00000000;

			break;
			
		case 1:
			AD1PCFG = 0xFFFD;
			AD1CHS = 0x00010000;
			break;

		case 2:
			AD1PCFG = 0xFFFB;
			AD1CHS = 0x00020000;
			break;

		case 3:
			AD1PCFG = 0xFFF7;
			AD1CHS = 0x00030000;
			break;

		case 4:
			AD1PCFG = 0xFFEF;
			AD1CHS = 0x00040000;
			break;

		case 5:
			AD1PCFG = 0xFFDF;
			AD1CHS = 0x00050000;
			break;

		case 6:
			AD1PCFG = 0xFFBF;
			AD1CHS = 0x00060000;
			break;

		case 7:
			AD1PCFG = 0xFF7F;
			AD1CHS = 0x00070000;
			break;

		case 8:
			AD1PCFG = 0xFEFF;
			AD1CHS = 0x00080000;
			break;

		case 9:
			AD1PCFG = 0xFDFF;
			AD1CHS = 0x00090000;
			break;

		case 10:
			AD1PCFG = 0xFBFF;
			AD1CHS = 0x000A0000;
			break;

		case 11:
			AD1PCFG = 0xF7FF;
			AD1CHS = 0x000B0000;
			break;

		case 12:
			AD1PCFG = 0xEFFF;
			AD1CHS = 0x000C0000;
			break;

		case 13:
			AD1PCFG = 0xDFFF;
			AD1CHS = 0x000D0000;
			break;

		case 14:
			AD1PCFG = 0xBFFF;
			AD1CHS = 0x000E0000;
			break;

		case 15:
			AD1PCFG = 0x7FFF;
			AD1CHS = 0x000F0000;
			break;

	}


	AD1CON1 = 0; //Ends sampling, and starts converting

	//Set up for manual sampling
	AD1CSSL = 0;
	AD1CON3 = 0x0002;	//Tad = internal 6 Tpb
	AD1CON2 = 0;

	//Turn on ADC
	AD1CON1SET = 0x8000;
	
	//Start sampling
	AD1CON1SET = 0x0002;
	
	//Delay for a bit
	delayMicroseconds(2);

	//Start conversion
	AD1CON1CLR = 0x0002;
	
	//Wait for conversion to finish
	while (!(AD1CON1 & 0x0001));
	

	//Read the ADC Value
	analogValue	=	ADC1BUF0;
	
	return (analogValue);
}

#define	PWM_TIMER_PERIOD	((F_CPU / 256) / 490)

//*********************************************************************
//*	PWM output only works on the pins with hardware support. 
//*	These are defined in the appropriate pins_*.c file.
//*	For the rest of the pins, we default to digital output.
//*********************************************************************
void analogWrite(uint8_t pin, int val)
{

	// We need to make sure the PWM output is enabled for those pins
	// that support it, as we turn it off when digitally reading or
	// writing with them.  Also, make sure the pin is in output mode
	// for consistenty with Wiring, which doesn't require a pinMode
	// call for the analog output pins.
	pinMode(pin, OUTPUT);
	if (val == 0)
	{
		digitalWrite(pin, LOW);
	}
	else if (val == 255)
	{
		digitalWrite(pin, HIGH);
	}
	else
	{
		switch(digitalPinToTimer(pin))
		{
		#ifdef _OCMP1
			case TIMER_OC1:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC1( OC_ON | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, (PWM_TIMER_PERIOD*val)/256, (PWM_TIMER_PERIOD*val)/256  );
				//Set duty cycle on fly
				SetDCOC1PWM((PWM_TIMER_PERIOD*val)/256);
				break;
		#endif

		#ifdef _OCMP2
			case TIMER_OC2:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC2( OC_ON | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, (PWM_TIMER_PERIOD*val)/256, (PWM_TIMER_PERIOD*val)/256  );
				//Set duty cycle on fly
				SetDCOC2PWM((PWM_TIMER_PERIOD*val)/256);
				break;
		#endif

		#ifdef _OCMP3
			case TIMER_OC3:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC3( OC_ON | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, (PWM_TIMER_PERIOD*val)/256, (PWM_TIMER_PERIOD*val)/256  );
				//Set duty cycle on fly
				SetDCOC3PWM((PWM_TIMER_PERIOD*val)/256);
				break;
		#endif

		#ifdef _OCMP4
			case TIMER_OC4:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC4( OC_ON | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, (PWM_TIMER_PERIOD*val)/256, (PWM_TIMER_PERIOD*val)/256  );
				//Set duty cycle on fly
				SetDCOC4PWM((PWM_TIMER_PERIOD*val)/256);
				break;
		#endif

		#ifdef _OCMP5
			case TIMER_OC5:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC5( OC_ON | OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE, (PWM_TIMER_PERIOD*val)/256, (PWM_TIMER_PERIOD*val)/256  );
				//Set duty cycle on fly
				SetDCOC5PWM((PWM_TIMER_PERIOD*val)/256);
				break;
		#endif

#if 0
//*	this is the original code, I want to keep it around for refernce for a bit longer
		#ifdef _OCMP1
			case TIMER_OC1:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC1( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

//			    SetDCOC1PWM((PWM_TIMER_PERIOD * val) / 256);
				break;
		#endif

		#ifdef _OCMP2
			case TIMER_OC2:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC2( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

//			    SetDCOC2PWM((PWM_TIMER_PERIOD * val) / 256);
				break;
		#endif

		#ifdef _OCMP3
			case TIMER_OC3:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC3( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

//			    SetDCOC3PWM((PWM_TIMER_PERIOD * val) / 256);
				break;
		#endif

		#ifdef _OCMP4
			case TIMER_OC4:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC4( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

//			    SetDCOC4PWM((PWM_TIMER_PERIOD * val) / 256);
				break;
		#endif

		#ifdef _OCMP5
			case TIMER_OC5:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC5( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

//			    SetDCOC5PWM((PWM_TIMER_PERIOD * val) / 256);
				break;
		#endif
#endif

			case NOT_ON_TIMER:
			default:
				if (val < 128)
				{
					digitalWrite(pin, LOW);
				}
				else
				{
					digitalWrite(pin, HIGH);
				}
		}
	}
}


//************************************************************************
void turnOffPWM(uint8_t timer)
{
	switch(timer)
	{
	#ifdef _OCMP1
		case TIMER_OC1:	CloseOC1();	break;
	#endif

	#ifdef _OCMP2
		case TIMER_OC2:	CloseOC2();	break;
	#endif

	#ifdef _OCMP3
		case TIMER_OC3:	CloseOC3();	break;
	#endif

	#ifdef _OCMP4
		case TIMER_OC4:	CloseOC4();	break;
	#endif

	#ifdef _OCMP5
		case TIMER_OC5:	CloseOC5();	break;
	#endif

	}
}
