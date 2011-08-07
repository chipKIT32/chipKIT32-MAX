/*
 * Copyright (c) 2011 Digilent
 * Interrupt handeler for Servo Master library for PIC arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
*/



#ifndef int_h
#define int_h


#include <p32xxxx.h>
#include <plib.h>
#include <WProgram.h> 
#include <inttypes.h>

//define timer priority
#define TIMER4 0 // timer2 is the first timer used
#define TIMER5 1
#define TIMER3 2


void initISR(int timer);
void handle_interrupts(int timer, volatile unsigned int *TMRn, volatile unsigned int* PR);

#endif