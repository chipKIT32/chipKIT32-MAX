/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@bug.st>
 * Copyright (c) 2014 by Paul Stoffregen <paul@pjrc.com> (Transaction API)
 * Copyright (c) 2014 by Matthijs Kooijman <matthijs@stdin.nl> (SPISettings AVR)
 * Copyright (c) 2014 by Andrew J. Kroll <xxxajk@gmail.com> (atomicity fixes)
 * SPI Master library for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#include "SPI.h"

#if defined(__PIC32MX1XX__) || defined(__PIC32MX2XX__) || defined(__PIC32MZXX__) || defined(__PIC32MX47X__)
SPIClass SPI(_DSPI0_BASE, _DSPI0_MISO_PIN, _DSPI0_MOSI_PIN, _DSPI0_MISO_IN, _DSPI0_MOSI_OUT);
#else
SPIClass SPI(_DSPI0_BASE);
#endif

#if defined(__PIC32MX1XX__) || defined(__PIC32MX2XX__) || defined(__PIC32MZXX__) || defined(__PIC32MX47X__)
SPIClass::SPIClass(uint32_t base, int pinMI, int pinMO, ppsFunctionType ppsMI, ppsFunctionType ppsMO) {
    pspi = (p32_spi *)base;
    pinMISO = pinMI;
    pinMOSI = pinMO;
    ppsMISO = ppsMI;
    ppsMOSI = ppsMO;
}
#else
SPIClass::SPIClass(uint32_t base) {
    pspi = (p32_spi *)base;
}
#endif


void SPIClass::begin() {
    uint32_t sreg = disableInterrupts();

    if (!initialized) {
#if defined(__PIC32MX1XX__) || defined(__PIC32MX2XX__) || defined(__PIC32MZXX__) || defined(__PIC32MX47X__)
        pinMode(pinMISO, INPUT);
        mapPps(pinMISO, ppsMISO);
        pinMode(pinMOSI, OUTPUT);
        mapPps(pinMOSI, ppsMOSI);
#endif       
        pspi->sxCon.set = (1<<_SPICON_MSTEN) | (1<<_SPICON_ON);
        setClockDivider(SPI_CLOCK_DIV128);
        setDataMode(SPI_MODE0);
    }

    initialized++; // reference count
    restoreInterrupts(sreg);
}

void SPIClass::end() {
    uint32_t sreg = disableInterrupts();

    // Decrease the reference counter
    if (initialized) {
        initialized--;
//        mapPps(pinMISO, 0);
//        mapPps(pinMOSI, 0);
    }

    // If there are no more references disable SPI
    if (!initialized) {
        pspi->sxCon.clr = 1<<_SPICON_ON;
        interruptMode = 0;
#ifdef SPI_TRANSACTION_MISMATCH_LED
        inTransactionFlag = 0;
#endif
    }

    restoreInterrupts(sreg);
}

void SPIClass::usingInterrupt(uint8_t interruptNumber) {
}

void SPIClass::notUsingInterrupt(uint8_t interruptNumber) {
}
