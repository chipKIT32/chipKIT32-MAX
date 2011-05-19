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
int analogRead(uint8_t pin)
{
int				analogValue;
unsigned int	offset;	// buffer offset to point to the base of the idle buffer
unsigned int	param4;
uint8_t			channelNumber;

	//*	in most cases (except the uno board) this will be a 1 to 1 mapping
	channelNumber	=	analogInPinToBit(pin);


	//*	May 1, 2011	Gene Apperson of Digitlent sent me PIC32MX5XX-6XX-7XX Errata.pdf
	//*	item #26 documents a condition that I/O pins take time if previously set to outputs
	
	


	//*	first attempt, set all to 0
//	AD1PCFG	=	0;

	// configure and enable the ADC
	CloseADC10();	// ensure the ADC is off before setting the configuration

	// define setup parameters for OpenADC10
	//				 Turn module on | ouput in integer | trigger mode auto | enable autosample
	#define PARAM1	ADC_FORMAT_INTG16 | ADC_CLK_AUTO | ADC_AUTO_SAMPLING_ON

	// define setup parameters for OpenADC10
	//				 ADC ref external	| disable offset test	| disable scan mode | perform 2 samples | use dual buffers | use alternate mode
	#define PARAM2	ADC_VREF_AVDD_AVSS | ADC_OFFSET_CAL_DISABLE | ADC_SCAN_OFF | ADC_SAMPLES_PER_INT_1 | ADC_ALT_BUF_ON 

	// define setup parameters for OpenADC10
	//					use ADC internal clock | set sample time
	#define PARAM3	ADC_CONV_CLK_INTERNAL_RC | ADC_SAMPLE_TIME_15


	// define setup parameters for OpenADC10
	//				set AN4 and AN5 as analog inputs
	param4	=	channelNumber;
	
	// define setup parameters for OpenADC10
	// do not assign channels to scan
	#define PARAM5	SKIP_SCAN_ALL
	
	// use ground as neg ref for A | use AN4 for input A	  | use ground as neg ref for A | use AN5 for input B

//	SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN4 |  ADC_CH0_NEG_SAMPLEB_NVREF | ADC_CH0_POS_SAMPLEB_AN5); // configure to sample AN4 & AN5
//	SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN0 |  ADC_CH0_NEG_SAMPLEB_NVREF | ADC_CH0_POS_SAMPLEB_AN1); // configure to sample AN4 & AN5
//	OpenADC10( PARAM1, PARAM2, PARAM3, PARAM4, PARAM5 ); // configure ADC using the parameters defined above

	switch(channelNumber)
	{
		case 0:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN0);
			break;
			
		case 1:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN1);
			break;

		case 2:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN2);
			break;

		case 3:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN3);
			break;

		case 4:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN4);
			break;

		case 5:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN5);
			break;

		case 6:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN6);
			break;

		case 7:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN7);
			break;

		case 8:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN8);
			break;

		case 9:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN9);
			break;

		case 10:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN10);
			break;

		case 11:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN11);
			break;

		case 12:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN12);
			break;

		case 13:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN13);
			break;

		case 14:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN14);
			break;

		case 15:
			SetChanADC10( ADC_CH0_NEG_SAMPLEA_NVREF | ADC_CH0_POS_SAMPLEA_AN15);
			break;
	}

	
	// configure to sample what ever pin was specified
	
	OpenADC10( PARAM1, PARAM2, PARAM3, param4, PARAM5 ); // configure ADC using the parameters defined above

	EnableADC10(); // Enable the ADC

	//*	A delay is needed for the the ADC start up time
	//*	this value started out at 1 millisecond, I dont know how long it needs to be
	//*	99 uSecs will give us the same approximate sampling rate as the AVR chip
//	delay(1);	
	delayMicroseconds(99);

	while ( ! mAD1GetIntFlag() ) 
	{ 
		// wait for the first conversion to complete so there will be vaild data in ADC result registers
	}

	analogValue	=	ReadADC10(0);
	
	mAD1ClearIntFlag();

	return (analogValue);
}

#define	PWM_TIMER_PERIOD	((F_CPU / 256) / 2 / 440)
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
				OpenOC1( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );
				
				break;
		#endif

		#ifdef _OCMP2
			case TIMER_OC2:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC2( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

				break;
		#endif

		#ifdef _OCMP3
			case TIMER_OC3:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC3( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

				break;
		#endif

		#ifdef _OCMP4
			case TIMER_OC4:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC4( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

				break;
		#endif

		#ifdef _OCMP5
			case TIMER_OC5:
				//* Open Timer2 with Period register value
				OpenTimer2(T2_ON | T2_PS_1_256, PWM_TIMER_PERIOD);
				OpenOC5( OC_ON | OC_TIMER_MODE32 | OC_TIMER2_SRC | OC_CONTINUE_PULSE | OC_LOW_HIGH, 256, (256 - val) );

				break;
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
