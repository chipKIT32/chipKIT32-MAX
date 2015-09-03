/*
 * Copyright (c) 2010 by Cristian Maglie <c.maglie@bug.st>
 * Copyright (c) 2014 by Paul Stoffregen <paul@pjrc.com> (Transaction API)
 * Copyright (c) 2014 by Matthijs Kooijman <matthijs@stdin.nl> (SPISettings AVR)
 * Copyright (c) 2014 by Andrew J. Kroll <xxxajk@gmail.com> (atomicity fixes)
 * Copyright (c) 2015 by Majenko Technologies <matt@majenko.co.uk> (port to chipKIT)
 * SPI Master library for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#ifndef _SPI_H_INCLUDED
#define _SPI_H_INCLUDED

#define OPT_BOARD_INTERNAL

#include <Arduino.h>

// SPI_HAS_TRANSACTION means SPI has beginTransaction(), endTransaction(),
// usingInterrupt(), and SPISetting(clock, bitOrder, dataMode)
#define SPI_HAS_TRANSACTION 1

// SPI_HAS_NOTUSINGINTERRUPT means that SPI has notUsingInterrupt() method
#define SPI_HAS_NOTUSINGINTERRUPT 1

// SPI_ATOMIC_VERSION means that SPI has atomicity fixes and what version.
// This way when there is a bug fix you can check this define to alert users
// of your code if it uses better version of this library.
// This also implies everything that SPI_HAS_TRANSACTION as documented above is
// available too.
#define SPI_ATOMIC_VERSION 1

// Uncomment this line to add detection of mismatched begin/end transactions.
// A mismatch occurs if other libraries fail to use SPI.endTransaction() for
// each SPI.beginTransaction().  Connect an LED to this pin.  The LED will turn
// on if any mismatch is ever detected.
//#define SPI_TRANSACTION_MISMATCH_LED 5

#ifndef LSBFIRST
#define LSBFIRST 0
#endif
#ifndef MSBFIRST
#define MSBFIRST 1
#endif

#define SPI_CLOCK_DIV4 0x00
#define SPI_CLOCK_DIV16 0x01
#define SPI_CLOCK_DIV64 0x02
#define SPI_CLOCK_DIV128 0x03
#define SPI_CLOCK_DIV2 0x04
#define SPI_CLOCK_DIV8 0x05
#define SPI_CLOCK_DIV32 0x06

#define SPI_MODE0 0x00
#define SPI_MODE1 0x04
#define SPI_MODE2 0x08
#define SPI_MODE3 0x0C

#define SPI_MODE_MASK 0x0C  // CPOL = bit 3, CPHA = bit 2 on SPCR
#define SPI_CLOCK_MASK 0x03  // SPR1 = bit 1, SPR0 = bit 0 on SPCR
#define SPI_2XCLOCK_MASK 0x01  // SPI2X = bit 0 on SPSR

// define SPI_AVR_EIMSK for AVR boards with external interrupt pins
#if defined(EIMSK)
#define SPI_AVR_EIMSK  EIMSK
#elif defined(GICR)
#define SPI_AVR_EIMSK  GICR
#elif defined(GIMSK)
#define SPI_AVR_EIMSK  GIMSK
#endif

class SPISettings {
public:
    SPISettings(uint32_t clock, uint8_t bitOrder, uint8_t dataMode) {
        if (__builtin_constant_p(clock)) {
            init_AlwaysInline(clock, bitOrder, dataMode);
        } else {
            init_MightInline(clock, bitOrder, dataMode);
        }
    }
    SPISettings() {
        init_AlwaysInline(4000000, MSBFIRST, SPI_MODE0);
    }
private:
    void init_MightInline(uint32_t clock, uint8_t bitOrder, uint8_t dataMode) {
        init_AlwaysInline(clock, bitOrder, dataMode);
    }
    void init_AlwaysInline(uint32_t clock, uint8_t bitOrder, uint8_t dataMode)
    __attribute__((__always_inline__)) {
        /* Compute the baud rate divider for this frequency.
        */
        brg = (uint16_t)((__PIC32_pbClk / (2 * clock)) - 1);

        /* That the baud rate value is in the correct range.
        */
        if (brg == 0xFFFF) {
            /* The user tried to set a frequency that is too high to support.
            ** Set it to the highest supported frequency.
            */
            brg = 0;
        }

        if (brg > 0x1FF) {
            /* The user tried to set a frequency that is too low to support.
            ** Set it to the lowest supported frequency.
            */
            brg = 0x1FF;
        }

        con = (1 << _SPICON_MSTEN);

        switch (dataMode) {
            case SPI_MODE0:
                con |= ((0 << _SPICON_CKP) | (1 << _SPICON_CKE));
                break;

            case SPI_MODE1:
                con |= ((0 << _SPICON_CKP) | (0 << _SPICON_CKE));
                break;

            case SPI_MODE2:
                con |= ((1 << _SPICON_CKP) | (1 << _SPICON_CKE));
                break;

            case SPI_MODE3:
                con |= ((1 << _SPICON_CKP) | (0 << _SPICON_CKE));
                break;
        }
    }
    uint8_t brg;
    uint8_t con;
    friend class SPIClass;
};


class SPIClass {
public:

#if defined(__PIC32MX1XX__) || defined(__PIC32MX2XX__) || defined(__PIC32MZXX__) || defined(__PIC32MX47X__)
    SPIClass(uint32_t base, int pinMI, int pinMO, ppsFunctionType ppsMI, ppsFunctionType ppsMO);
#else
    SPIClass(uint32_t base);
#endif

    // Initialize the SPI library
    void begin();

    // If SPI is used from within an interrupt, this function registers
    // that interrupt with the SPI library, so beginTransaction() can
    // prevent conflicts.  The input interruptNumber is the number used
    // with attachInterrupt.  If SPI is used from a different interrupt
    // (eg, a timer), interruptNumber should be 255.
    void usingInterrupt(uint8_t interruptNumber);
    // And this does the opposite.
    void notUsingInterrupt(uint8_t interruptNumber);
    // Note: the usingInterrupt and notUsingInterrupt functions should
    // not to be called from ISR context or inside a transaction.
    // For details see:
    // https://github.com/arduino/Arduino/pull/2381
    // https://github.com/arduino/Arduino/pull/2449

    // Before using SPI.transfer() or asserting chip select pins,
    // this function is used to gain exclusive access to the SPI bus
    // and configure the correct settings.
    inline void beginTransaction(SPISettings settings) {
        if (interruptMode > 0) {
            int32_t sreg = disableInterrupts();
            interruptSave = sreg;
        }

#ifdef SPI_TRANSACTION_MISMATCH_LED

        if (inTransactionFlag) {
            pinMode(SPI_TRANSACTION_MISMATCH_LED, OUTPUT);
            digitalWrite(SPI_TRANSACTION_MISMATCH_LED, HIGH);
        }

        inTransactionFlag = 1;
#endif
        pspi->sxCon.clr = (1 << _SPICON_ON);
        pspi->sxBrg.reg = settings.brg;
        pspi->sxCon.reg = settings.con;
        pspi->sxCon.set = (1 << _SPICON_ON);
    }

    // Write to the SPI bus (MOSI pin) and also receive (MISO pin)
    inline uint8_t transfer(uint8_t data) {
        while ((pspi->sxStat.reg & (1 << _SPISTAT_SPITBE)) == 0) {
        }

        pspi->sxBuf.reg = data;

        while ((pspi->sxStat.reg & (1 << _SPISTAT_SPIRBF)) == 0) {
        }

        return pspi->sxBuf.reg;
    }
    inline uint16_t transfer16(uint16_t data) {
        pspi->sxCon.set = 1 << _SPICON_MODE16;

        while ((pspi->sxStat.reg & (1 << _SPISTAT_SPITBE)) == 0) {
        }

        pspi->sxBuf.reg = data;

        while ((pspi->sxStat.reg & (1 << _SPISTAT_SPIRBF)) == 0) {
        }

        pspi->sxCon.clr = 1 << _SPICON_MODE16;
        return pspi->sxBuf.reg;
    }
    inline void transfer(void *buf, size_t count) {
        uint8_t *p = (uint8_t *)buf;
        for (size_t i = 0; i < count; i++) {
            p[i] = transfer(p[i]);
        }
    }
    // After performing a group of transfers and releasing the chip select
    // signal, this function allows others to access the SPI bus
    inline void endTransaction(void) {
#ifdef SPI_TRANSACTION_MISMATCH_LED

        if (!inTransactionFlag) {
            pinMode(SPI_TRANSACTION_MISMATCH_LED, OUTPUT);
            digitalWrite(SPI_TRANSACTION_MISMATCH_LED, HIGH);
        }

        inTransactionFlag = 0;
#endif

        if (interruptMode > 0) {
            restoreInterrupts(interruptSave);
        }
    }

    // Disable the SPI bus
    void end();

    // This function is deprecated.  New applications should use
    // beginTransaction() to configure SPI settings.
    inline void setBitOrder(uint8_t bitOrder) {
        // Not supported
    }
    // This function is deprecated.  New applications should use
    // beginTransaction() to configure SPI settings.
    inline void setDataMode(uint8_t dataMode) {
        switch (dataMode) {
            case SPI_MODE0:
                pspi->sxCon.clr = 1 << _SPICON_CKP;
                pspi->sxCon.set = 1 << _SPICON_CKE;
                break;

            case SPI_MODE1:
                pspi->sxCon.clr = 1 << _SPICON_CKP;
                pspi->sxCon.clr = 1 << _SPICON_CKE;
                break;

            case SPI_MODE2:
                pspi->sxCon.set = 1 << _SPICON_CKP;
                pspi->sxCon.set = 1 << _SPICON_CKE;
                break;

            case SPI_MODE3:
                pspi->sxCon.set = 1 << _SPICON_CKP;
                pspi->sxCon.clr = 1 << _SPICON_CKE;
                break;
        }
    }
    // This function is deprecated.  New applications should use
    // beginTransaction() to configure SPI settings.
    inline void setClockDivider(uint8_t clockDiv) {
        switch (clockDiv) {
            case SPI_CLOCK_DIV2:
                pspi->sxBrg.reg = 1;
                break;

            case SPI_CLOCK_DIV4:
                pspi->sxBrg.reg = 3;
                break;

            case SPI_CLOCK_DIV8:
                pspi->sxBrg.reg = 7;
                break;

            case SPI_CLOCK_DIV16:
                pspi->sxBrg.reg = 15;
                break;

            case SPI_CLOCK_DIV32:
                pspi->sxBrg.reg = 31;
                break;

            case SPI_CLOCK_DIV64:
                pspi->sxBrg.reg = 63;
                break;

            case SPI_CLOCK_DIV128:
                pspi->sxBrg.reg = 127;
                break;
        }
    }
    // These undocumented functions should not be used.  SPI.transfer()
    // polls the hardware flag which is automatically cleared as the
    // AVR responds to SPI's interrupt
    inline void attachInterrupt() { }
    inline void detachInterrupt() { }

private:
    uint32_t initialized;
    uint32_t interruptMode; // 0=none, 1=mask, 2=global
    uint32_t interruptMask; // which interrupts to mask
    uint32_t interruptSave; // temp storage, to restore state
#ifdef SPI_TRANSACTION_MISMATCH_LED
    uint32_t inTransactionFlag;
#endif
    p32_spi *pspi;
#if defined(__PIC32MX1XX__) || defined(__PIC32MX2XX__) || defined(__PIC32MZXX__) || defined(__PIC32MX47X__)
    uint8_t             pinMISO;        //digital pin number for MISO
    uint8_t             pinMOSI;        //digital pin number for MOSI
    ppsFunctionType     ppsMISO;        //PPS select for SPI MISO
    ppsFunctionType     ppsMOSI;        //PPS select for SPI MOSI
#endif

};

extern SPIClass SPI;

#endif
