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
//*	Aug  7,	2011	<MarcMaccomb> fixed bug in Anaglog Read (Issue (#67)
//*	Aug  7,	2011	<Gene Apperson> fixed bug in Anaglog Write (Issue #70)
//*	Aug  7,	2011	<Gene Apperson> Added necessary code for analogReference (Issue #69)
//************************************************************************

// Master header file for all peripheral library includes
#include <plib.h>


#include "wiring_private.h"
#include "pins_arduino.h"

//uint8_t analog_reference	=	DEFAULT;
uint32_t analog_reference	=	0;      //default to AVDD, AVSS


//*********************************************************************
void analogReference(uint8_t mode)
{
	// can't actually set the register here because the default setting
	// will connect AVCC and the AREF pin, which would cause a short if
	// there's something connected to AREF.
//	analog_reference	=	mode;
    switch(mode)
    {
        case EXTERNAL:		//select Vref+,AVSS
            analog_reference	=	0x2000;
            break;

        case EXTMINUS:		//select AVDD, Vref-
            analog_reference	=	0x4000;
            break;

        case EXTPLUSMINUS:	//select Vref+, Vref-
            analog_reference	=	0x6000;
            break;

        case DEFAULT:
        default:			//select AVDD, AVSS
            analog_reference	=	0x0000;
            break;
    }

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
			AD1PCFG	=	0xFFFE;
			AD1CHS	=	0x00000000;

			break;
			
		case 1:
			AD1PCFG	=	0xFFFD;
			AD1CHS	=	0x00010000;
			break;

		case 2:
			AD1PCFG	=	0xFFFB;
			AD1CHS	=	0x00020000;
			break;

		case 3:
			AD1PCFG	=	0xFFF7;
			AD1CHS	=	0x00030000;
			break;

		case 4:
			AD1PCFG	=	0xFFEF;
			AD1CHS	=	0x00040000;
			break;

		case 5:
			AD1PCFG	=	0xFFDF;
			AD1CHS	=	0x00050000;
			break;

		case 6:
			AD1PCFG	=	0xFFBF;
			AD1CHS	=	0x00060000;
			break;

		case 7:
			AD1PCFG	=	0xFF7F;
			AD1CHS	=	0x00070000;
			break;

		case 8:
			AD1PCFG	=	0xFEFF;
			AD1CHS	=	0x00080000;
			break;

		case 9:
			AD1PCFG	=	0xFDFF;
			AD1CHS	=	0x00090000;
			break;

		case 10:
			AD1PCFG	=	0xFBFF;
			AD1CHS	=	0x000A0000;
			break;

		case 11:
			AD1PCFG	=	0xF7FF;
			AD1CHS	=	0x000B0000;
			break;

		case 12:
			AD1PCFG	=	0xEFFF;
			AD1CHS	=	0x000C0000;
			break;

		case 13:
			AD1PCFG	=	0xDFFF;
			AD1CHS	=	0x000D0000;
			break;

		case 14:
			AD1PCFG	=	0xBFFF;
			AD1CHS	=	0x000E0000;
			break;

		case 15:
			AD1PCFG	=	0x7FFF;
			AD1CHS	=	0x000F0000;
			break;

	}


	AD1CON1	=	0; //Ends sampling, and starts converting

	//Set up for manual sampling
	AD1CSSL	=	0;
	AD1CON3	=	0x0002;	//Tad = internal 6 Tpb
	AD1CON2	=	analog_reference;

	//Turn on ADC
	AD1CON1SET	=	0x8000;
	
	//Start sampling
	AD1CON1SET	=	0x0002;
	
	//Delay for a bit
	delayMicroseconds(2);

	//Start conversion
	AD1CON1CLR	=	0x0002;
	
	//Wait for conversion to finish
	while (!(AD1CON1 & 0x0001));
	

	//Read the ADC Value
	analogValue	=	ADC1BUF0;
	
	return (analogValue);
}

//*********************************************************************
//* PWM output only works on the pins with hardware support.
//* These are defined in the appropriate pins_.c file.
// For the rest of the pins, we default to digital output.
//*********************************************************************

#define	PWM_TIMER_PERIOD	((F_CPU / 256) / 490)

uint8_t pwm_active = 0; //keep track of active PWM outputs


//*********************************************************************
//*	PWM output only works on the pins with hardware support. 
//*	These are defined in the appropriate pins_*.c file.
//*	For the rest of the pins, we default to digital output.
//*********************************************************************
//*	Gene Apperson Aug 2011
//*	analogWrite resets timer 2 each time it is called. 
//*	This causes the PWM to fail if it is called repeatedly with a short interval between calls.
//*	This is the suggested fixed version of analogWrite.
//*********************************************************************
void analogWrite(uint8_t pin, int val)
{
	uint8_t timer;
	uint8_t pwm_mask;

	// Ensure that the pin is an output
	pinMode(pin, OUTPUT);

	// For the min and max values, just set the pin state
	if (val == 0) 
	{
	    digitalWrite(pin, LOW);
	}

	else if (val == 255)
	{
	    digitalWrite(pin, HIGH);
	}

	// Otherwise for pins that aren't timer pins, just set the pin
	// state based on the requested value. If it really is a timer
	// pin then we can set up the proper PWM behavior.
	else
	{
	    timer = digitalPinToTimer(pin);
	    if (timer != NOT_ON_TIMER)
	    {
	        //should assert(timer < 8) here, but assertions aren't being used
	        pwm_mask = (1 << timer);
	    }

	    // For pins that aren't actually PWM output pins, set the pin
	    // state based on the requested duty cycle.
	    if (timer == NOT_ON_TIMER)
	    {
	        if (val < 128)
	        {
	            digitalWrite(pin, LOW);
	        }
	        else
	        {
	            digitalWrite(pin, HIGH);
	        }
	    }

	    // It's an actual PWM pin.
	    else
	    {
	        // If no PWM are currently active, then init Timer2
	        if (pwm_active == 0)
	        {
	            T2CON = T2_PS_1_256;
	            TMR2 = 0;
	            PR2 = PWM_TIMER_PERIOD;
	            T2CONSET = T2_ON;
	       }

	        // If the requested PWM isn't active, init its output compare
	        if ((pwm_active & pwm_mask) == 0) 
	        {
	            switch (timer)
	            {
	                case TIMER_OC1:
	                    OC1R = ((PWM_TIMER_PERIOD*val)/256);
	                    OC1CON = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	                    OC1CONSET = OC_ON;
	                    break;

	                case TIMER_OC2:
	                    OC2R = ((PWM_TIMER_PERIOD*val)/256);
	                    OC2CON = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	                    OC2CONSET = OC_ON;
	                    break;

	                case TIMER_OC3:
	                    OC3R = ((PWM_TIMER_PERIOD*val)/256);
	                    OC3CON = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	                    OC3CONSET = OC_ON;
	                    break;

	                case TIMER_OC4:
	                    OC4R = ((PWM_TIMER_PERIOD*val)/256);
	                    OC4CON = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	                    OC4CONSET = OC_ON;
	                    break;

	                case TIMER_OC5:
	                    OC5R = ((PWM_TIMER_PERIOD*val)/256);
	                    OC5CON = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	                    OC5CONSET = OC_ON;
	                    break;
	            }

	            pwm_active |= pwm_mask;
	        }

	        // Set the duty cycle register for the requested output compare
	        switch (timer)
	        {
	            case TIMER_OC1:
	                OC1RS = ((PWM_TIMER_PERIOD*val)/256);
	                break;

	            case TIMER_OC2:
	                OC2RS = ((PWM_TIMER_PERIOD*val)/256);
	                break;

	            case TIMER_OC3:
	                OC3RS = ((PWM_TIMER_PERIOD*val)/256);
	                break;

	            case TIMER_OC4:
	                OC4RS = ((PWM_TIMER_PERIOD*val)/256);
	                break;

	            case TIMER_OC5:
	                OC5RS = ((PWM_TIMER_PERIOD*val)/256);
	                break;
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
		case TIMER_OC1:	
		//-	CloseOC1();	
        OC1CONCLR	=	OC_ON;
		break;
	#endif

	#ifdef _OCMP2
		case TIMER_OC2:	
		//-	CloseOC2();
	        OC2CONCLR	=	OC_ON;
			break;
	#endif

	#ifdef _OCMP3
		case TIMER_OC3:
		//-	CloseOC3();
	        OC3CONCLR	=	OC_ON;
			break;
	#endif

	#ifdef _OCMP4
		case TIMER_OC4:
		//-	CloseOC4();
	        OC4CONCLR	=	OC_ON;
			break;
	#endif

	#ifdef _OCMP5
		case TIMER_OC5:
		//-	CloseOC5();
	        OC5CONCLR	=	OC_ON;
			break;
	#endif

	}
	// Turn off the bit saying that this PWM is active.
	pwm_active &=	~(1 << timer);

	// If no PWM are active, turn off the timer.
	if (pwm_active == 0)
	{
    	T2CONCLR	=	T2_ON;
	}
}
