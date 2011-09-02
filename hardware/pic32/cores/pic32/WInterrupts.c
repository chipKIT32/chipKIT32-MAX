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
//* Aug  8, 2011	<GeneApperson> completely rewritten (issue #75)
//* Aug 30, 2011    <GeneApperson> clear interrupt flag after return from
//*                     user interrupt function (issue #109)
//************************************************************************

#include <plib.h>
#include <p32xxxx.h>

#include <inttypes.h>
#include <stdio.h>

#include "WConstants.h"
#include "wiring_private.h"

volatile static voidFuncPtr intFunc[EXTERNAL_NUM_INTERRUPTS];

// Interrupt privilege and sub-privilege level for external interrupts
// This is an arbitrary selection.
#define	EXT_INT_IPL		4
#define	EXT_INT_SPL		1

//************************************************************************
// PIC32 devices only support rising and falling edge triggered interrupts
// on the external interrupt pins. Only the RISING and FALLING modes are
// supported.
//************************************************************************
void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), int mode)
{
	int		edge;

	if ((interruptNum < EXTERNAL_NUM_INTERRUPTS) && ((mode == FALLING)||(mode == RISING)))
	{
	    intFunc[interruptNum]	=	userFunc;

		// The active edge is selected via the INTxEP bits in the INTCON register.
		// A '0' bit selects falling edge, and a '1' bit select rising edge.
		if (mode == FALLING)
		{
			edge	=	0;
		}
		else
		{
			edge	=	1;
		}

		// Select the active edge, set the privilege and sub-privilege levels,
		// and enable the interrupt.	      
	    switch (interruptNum)
	    {
	    	case 0:
				IEC0bits.INT0IE		=	0;
				IFS0bits.INT0IF		=	0;
				INTCONbits.INT0EP	=	edge;
				IPC0bits.INT0IP		=	EXT_INT_IPL;
				IPC0bits.INT0IS		=	EXT_INT_SPL;
				IEC0bits.INT0IE		=	1;
	    		break;

			case 1:
				IEC0bits.INT1IE		=	0;
				IFS0bits.INT1IF		=	0;
				INTCONbits.INT1EP	=	edge;
				IPC1bits.INT1IP		=	EXT_INT_IPL;
				IPC1bits.INT1IS		=	EXT_INT_SPL;
				IEC0bits.INT1IE		=	1;
				break;

			case 2:
				IEC0bits.INT2IE		=	0;
				IFS0bits.INT2IF		=	0;
				INTCONbits.INT2EP	=	edge;
				IPC2bits.INT2IP		=	EXT_INT_IPL;
				IPC2bits.INT2IS		=	EXT_INT_SPL;
				IEC0bits.INT2IE		=	1;
				break;

			case 3:
				IEC0bits.INT3IE		=	0;
				IFS0bits.INT3IF		=	0;
				INTCONbits.INT3EP	=	edge;
				IPC3bits.INT3IP		=	EXT_INT_IPL;
				IPC3bits.INT3IS		=	EXT_INT_SPL;
				IEC0bits.INT3IE		=	1;
				break;

			case 4:
				IEC0bits.INT4IE		=	0;
				IFS0bits.INT4IF		=	0;
				INTCONbits.INT4EP	=	edge;
				IPC4bits.INT4IP		=	EXT_INT_IPL;
				IPC4bits.INT4IS		=	EXT_INT_SPL;
				IEC0bits.INT4IE		=	1;
				break;
		}
	}
}

//************************************************************************
void detachInterrupt(uint8_t interruptNum)
{
	if (interruptNum < EXTERNAL_NUM_INTERRUPTS)
	{
		switch (interruptNum) 
		{
	    	case 0:
				IEC0bits.INT0IE	=	0;
	    		break;

			case 1:
				IEC0bits.INT1IE	=	0;
				break;

			case 2:
				IEC0bits.INT2IE	=	0;
				break;

			case 3:
				IEC0bits.INT3IE	=	0;
				break;

			case 4:
				IEC0bits.INT4IE	=	0;
				break;
		}

		intFunc[interruptNum]	=	0;
	}
}

//************************************************************************
// INT0 ISR
void __ISR(_EXTERNAL_0_VECTOR, ipl4) ExtInt0Handler(void)
{

	if (intFunc[0] != 0)
	{
		(*intFunc[0])();
	}
	IFS0bits.INT0IF	=	0;
}

//************************************************************************
// INT1 ISR
void __ISR(_EXTERNAL_1_VECTOR, ipl4) ExtInt1Handler(void)
{

	if (intFunc[1] != 0)
	{
		(*intFunc[1])();
	}
	IFS0bits.INT1IF	=	0;
}

//************************************************************************
// INT2 ISR
void __ISR(_EXTERNAL_2_VECTOR, ipl4) ExtInt2Handler(void)
{

	if (intFunc[2] != 0)
	{
		(*intFunc[2])();
	}
	IFS0bits.INT2IF	=	0;
}

//************************************************************************
// INT3 ISR
void __ISR(_EXTERNAL_3_VECTOR, ipl4) ExtInt3Handler(void)
{

	if (intFunc[3] != 0)
	{
		(*intFunc[3])();
	}
	IFS0bits.INT3IF	=	0;
}

//************************************************************************
// INT4 ISR
void __ISR(_EXTERNAL_4_VECTOR, ipl4) ExtInt4Handler(void)
{

	if (intFunc[4] != 0)
	{
		(*intFunc[4])();
	}
	IFS0bits.INT4IF	=	0;
}

//************************************************************************

