/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@bug.st>
 * SPI Master library for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#ifndef _SPI_H_INCLUDED
#define _SPI_H_INCLUDED

#include <plib.h>
#include <stdio.h>

/*	SPIxCON
*/
#define bnOn	15
#define bnSmp	9
#define bnCkp	6
#define bnMsten 5

/*	SPIxSTAT
*/
#define bnTbf	1

/*	IEC0
*/
#define bnSPI1RXIE	25
#define bnSPI1TXIE	24

#define SPI_CLOCK_DIV4 0x01
#define SPI_CLOCK_DIV16 0x7
#define SPI_CLOCK_DIV64 0x1F
#define SPI_CLOCK_DIV128 0x3F
#define SPI_CLOCK_DIV2 0x00
#define SPI_CLOCK_DIV8 0x03
#define SPI_CLOCK_DIV32 0x0F

#define SPI_MODE0 0x00
#define SPI_MODE1 0x200
#define SPI_MODE2 0x40
#define SPI_MODE3 0x240

class SPIClass {
public:
  inline static byte transfer(byte _data);

  // SPI Configuration methods

  inline static void attachInterrupt();
  inline static void detachInterrupt(); // Default

  static void begin(); // Default
  static void end();

  static void setBitOrder(uint8_t);
  static void setDataMode(uint8_t);
  static void setClockDivider(uint8_t);
};

extern SPIClass SPI;

byte SPIClass::transfer(byte _data) {
  SPI1BUF = _data;
  while (SPITBF & ( 1 << bnTbf )
    ;
  return SPI1BUF;
}

void SPIClass::attachInterrupt() {
  IECOSET = ( 1 << bnSPI1RXIE ) | ( 1 << bnSPI1TXIE ); // Setting Interupt Enable
}

void SPIClass::detachInterrupt() {
  IECOCLR = ( 1 << bnSPI1RXIE ) | ( 1 << bnSPI1TXIE ); // Setting Interrupt Disable
}

#endif
