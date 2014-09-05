/*********************************************************************
 *
 * Software License Agreement
 *
 * This software is developed by Microchip Technology Inc. and its
 * subsidiaries ("Microchip").
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1.      Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * 2.      Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * 3.      Microchip's name may not be used to endorse or promote products
 * derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY MICROCHIP "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * MICROCHIP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWSOEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ********************************************************************/

#include <p32xxxx.h>
#include <System_Defs.h>

// MZ has a totally different interrupt
// mechanism, so we don't need this table.
#if !defined(__PIC32MZXX__)

.extern _isr_primary_install

.globl __use_isr_install
__use_isr_install:

#if (__C32_VERSION__ < 200)
# define USE_OLD_DOTSECTION
#endif

#ifdef USE_OLD_DOTSECTION
# define CODE_SECTION(name) .section name, "ax", @progbits
#else
# define CODE_SECTION(name) .section name, code
#endif
#define VECTOR_SYMBOLNAME(number) __vector_ ## number
#define VECTOR_SECTIONNAME(number) .vector_new_ ## number

#define NEWLINE_MACRO \n

#define VECTOR_ENTRY(number)  \
  .globl VECTOR_SYMBOLNAME(number); \
  CODE_SECTION(VECTOR_SECTIONNAME(number)); \
  .align 2; \
  .set nomips16; \
  .set nomicromips; \
  .ent VECTOR_SYMBOLNAME(number); \
  .type VECTOR_SYMBOLNAME(number), @function; \
  VECTOR_SYMBOLNAME(number):;\
    lui      k0,%hi(_isr_primary_install); \
    addiu    k0,k0,%lo(_isr_primary_install); \
    lw       k0,4 * number (k0); \
    jr       k0; \
    .end VECTOR_SYMBOLNAME(number); \
    .size VECTOR_SYMBOLNAME(number), .-VECTOR_SYMBOLNAME(number);

 VECTOR_ENTRY(0)
 VECTOR_ENTRY(1)
 VECTOR_ENTRY(2)
 VECTOR_ENTRY(3)
 VECTOR_ENTRY(4)
 VECTOR_ENTRY(5)
 VECTOR_ENTRY(6)
 VECTOR_ENTRY(7)
 VECTOR_ENTRY(8)
 VECTOR_ENTRY(9)
 VECTOR_ENTRY(10)
 VECTOR_ENTRY(11)
 VECTOR_ENTRY(12)
 VECTOR_ENTRY(13)
 VECTOR_ENTRY(14)
 VECTOR_ENTRY(15)
 VECTOR_ENTRY(16)
 VECTOR_ENTRY(17)
 VECTOR_ENTRY(18)
 VECTOR_ENTRY(19)
 VECTOR_ENTRY(20)
 VECTOR_ENTRY(21)
 VECTOR_ENTRY(22)
 VECTOR_ENTRY(23)
 VECTOR_ENTRY(24)
 VECTOR_ENTRY(25)
 VECTOR_ENTRY(26)
 VECTOR_ENTRY(27)
 VECTOR_ENTRY(28)
 VECTOR_ENTRY(29)
 VECTOR_ENTRY(30)
 VECTOR_ENTRY(31)
 VECTOR_ENTRY(32)
 VECTOR_ENTRY(33)
 VECTOR_ENTRY(34)
 VECTOR_ENTRY(35)
 VECTOR_ENTRY(36)
 VECTOR_ENTRY(37)
 VECTOR_ENTRY(38)
 VECTOR_ENTRY(39)
 VECTOR_ENTRY(40)
 VECTOR_ENTRY(41)
 VECTOR_ENTRY(42)
 VECTOR_ENTRY(43)
 VECTOR_ENTRY(44)
 VECTOR_ENTRY(45)
 VECTOR_ENTRY(46)
 VECTOR_ENTRY(47)
 VECTOR_ENTRY(48)
 VECTOR_ENTRY(49)
 VECTOR_ENTRY(50)
 VECTOR_ENTRY(51)
 VECTOR_ENTRY(52)
 VECTOR_ENTRY(53)
 VECTOR_ENTRY(54)
 VECTOR_ENTRY(55)
 VECTOR_ENTRY(56)
 VECTOR_ENTRY(57)
 VECTOR_ENTRY(58)
 VECTOR_ENTRY(59)
 VECTOR_ENTRY(60)
 VECTOR_ENTRY(61)
 VECTOR_ENTRY(62)
 VECTOR_ENTRY(63)


#endif // not an MZ
