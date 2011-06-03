//************************************************************************
//*	wiring.h
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010,2011 by Mark Sproul
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
//*	Boston, MA	02111-1307	USA
//*	
//*	
//************************************************************************
//*	Edit History
//************************************************************************
//*	May  ?,	2011	Brian Schmalz worked on micros timers
//*	May 18,	2011	<MLS> Added prog_xxx defs because there is no "pgmspace.h" file for pic32
//*	May 23,	2011	<MLS> Added definitions for PROGMEM,  pgm_read_byte_near, pgm_read_byte_far
//************************************************************************

#ifndef Wiring_h
#define Wiring_h

#if defined(__AVR__)
	#include <avr/io.h>
#endif
#include <inttypes.h>
#include "binary.h"

#include "cpudefs.h"	//*		This file is designed to provide some of the cpu specific definitions
						//*		that are available for avr chips and not for other chips (i.e. pic32)

#ifdef __cplusplus
extern "C"{
#endif

#define HIGH 0x1
#define LOW  0x0

#define INPUT 0x0
#define OUTPUT 0x1

#define true 0x1
#define false 0x0

#define PI 3.1415926535897932384626433832795
#define HALF_PI 1.5707963267948966192313216916398
#define TWO_PI 6.283185307179586476925286766559
#define DEG_TO_RAD 0.017453292519943295769236907684886
#define RAD_TO_DEG 57.295779513082320876798154814105

#define SERIAL  0x0
#define DISPLAY 0x1

#define LSBFIRST 0
#define MSBFIRST 1

#define CHANGE 1
#define FALLING 2
#define RISING 3

#define INTERNAL 3
#define DEFAULT 1
#define EXTERNAL 0

// undefine stdlib's abs if encountered
#ifdef abs
#undef abs
#endif

#define min(a,b) ((a)<(b)?(a):(b))
#define max(a,b) ((a)>(b)?(a):(b))
#define abs(x) ((x)>0?(x):-(x))
#define constrain(amt,low,high) ((amt)<(low)?(low):((amt)>(high)?(high):(amt)))
#define round(x)     ((x)>=0?(long)((x)+0.5):(long)((x)-0.5))
#define radians(deg) ((deg)*DEG_TO_RAD)
#define degrees(rad) ((rad)*RAD_TO_DEG)
#define sq(x) ((x)*(x))

#define interrupts() INTEnableInterrupts()
#define noInterrupts() INTDisableInterrupts()

#define clockCyclesPerMicrosecond() ( F_CPU / 1000000L )
#define clockCyclesToMicroseconds(a) ( (a) / clockCyclesPerMicrosecond() )
#define microsecondsToClockCycles(a) ( (a) * clockCyclesPerMicrosecond() )

#define lowByte(w) ((uint8_t) ((w) & 0xff))
#define highByte(w) ((uint8_t) ((w) >> 8))

#define bitRead(value, bit) (((value) >> (bit)) & 0x01)
#define bitSet(value, bit) ((value) |= (1UL << (bit)))
#define bitClear(value, bit) ((value) &= ~(1UL << (bit)))
#define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))

typedef unsigned int word;

#define bit(b) (1UL << (b))

typedef uint8_t boolean;
typedef uint8_t byte;

void init(void);

void	pinMode(uint8_t pin, uint8_t mode);
uint8_t	getPinMode(uint8_t pin);
void	digitalWrite(uint8_t pin, uint8_t val);
int		digitalRead(uint8_t pin);
int		analogRead(uint8_t);
void	analogReference(uint8_t mode);
void	analogWrite(uint8_t, int);


unsigned long	millis(void);
unsigned long	micros(void);
void			delay(unsigned long);
void			delayMicroseconds(unsigned int us);
unsigned long	pulseIn(uint8_t pin, uint8_t state, unsigned long timeout);

void			shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, byte val);

void attachInterrupt(uint8_t, void (*)(void), int mode);
void detachInterrupt(uint8_t);

void setup(void);
void loop(void);

#ifdef __cplusplus
} // extern "C"
#endif

#if !defined(__AVR__)
	#define PROGMEM
	#define pgm_read_byte_near(x)	(*((char *)x))
	#define pgm_read_byte_far(x)	(*((char *)x))
	#define pgm_read_word_near(x)	(*((short *)x))
	#define pgm_read_workd_far(x)	(*((short *)x))


	#define	prog_void		const void
	#define	prog_char		const char
	#define	prog_uchar		const unsigned char
	#define	prog_int8_t		const int8_t
	#define	prog_uint8_t	const uint8_t
	#define	prog_int16_t	const int16_t
	#define	prog_uint16_t	const uint16_t
	#define	prog_int32_t	const int32_t
	#define	prog_uint32_t	const uint32_t
	#define	prog_int64_t	const int64_t
	#define	prog_uint64_t	const uint64_t
#endif

#if defined(__PIC32MX__)
	extern unsigned int	__PIC32_pbClk;
#endif

#endif
