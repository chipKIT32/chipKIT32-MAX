/* -*- mode: jde; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
  Part of the Wiring project - http://wiring.org.co
  Copyright (c) 2004-06 Hernando Barragan
  Modified 13 August 2006, David A. Mellis for Arduino - http://www.arduino.cc/
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
  
  $Id$
*/
//************************************************************************
//*	Edit History
//************************************************************************
//*	May 19,	2010	<MLS> Modifed for Pic32, which does not have srandom or random(void)
//************************************************************************

extern "C" {
  #include <stdlib.h>
  #include <math.h>
}

// Enable (if not enabled) the PRNG and obtain a fresh number from it.
#if defined(__PIC32MZ__)
#include <p32xxxx.h>
unsigned int prngmz() {
//    static unsigned int lastPRNGValue = 0;

    if (RNGCONbits.PRNGEN == 0) {
        // The TRNG doesn't work yet, but when it does it can be used
        // to seed the PRNG.  Even better, we may just use the TRNG.
        //RNGCONbits.TRNGEN = 1;
        //RNGCONbits.LOAD = 1;
        RNGPOLY1 = 0x00C00003;
        RNGPOLY2 = 0x00000000;
        RNGNUMGEN1 = 0x090a0b0c;
        RNGNUMGEN2 = 0x0d0e0f10;
        RNGCONbits.PLEN = 42;
        RNGCONbits.CONT = 0;
        RNGCONbits.PRNGEN = 1;
    }

    return RNGNUMGEN1;
}
#endif

//************************************************************************
void randomSeed(unsigned int seed)
{
	if (seed != 0)
	{
	#if defined(__PIC32MX__)
		srand(seed);
	#elif defined(__PIC32MZ__)
        RNGCONbits.PRNGEN = 0;
        RNGSEED1 = seed;
        RNGSEED2 = 0;
        RNGCONbits.PRNGEN = 1;
    #else
		srandom(seed);
	#endif
	}
}

//************************************************************************
long random(long howbig)
{
	if (howbig == 0)
	{
		return 0;
	}
#if defined(__PIC32MX__)
	return rand() % howbig;
#elif defined(__PIC32MZ__)
    return prngmz() % howbig;
#else
	return random() % howbig;
#endif
}

//************************************************************************
long random(long howsmall, long howbig)
{
  if (howsmall >= howbig)
  {
    return howsmall;
  }
  long diff = howbig - howsmall;
  return random(diff) + howsmall;
}

//************************************************************************
long map(long x, long in_min, long in_max, long out_min, long out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

unsigned int makeWord(unsigned int w) { return w; }
unsigned int makeWord(unsigned char h, unsigned char l) { return (h << 8) | l; }
