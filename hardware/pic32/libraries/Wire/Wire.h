/*
  TwoWire.h - TWI/I2C library for Arduino & Wiring
  Copyright (c) 2006 Nicholas Zambetti.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

/* 
 * Wire library BUGS
 * =================
 *
 * Multiple init bug - bperrybap
 * -----------------------------
 * What I saw is that there is some sort of h/w initialization issue in the twi_init() code.
 * I tracked it down to the twi_init() function down in the pic32 libraries/Wire/utility/twi.c
 * Here is the line that creates the issue:
 * 
 * // Enable the interrupt controller and turn on clock stretching.
 * ptwi->ixCon.reg = (1 << _I2CCON_ON) | (1 << _I2CCON_STREN);
 * 
 * But it is more complex than just that line.
 * 
 * The system really doesn't lock up there, as the twi_init() function does return.
 * It gets stuck on future Wire calls.
 */


/*
 * Wire library TODO List
 * ======================
 *
 * There is a major flaw in the twi_init function which, if called twice,
 * causes the I2C interface to lock up, and all subsequent transfers will
 * cause the system to freeze waiting for transfers to complete.  Armour
 * code has been added to circumvent the problem, but a proper investigation
 * needs to be done into why (see above).
 *
 * The armor code needs to have a bus deconfiguration routine written to
 * reset the I2C bus to a clean state (as it was before begin was called)
 * so that the whole module can be disabled any time and re-enabled cleanly
 * later.
 */

#ifndef TwoWire_h
#define TwoWire_h

#include <inttypes.h>

#define BUFFER_LENGTH 32

// Uncomment this to enable the end function
//#define ENABLE_END 1

class TwoWire
{
  private:
    static uint8_t rxBuffer[];
    static uint8_t rxBufferIndex;
    static uint8_t rxBufferLength;

    static uint8_t txAddress;
    static uint8_t txBuffer[];
    static uint8_t txBufferIndex;
    static uint8_t txBufferLength;

    static uint8_t transmitting;
    static void (*user_onRequest)(void);
    static void (*user_onReceive)(int);
    static void onRequestService(void);
    static void onReceiveService(uint8_t*, int);

    static uint32_t beginCount;

  public:
    TwoWire();
    void begin();
#ifdef ENABLE_END
    void end();
#endif
    void begin(uint8_t);
    void begin(int);
    void beginTransmission(uint8_t);
    void beginTransmission(int);
    uint8_t endTransmission(void);
    uint8_t requestFrom(uint8_t, uint8_t);
    uint8_t requestFrom(int, int);
    void __attribute__((deprecated("Use write() instead"))) send(uint8_t);
    void __attribute__((deprecated("Use write() instead"))) send(uint8_t*, uint8_t);
    void __attribute__((deprecated("Use write() instead"))) send(int);
    void __attribute__((deprecated("Use write() instead"))) send(char*);
    int write(uint8_t);
    int write(uint8_t*, uint8_t);
    int write(int);
    int write(char*);
    uint8_t available(void);
    uint8_t __attribute__((deprecated("Use read() instead"))) receive(void);
    uint8_t read(void);
    void onReceive( void (*)(int) );
    void onRequest( void (*)(void) );
};

extern TwoWire Wire;

#endif

