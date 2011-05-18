//************************************************************************
//*	WInterrupts.c
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
//*	
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2004-05 Hernando Barragan
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
//*	Oct 15,	2010	<MLS> Started on WInterrupts.c for Pic32
//************************************************************************

#include <inttypes.h>
#include <stdio.h>

#include "WConstants.h"
#include "wiring_private.h"

volatile static voidFuncPtr intFunc[EXTERNAL_NUM_INTERRUPTS];

//************************************************************************
void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), int mode)
{
	if(interruptNum < EXTERNAL_NUM_INTERRUPTS)
	{
	    intFunc[interruptNum] = userFunc;
	    
	    // Configure the interrupt mode (trigger on low input, any change, rising
	    // edge, or falling edge).  The mode constants were chosen to correspond
	    // to the configuration bits in the hardware register, so we simply shift
	    // the mode into place.
	      
	    // Enable the interrupt.
	      
	    switch (interruptNum)
	    {
	    	case 1:
	    		break;
		}
	}
}

//************************************************************************
void detachInterrupt(uint8_t interruptNum)
{
	if(interruptNum < EXTERNAL_NUM_INTERRUPTS)
	{
		// Disable the interrupt.  (We can't assume that interruptNum is equal
		// to the number of the EIMSK bit to clear, as this isn't true on the 
		// ATmega8.  There, INT0 is 6 and INT1 is 7.)
		switch (interruptNum) 
		{
	    	case 1:
	    		break;
		}

		intFunc[interruptNum] = 0;
	}
}


//#if defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#if defined(EICRA) && defined(EICRB)

//************************************************************************
SIGNAL(INT0_vect)
{
  if(intFunc[EXTERNAL_INT_2])
    intFunc[EXTERNAL_INT_2]();
}

SIGNAL(INT1_vect) {
  if(intFunc[EXTERNAL_INT_3])
    intFunc[EXTERNAL_INT_3]();
}

SIGNAL(INT2_vect) {
  if(intFunc[EXTERNAL_INT_4])
    intFunc[EXTERNAL_INT_4]();
}

SIGNAL(INT3_vect) {
  if(intFunc[EXTERNAL_INT_5])
    intFunc[EXTERNAL_INT_5]();
}

SIGNAL(INT4_vect) {
  if(intFunc[EXTERNAL_INT_0])
    intFunc[EXTERNAL_INT_0]();
}

SIGNAL(INT5_vect) {
  if(intFunc[EXTERNAL_INT_1])
    intFunc[EXTERNAL_INT_1]();
}

SIGNAL(INT6_vect) {
  if(intFunc[EXTERNAL_INT_6])
    intFunc[EXTERNAL_INT_6]();
}

SIGNAL(INT7_vect) {
  if(intFunc[EXTERNAL_INT_7])
    intFunc[EXTERNAL_INT_7]();
}


#endif

/*
SIGNAL(SIG_2WIRE_SERIAL) {
  if(twiIntFunc)
    twiIntFunc();
}
*/

