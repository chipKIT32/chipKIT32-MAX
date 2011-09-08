/************************************************************************/
/*																		*/
/*	int.c	--	Handles timer interrupts for PIC32      				*/
/*																		*/
/************************************************************************/
/*	Author:		Michelle Yu                                             */
/*                          											*/
/*	Copyright 2011, Digilent Inc.										*/
/*  This library is free software; you can redistribute it and/or       */
/*  modify it under the terms of the GNU Lesser General Public          */
/*  License as published by the Free Software Foundation; either        */
/*  version 2.1 of the License, or (at your option) any later version.  */
/*                                                                      */
/*  This library is distributed in the hope that it will be useful,     */
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of      */
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU   */
/*  Lesser General Public License for more details.                     */
/*                                                                      */
/*  You should have received a copy of the GNU Lesser General Public    */
/*  License along with this library; if not, write to the Free Software */
/*  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA           */
/*  02110-1301 USA                                                      */
/************************************************************************/
/*  File Description:													*/
/*	This file declares functions that handle timer interrupts for       */
/*  chipKIT PIC32 boards.												*/
//************************************************************************
//*	Edit History
//************************************************************************
//*	Aug 18,	2011	<MichelleY> file header comment block reformatted
//*	Sep  5,	2011	<GeneA> Added include of p32xxxx.h and plib.h to fix
//*						compile errors intoduced when include of plib.h was removed
//*						HardwareSerial.h
//************************************************************************

#include <p32xxxx.h>
#include <plib.h>

#include "int.h"

#define INT_T3 12
#define INT_T4 16
#define INT_T5 20


void __ISR(INT_T3, ipl7) T3_IntHandler (void){
 	handle_interrupts(TIMER3, &TMR3, &PR3); 
	IFS0CLR = 0x1000; // Clear timer interrupt status flag
}


void __ISR(INT_T4, ipl7) T4_IntHandler (void){
 	handle_interrupts(TIMER4, &TMR4, &PR4); 
	IFS0CLR = 0x10000; // Clear timer interrupt status flag
}

void __ISR(INT_T5, ipl7) T5_IntHandler (void){
 	handle_interrupts(TIMER5, &TMR5, &PR5); 
	IFS0CLR = 0x100000; // Clear timer interrupt status flag
}



void initISR(int timer)
{  
    
    INTEnableSystemMultiVectoredInt();
    if(timer == TIMER3)
    {
         //timer 3 set clock period 20ms 
        T3CON = 0x0060; // set prescalar 1:64
        TMR3 = 0;
        PR3 = 0x61A8;

        
           
	    IFS0CLR = 0x1000;// Clear the T3 interrupt flag 
	    IEC0SET = 0x1000;// Enable T3 interrupt 
     

	    IPC3SET = 0x00001D;// Set T3 interrupt priority to 7, Subpriority to 1
	    
       
	    T3CONSET = 0x8000;// Enable Timer3
    }
    if(timer == TIMER4)
    {
        //timer 4 set clock period 20ms 
        T4CON = 0x0060; // set prescalar 1:64
        TMR4 = 0;
        PR4 = 0x61A8;

        
           
	    IFS0CLR = 0x10000;// Clear the T4 interrupt flag 
	    IEC0SET = 0x10000;// Enable T4 interrupt 
     

	    IPC4SET = 0x00001F;// Set T4 interrupt priority to 7, Subpriority to 3
	    
       
	    T4CONSET = 0x8000;// Enable Timer4
	 
    }
    if(timer == TIMER5)
    {
         //timer 5 set clock period 20ms 
        T5CON = 0x0060; // set prescalar 1:64
        TMR5 = 0;
        PR5 = 0x61A8;

        
           
	    IFS0CLR = 0x100000;// Clear the T5 interrupt flag 
	    IEC0SET = 0x100000;// Enable T5 interrupt 
     

	    IPC5SET = 0x00001E;// Set T5 interrupt priority to 7, Subpriority to 2
	    
       
	    T5CONSET = 0x8000;// Enable Timer5
    }
    

    
} 

