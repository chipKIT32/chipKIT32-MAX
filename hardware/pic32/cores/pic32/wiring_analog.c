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
//* Nov 12, 2011	<Gene Apperson> modified for board variant support
//************************************************************************

// Master header file for all peripheral library includes
#include <plib.h>

#include "wiring_private.h"

#define OPT_BOARD_INTERNAL	//pull in internal symbol definitons
#include "p32_defs.h"
#include "pins_arduino.h"

#define	PWM_TIMER_PERIOD	((F_CPU / 256) / 490)

uint32_t	analog_reference = 0;	//default to AVDD, AVSS

uint8_t		pwm_active = 0;			//keeps track of active PWM outputs


//*********************************************************************
void analogReference(uint8_t mode)
{

#if (OPT_BOARD_ANALOG_READ != 0)
	/* Peform any board specific processing.
	*/
int _board_analogReference(uint8_t mode);

	if (_board_analogReference(mode) != 0)
	{
		return;
	}
#endif

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

#if (OPT_BOARD_ANALOG_READ != 0)
	/* Peform any board specific processing.
	*/
int _board_analogRead(uint8_t pin, int * val);
int	tmp;

	if (_board_analogRead(pin, &tmp) != 0)
	{
		return tmp;
	}
#endif

	/* Pin number is allowed to be either the digital pin number or the
	** analog pin number. Map the input so that it is guaranteed to be
	** an analog pin number.
	*/
	pin = (pin < NUM_DIGITAL_PINS) ? digitalPinToAnalog(pin) : NOT_ANALOG_PIN;
	if (pin == NOT_ANALOG_PIN) {
		return 0;
	}

	/* Map the analog pin number to the correct analog mux channel in the
	** A/D converter. In some cases this is a direct mapping. In that case,
	** the conversion macro just returns it parameter.
	*/
	channelNumber = analogInPinToChannel(pin);

	/* Ensure that the pin associated with the analog channel is in analog
	** input mode, and select the channel in the input mux.
	*/
	AD1PCFG = ~(1 << channelNumber);
	AD1CHS = (channelNumber & 0xFFFF) << 16;

#if defined(DEAD)
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
#endif

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
	uint16_t	timer;
	uint8_t		pwm_mask;
	p32_oc *	ocp;

#if (OPT_BOARD_ANALOG_WRITE != 0)
	/* Peform any board specific processing.
	*/
int	_board_analogWrite(uint8_t, int val);

	if (_board_analogWrite(pin, val) != 0)
	{
		return;
	}
#endif

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

	// For pins that aren't timer pins, set the pin state based
	// on the requested value. If it really is a timer
	// pin then we can set up the proper PWM behavior.
	else
	{
		// Determine which output compare is on this pin.
	    timer = digitalPinToTimerOC(pin);

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

			//generate bit mask for this output compare
	        //should assert(timer < 8) here, but assertions aren't being used
	        pwm_mask = (1 << (timer - _TIMER_OC1));

			//Obtain a pointer to the output compare being being used
			//NOTE: as of 11/15/2011 All existing PIC32 devices
			// (PIC32MX1XX/2XX/3XX/4XX/5XX/6XX/7XX) have the output compares
			// at the same addresses. The base address is _OCMP1_BASE_ADDRESS
			// and the distance between their addresses is 0x200.
			ocp = (p32_oc *)(_OCMP1_BASE_ADDRESS + (0x200 * (timer - _TIMER_OC1)));

	        // If the requested PWM isn't active, init its output compare
	        if ((pwm_active & pwm_mask) == 0) 
	        {
	            ocp->ocxR.reg   = ((PWM_TIMER_PERIOD*val)/256);
				ocp->ocxCon.reg = OC_TIMER2_SRC | OC_PWM_FAULT_PIN_DISABLE;
	            ocp->ocxCon.set = OC_ON;

	            pwm_active |= pwm_mask;
	        }

	        // Set the duty cycle register for the requested output compare
			ocp->ocxRs.reg = ((PWM_TIMER_PERIOD*val)/256);

	    }

	}    

}


//************************************************************************
void turnOffPWM(uint8_t timer)
{
	p32_oc *	ocp;

	/* Disable the output compare.
	*/
	ocp = (p32_oc *)(_OCMP1_BASE_ADDRESS + (0x200 * (timer - _TIMER_OC1)));
	ocp->ocxCon.clr = OC_ON;

	// Turn off the bit saying that this PWM is active.
	pwm_active &= ~(1 << (timer - _TIMER_OC1));

	// If no PWM are active, turn off the timer.
	if (pwm_active == 0)
	{
    	T2CONCLR = T2_ON;
	}
}
