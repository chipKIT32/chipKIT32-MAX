//************************************************************************
//*	Wiring_digital.c
//*
//*	Arduino core files for PIC32
//*		(C) 2010 by Mark Sproul
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
//*	Boston, MA  02111-1307  USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	<MLS> Got MPLAB X working on MacOSX 1.6 for the first time
//*	Oct 14,	2010	<MLS> Digital Write working
//*	Oct 15,	2010	<MLS> Digital Read working
//*	Oct 19,	2010	<MLS> turnOffPWM moved to wiring_analog.c
//*	Feb  6,	2011	<MLS> In order to use analog pins as digital, AD1PCFG must be set
//************************************************************************

#include	<peripheral/adc10.h>


#include "wiring_private.h"
#include "pins_arduino.h"


//************************************************************************
void pinMode(uint8_t pin, uint8_t mode)
{
uint32_t			bitMask;
uint8_t				port;
volatile uint32_t	*tris_reg;

	bitMask	=	digitalPinToBitMask(pin);
	port	=	digitalPinToPort(pin);

	if (port == NOT_A_PIN) return;

	//*	is it an analog port
	if (port == PB)
	{
		//*	we are on ANALOG pin, we have to set it to analog mode	
		//	You have to set the bit in the AD1PCFG for an analog pin to be used as a 
		//	digital input. They come up after reset as analog input with the digital 
		//	input disabled. For the PORTB pins you switch between analog input and 
		//	digital input using AD1PCFG.

		AD1PCFGSET	=	bitMask;

	}

	//*	the TRISx register is used for data direction
	//*	1 = input, 0 = output (opposite of AVR)
	tris_reg	=	portModeRegister(port);

	//*	the registers are 32 bits and in this order
	//*	therefore the CLR register is +1 and the SET register is +2
	//*	TRISx			= TRIState register (input vs output control)
	//*	TRISxCLR
	//*	TRISxSET
	//*	TRISxINV
	//*	PORTx
	//*	PORTxCLR
	//*	PORTxSET
	//*	PORTxINV
	//*	LATx
	//*	LATxCLR
	//*	LATxSET
	//*	LATxINV
	//*	ODCx
	//*	ODCxCLR
	//*	ODCxSET
	//*	ODCxINV
	


	if (mode == INPUT) 
	{
		//*	TRISxSET
		*(tris_reg + 2)	=	bitMask;
	}
	else 
	{
		//*	TRISxCLR
		*(tris_reg + 1)	=	bitMask;
	}
}

//************************************************************************
uint8_t getPinMode(uint8_t pin)
{
uint8_t				mode;
uint32_t			bitMask;
uint8_t				port;
volatile uint32_t	*tris_reg;

	
	mode	=	OUTPUT;
	
	bitMask	=	digitalPinToBitMask(pin);
	port	=	digitalPinToPort(pin);

	if (port != NOT_A_PIN)
	{
		//*	the TRISx register is used for data direction
		//*	1 = input, 0 = output (opposite of AVR)
		tris_reg	=	portModeRegister(port);

		if ((*tris_reg & bitMask) == 0) 
		{
			mode	=	OUTPUT;
		}
		else 
		{
			mode	=	INPUT;
		}
	}

 	return(mode);
 }


//************************************************************************
//*	LAT and PORT function identically for writing.  
//*	Reading from PORT gives you a snapshot of the actual pins state regardless of how, 
//*	if at all, the PIC is trying to drive them.  
//*	Reading from LAT gives you the values last written to the pins, whether thru LAT or PORT.
//************************************************************************
void digitalWrite(uint8_t pin, uint8_t val)
{
volatile uint32_t	*latchPort;
uint8_t				port;
uint16_t			bit;
uint8_t				timer;

	port	=	digitalPinToPort(pin);
	bit		=	digitalPinToBitMask(pin);
	timer	=	digitalPinToTimer(pin);

	if (port == NOT_A_PIN) return;

	// If the pin that support PWM output, we need to turn it off
	// before doing a digital write.
	if (timer != NOT_ON_TIMER) turnOffPWM(timer);

	latchPort	=	portOutputRegister(port);

	if (val == LOW)
	{
		*latchPort	&=	~bit;
	}
	else
	{
		*latchPort	|=	bit;
	}
}

//************************************************************************
int digitalRead(uint8_t pin)
{
uint8_t		timer;
uint16_t	bit;
uint8_t		port;
int			highLow;


	timer	=	digitalPinToTimer(pin);
	bit		=	digitalPinToBitMask(pin);
	port	=	digitalPinToPort(pin);

	if (port == NOT_A_PIN) return LOW;

	// If the pin that support PWM output, we need to turn it off
	// before getting a digital reading.
	if (timer != NOT_ON_TIMER) turnOffPWM(timer);

	if (*portInputRegister(port) & bit) 
	{
		highLow	=	HIGH;
	}
	else
	{
		highLow	=	LOW;
	}
	return(highLow);
}
