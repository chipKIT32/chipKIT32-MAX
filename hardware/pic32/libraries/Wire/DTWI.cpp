/************************************************************************/
/*                                                                      */
/*    DTWI.cpp                                                          */
/*                                                                      */
/*    DTWI  implemenation                                                */
/*                                                                      */
/************************************************************************/
/*    Author:     Keith Vogel                                           */
/*    Copyright 2014, Digilent Inc.                                     */
/************************************************************************/
/* 
*
* Copyright (c) 2013-2014, Digilent <www.digilentinc.com>
* Contact Digilent for the latest version.
*
* This program is free software; distributed under the terms of 
* BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1.    Redistributions of source code must retain the above copyright notice, this
*        list of conditions and the following disclaimer.
* 2.    Redistributions in binary form must reproduce the above copyright notice,
*        this list of conditions and the following disclaimer in the documentation
*        and/or other materials provided with the distribution.
* 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
*        of its contributors may be used to endorse or promote products derived
*        from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/************************************************************************/
/*  Revision History:                                                   */
/*    8/4/2014(KeithV): Created                                         */
/************************************************************************/
#include <DTWI.h>

#define I2C_BUS_COLLISION_EVENT     0b001
#define I2C_SLAVE_EVENT             0b010
#define I2C_MASTER_EVENT            0b100

#define shiftBus                    0
#define shiftSlave                  1
#define shiftMaster                 2

//#define read_ra(dest) __asm__ __volatile__("move %0,$ra" : "=r" (dest))
//#define read_ra(dest) __asm__ __volatile__("LW %0,28($sp)" : "=r" (dest))
#define read_count(dest) __asm__ __volatile__("mfc0 %0,$9" : "=r" (dest))
#define CORETIMER_TICKS_PER_MICROSECOND		(F_CPU / 2 / 1000000UL)

// this is used for MZ parts
#define pISROffset  ((uint32_t *) &OFF000)

/************************************************************************/
/************************************************************************/
/*                      CONSTRUCTORS                                    */
/************************************************************************/
/************************************************************************/

DTWI::DTWI(p32_i2c * ptwiC, uint8_t irqBusC, uint8_t vecC, uint8_t iplC, uint8_t splC, uint8_t pinSCLC, uint8_t pinSDAC)
{
    int             bnIRQ   = (irqBusC % 32);                           // IE and IF bit locations
    uint32_t        bmI2C   = 0;

    // make sure we don't assert a stop condition
    fStop       = false;
    fMasterMode = false;    // slave mode is sort of always on

    // clear IO buffers
    iReadNext   = 0;
    iReadLast   = 0;
    iWriteNext  = 0;
    iWriteLast  = 0;
    addr        = addrGenCall;
    iSession      = 0;

    // passed in values
    ptwi            = ptwiC;
    ptwi->ixCon.reg = 0;            // make sure the I2C device is OFF

    irqBus          = irqBusC;
    vec             = vecC;
    ipl             = iplC;
    spl             = splC;
    pinSCL          = pinSCLC;
    pinSDA          = pinSDAC;

    // set priority and sub priority
    setIntPriority(vec, ipl, spl);

    // MZ has 2 more vectors to worry about
#if defined(__PIC32MZXX__)

    // the MZ part works off of offset tables
    // We are given the BUS VEC, and we must fill in the 
    // the SLAVE and MASTER VECs as well
    pISROffset[vec+1] = pISROffset[vec];
    pISROffset[vec+2] = pISROffset[vec];

    // and set the priorities for the other 2 vectors.
    setIntPriority(vec+1, ipl, spl);
    setIntPriority(vec+2, ipl, spl);
#endif

    // calculated values
    pregIfs = (((p32_regset *)&IFS0) + (irqBus / 32)); 
    pregIec = (((p32_regset *)&IEC0) + (irqBus / 32));

    bitB = (I2C_BUS_COLLISION_EVENT) << bnIRQ;
    bitMASK = 0;

    bmI2C = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);

    // Disable the interrupt because we don't want to call this until after the begin()
	pregIec->clr = bmI2C;

    // Clear the interrupt flags
	pregIfs->clr = bmI2C;

    // init the state machine state
    curState  = I2C_IDLE; 

    // put a default of 100KHz
    // use F_CPU because __PIC32_pbClk is not set up yet
    // as constructor run before MPIDE Init; however, this would be the correct
    // value at this point as noone has the chance to change the clock freq
    // later we can use __PIC32_pbClk; which is used in masterStart
    ptwi->ixBrg.reg = (F_CPU/FQ100KHz/2) - (((F_CPU / 10000000) * 26) / 25) - 2;

    // put the slave general call address
    ptwi->ixAdd.reg = addrGenCall;

    ptwi->ixCon.reg   = 0;      // turn everything OFF
    ptwi->ixStat.reg  = 0;      // clear the status bits as well
}

/************************************************************************/
/************************************************************************/
/*                      Generic Methods                                 */
/************************************************************************/
/************************************************************************/

/***    DTWI::I2C_STATUS getStatus(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          DTWI::I2C_STATUS
 *              fRead:  True if currently reading from the bus, 
 *                          This is from the device's perspective
 *                          So fRead == true for a slave, means it is a Master write
 *              fWrite: True if currently writing to the bus, 
 *                          This is from the device's perspective
 *                          So fWrite == true for a slave, means it is a Master read
 *              fNacking: True if all reads are being NAK'ed
 *              fBusError: True if a bus error occured. You must stopMaster/Slave to recover
 *              fSlave:    True if a beginSlave was called and the contoller is in Slave mode
 *              fMaster:   True if a beginMaster was called and the controller is in Master mode
 *              fMyBus:     True if you are the owner of the bus
 *              fBusInUse:  True if there is a start condition on the bus, you may or may not be the owener of the bus
 *              fGenCall:   True if you are currently servicing a General Call transaction 
 *              addr:       The current addr being serviced on the bus
 *
 *    Description: 
 *
 *      Notes:
 * ------------------------------------------------------------ */
DTWI::I2C_STATUS DTWI::getStatus(void)
{
    I2C_STATUS          status;

    I2C_STATE volatile  curStateFreeze  = curState;
    bool volatile       fBusInUse       = ptwi->i2cStat.S;
    bool volatile       fBusError       = curStateFreeze == I2C_BUS_ERROR || ptwi->i2cStat.BCL;
    bool volatile       fI2COn          = ptwi->i2cCon.ON;
    bool                fMyBus          = fI2COn && !fBusError && fBusInUse && curStateFreeze != I2C_IDLE;

    // this is a very nasty condition with the Microchip controller. The controller actually does NOT
    // give you an interrupt on a stop condition; on some controller. So we could be looking at status
    // see a stop condition (!S) yet our state machine may not know it. So to keep the state machine and
    // and status in sync, if we notice we lost the bus, yet did not get an interrupt... put ourselves back to the
    // the idle state
    // even worse... the MZ does not put a proper stop condition out, it does a stop than start; we will miss the
    // the stop as no interrupt is fired, but then we jsut see the start again, but that just looks like the old start
    // but if we are polling for a stop... put our state machine in sync with our polling.
    if(!fMyBus && curStateFreeze != I2C_BUS_ERROR && curStateFreeze != I2C_IDLE)
    {
        forceIdleState();
    }

    status.addr         = addr;
    status.iSession     = iSession;
    status.fGenCall     = fMyBus && (status.addr == addrGenCall) && ptwi->i2cCon.GCEN;
    status.fNacking     = !fMyBus || cbToNAK == 0;

    status.fRead        = fMyBus && (curStateFreeze == I2C_DATA_READ || curStateFreeze == I2C_ACK);
    status.fWrite       = fMyBus && curStateFreeze == I2C_DATA_WRITE;
    status.fBusError    = fBusError;
    status.fSlave       = fI2COn && !fMasterMode;
    status.fMaster      = fI2COn && fMasterMode;
    status.fMyBus       = fMyBus;
    status.fBusInUse    = fBusInUse;

    return(status);
}

/***    uint32_t write(const byte * pb, uint32_t cb)
 *
 *    Parameters:
 *          pb: pointer to a byte stream to write to the bus
 *          cb: the number of bytes to write out
 *              
 *    Return Values:
 *          The number of bytes queued for transmit. This may be smaller than cb. 
 *
 *    Description: 
 *         Writes as many bytes as possible to the the transmit buffer and is queued for transmission. The transmit buffer
 *          is small, so not all bytes may be taken. write() should be continually called until all bytes have been accepted.
 *          code something link.....  cbWritten += write(&rgb[cbWritten], cbTotal-cbWritten); should be called until cbWritten == cbTotal.
 *          Writing out a large buffer could take some time to do.
 *
 *          You can call write() at any time, even before you are writting to the bus; this call only loads the transmit buffer and as long as the buffer
 *          is not full it will take some bytes. However, once full, no more bytes will be accepted until bytes are transmitted. The bus clock will be held
 *          low if the transmit buffer is empty.
 *
 *      Notes:
 * ------------------------------------------------------------ */
uint32_t DTWI::write(const byte * pb, uint32_t cb)
{
    uint8_t iNext       = iWriteNext;   // freeze this, interrupt routine updates this  
    uint8_t cbCopy1     = 0;
    uint8_t cbCopy2     = 0;
    bool    fPrime      = transmitting() == 0;

    if(iWriteLast < sizeof(rgbOut))
    {
        cbCopy1 = sizeof(rgbOut) - iWriteLast;
        cbCopy2 = iNext;
    }
    else
    {
        cbCopy1 = sizeof(rgbOut) - (iWriteLast - iNext);
    }

    // get max copy sizes
    cbCopy1 = min(cb, cbCopy1);
    cb -= cbCopy1;
    cbCopy2 = min(cb, cbCopy2);

    if((cbCopy1 + cbCopy2) == 0)
    {
        return(0);
    }

    // do the copies
    if(cbCopy1 > 0)
    {
        memcpy(&rgbOut[iWriteLast % sizeof(rgbOut)], pb, cbCopy1);
        pb += cbCopy1;
    }

    if(cbCopy2 > 0)
    {
        memcpy(rgbOut, pb, cbCopy2);
    }

    // How many bytes actually transferred
    cbCopy1 += cbCopy2;

    // we are going to modify some interrupt variables
    pregIec->clr = bitMASK; // turn off interrupts
    if(iWriteNext >= sizeof(rgbOut))
    {
        iWriteNext -= sizeof(rgbOut);
        iWriteLast -= sizeof(rgbOut);
    }
    iWriteLast += cbCopy1;
    pregIec->set = bitMASK; // turn interrutps back on

    // kick off the state machine and get things writing
    if(fPrime && cbCopy1 > 0)
    {
        primeMasterSlave();
    }

    return(cbCopy1);
}

/***    void DTWI::purge(void)
 *
 *    Parameters:
 *          None
  *              
 *    Return Values:
 *          none
 *
 *    Description: 
 *      Purges the transmit buffer and removes all unwritten bytes from the buffer
 *    
 * ------------------------------------------------------------ */
void DTWI::abort(void)
{
    if(transmitting())
    {
        // we are going to modify some interrupt variables
        pregIec->clr = bitMASK; // turn off interrupts
        iWriteNext = iWriteLast;
        if(iWriteNext >= sizeof(rgbOut))
        {
            iWriteNext -= sizeof(rgbOut);
            iWriteLast -= sizeof(rgbOut);
        }
        pregIec->set = bitMASK; // turn interrutps back on
    }
}

/***    uint32_t read(byte * pb, uint32_t cbMax)
 *
 *    Parameters:
 *          pb: a pointer to a buffer to recieve bytes read
 *          cbMax: The maximum size of the buffer pointed to by pb
 *              
 *    Return Values:
 *          The number of bytes read into pb
 *
 *    Description: 
 *      This can be called at anytime and just gets data out of the recieve buffer. It is even possible that
 *      the data in the recieve buffer was collected from multilple masters. The data is in the order recieved.
 *    
 * ------------------------------------------------------------ */
uint32_t DTWI::read(byte * pb, uint32_t cbMax)
{
    uint8_t iLast = iReadLast;  // freeze this as the interrupt routine modifies it
    uint8_t cbCopy1 = 0;
    uint8_t cbCopy2 = 0;
    bool    fPrime  = available() == sizeof(rgbIn);

    if(iLast > sizeof(rgbIn))
    {
        cbCopy1 = sizeof(rgbIn) - iReadNext;
        cbCopy2 = iLast - sizeof(rgbIn);
    }
    else
    {
        cbCopy1 = iLast - iReadNext;
    }

    // get max copy sizes
    cbCopy1 = min(cbMax, cbCopy1);
    cbMax -= cbCopy1;
    cbCopy2 = min(cbMax, cbCopy2);

    if((cbCopy1 + cbCopy2) == 0)
    {
        return(0);
    }

    // do the copies
    if(cbCopy1 > 0)
    {
        memcpy(pb, &rgbIn[iReadNext % sizeof(rgbIn)], cbCopy1);
        pb += cbCopy1;
    }

    if(cbCopy2 > 0)
    {
        memcpy(pb, rgbIn, cbCopy2);
    }

    // How many bytes actually transferred
    cbCopy1 += cbCopy2;

    // we are going to modify some interrupt variables
    pregIec->clr = bitMASK; // turn off interrupts
    iReadNext += cbCopy1;
    if(iReadNext >= sizeof(rgbIn))
    {
        iReadNext -= sizeof(rgbIn);
        iReadLast -= sizeof(rgbIn);
    }
    pregIec->set = bitMASK; // turn interrutps back on

    // kick off the state machine and get things reading
    if(fPrime && available() < sizeof(rgbIn))
    {
        primeMasterSlave();
    }

    return(cbCopy1);
}

/***    void DTWI::discard(void)
 *
 *    Parameters:
 *          None
  *              
 *    Return Values:
 *          none
 *
 *    Description: 
 *      Flushes the read buffer and removes all unread bytes from the buffer
 *    
 * ------------------------------------------------------------ */
void DTWI::discard(void)
{
    while(available())
    {
        // we are going to modify some interrupt variables
        pregIec->clr = bitMASK; // turn off interrupts
        iReadNext = iReadLast;
        if(iReadNext >= sizeof(rgbIn))
        {
            iReadNext -= sizeof(rgbIn);
            iReadLast -= sizeof(rgbIn);
        }
        pregIec->set = bitMASK; // turn interrutps back on

        // kick off the state machine and get things reading
        primeMasterSlave();
    }
}

/***    bool DTWI::setNAK(uint32_t cbToNak)
 *
 *    Parameters:
 *          cbToNak: The number of bytes to read before a Nak is issues, stoping any more 
 *          data to come in.
 *              
 *    Return Values:
 *          True if it was possible to update the Nak location, false if it was impossible to do
 *
 *    Description: 
 *          cbToNak is based off of what has been currently read by the applicaiton; not counting
 *          what is in the recieve buffer. So it is possible for the application to try and set a Nak
 *          location too low as the byte has already been recieved and is sitting in the receive buffer. Under this
 *          a false will be returned as the Nak can't be set.
 *    
 * ------------------------------------------------------------ */
bool DTWI::setNAK(uint32_t cbToNakT)
{
    bool fRet = false;

    pregIec->clr = bitMASK; // turn off interrupts

    // everything that has come in, we have already ACKed
    // we need 1 more byte to come into NAK, so cbToNakT must be
    // greater than what has already come in for this to work
    if((fRet = (cbToNakT > available())))
    {
        // cbToNak must be > 0
        cbToNAK = cbToNakT - available();
    }
    pregIec->set = bitMASK; // turn on interrupts

    return(fRet);
}

/***    primeMasterSlave
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *          Allows the master state machine to be called from
 *          the application safely. This is used by read() and write() to
 *          bump the state machine to start transmitting or recieving data.
 *    
 * ------------------------------------------------------------ */
void DTWI::primeMasterSlave(void)
{

    // Only do something if it is my bus
    if(!getStatus().fMyBus)
    {                               
        return;
    }

    // master mode, prime the master
    else if(fMasterMode)
    {
        pregIec->clr = (bitB << shiftMaster);
        pregIfs->set = (bitB << shiftMaster);
        pregIec->set = (bitB << shiftMaster);
    }

    // slave mode, prime the slave
    else
    {
        pregIec->clr = (bitB << shiftSlave);
        pregIfs->set = (bitB << shiftSlave);
        pregIec->set = (bitB << shiftSlave);
    }
}

/***    void forceIdleState(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *      This put the controller and state machine back to the Idle state
 *      to either the Master or Slave state machines
 *    
 * ------------------------------------------------------------ */
void DTWI::forceIdleState(void)
{
        uint32_t tStart     = 0;
        uint32_t tCur       = 0;
        uint32_t IEFlags    = pregIec->reg & bitMASK;

        // disable interrupts
        pregIec->clr    = bitMASK;

        // if we are going to turn off the controller
        // nothing in the interrupt flags is going to make sense
        // just clear them
        pregIfs->clr    = bitMASK;

        // go back to the idle state
        curState        = I2C_IDLE;

        // toggle the controller.... very ugly!
        ptwi->i2cCon.ON = 0;

        // let the controller settle
        read_count(tStart);
        do {
            read_count(tCur);
        } while(tCur - tStart < CORETIMER_TICKS_PER_MICROSECOND);

        // turn the controller back on
        ptwi->i2cCon.ON = 1;

        // let the controller settle
        read_count(tStart);
        do {
            read_count(tCur);
        } while(tCur - tStart < CORETIMER_TICKS_PER_MICROSECOND);

        // go back to where we were with interrupts
        pregIec->set    = IEFlags;
}

/************************************************************************/
/************************************************************************/
/*                      MASTER MODE                                     */
/************************************************************************/
/************************************************************************/

/***    bool beginMaster(uint8_t addrSlave)
 *
 *    Parameters:
 *          feqI2C: The freq to run the clock at. By default this is 100KHz
 *              
 *    Return Values:
 *          True if the begin successfully started, false if already in slave mode
 *          or the I2C controller is already in use
 *
 *    Description: 
 *          Puts the I2C controller in Master mode.
 *    
 * ------------------------------------------------------------ */
bool DTWI::beginMaster(I2C_FREQ feqI2C)
{
    // already in master mode
    if(fMasterMode)
    {
        return(true);
    }
    // check that it is one of the allowed frequences
    // the bus must be in a idle state
    else if(ptwi->i2cCon.ON || !(feqI2C == FQ100KHz || feqI2C == FQ400KHz || feqI2C == FQ1MHz) || ptwi->i2cStat.S)
    {
        return(false);
    }

    // turn off interrupts
    pregIec->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);

    // little known fact, the I2C controller will not automatically
    // select digital mode on the pin. So if it was used the pins for
    // the I2C controller will not work. This is particulary true on the MZ
    pinMode(pinSDA, INPUT);
    pinMode(pinSCL, INPUT);

    // put the state machine at the idle state
    curState = I2C_IDLE;
    iSession = 0;

    // make sure we don't assert a stop condition
    fStop = false;

    // we are in Master Mode
    fMasterMode = true;

    // clear all status bits
    ptwi->ixStat.reg = 0;

    // calculate the BRG and set the frequency of the master
    // here we can use __PIC32_pbClk as the MPIDE init code has run by now
    ptwi->ixBrg.reg = (__PIC32_pbClk/feqI2C/2) - (((__PIC32_pbClk / 10000000) * 26) / 25) - 2;

    // enable Master mode interrupts
    bitMASK = bitB | (bitB << shiftMaster);
    pregIfs->clr = bitMASK;

    // turn on the I2C controller, if it is not already ON
    ptwi->i2cCon.ON  = 1; 

    return(true);
}

/***    endMaster(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *      Turns off the I2C controller. This is abrupt and will abort any current operation
 *      stopMaster() or stopSlave() should be successfully called before calling this. However to 
 *      abort all operations, this can be called at any time.
 *    
 * ------------------------------------------------------------ */
void DTWI::endMaster(void)
{
    // if in slave mode, the master is not running
    if(!fMasterMode)
    {
        return;
    }

    // turn off interrupts
    pregIec->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);
    pregIfs->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);
 
    // clear ourselves out of our state
    bitMASK = 0;
    ptwi->i2cCon.ON  = 0; 

    // make sure we don't assert a stop condition
    curState    = I2C_IDLE;
    fStop       = false;
    fMasterMode = false;    // slave mode is sort of always on
    iWriteNext  = 0;
    iWriteLast  = 0;
}

/***    bool startMaster(uint8_t addrSlave, uint32_t cbRead, bool fRead)
 *
 *    Parameters:
 *          addrSlave:  The Slave address the Master wishes to talk too.
 *          cbRead:     How many bytes to read before sending a Nak, this can be changed by setNAK
 *          fRead:      True if we want to start a read from the slave, false if we want to write to the slave.
 *              
 *    Return Values:
 *          True if we got the bus and the slave responded, False if we did not get the connection with the slave
 *
 *    Description: 
 *      Asserts a START condition on the I2C bus, puts the address out AND sets the R /W bit and enables the I2C interrupts
 *      startMaster() can be called before stopMaster(); and if done this way while the application own the bus, it will cause a repeated start condition to be asserted on the bus
 *      If this call fails, someone else may have the bus, or a previous startMaster() may be finishing up writing out the tranmit buffer, continue to call startMaster() until it passes
 *      however, be careful as if someone else has the bus, this may never return true as the bus never becomes available.
 *      If the applicaiton currently does not own the bus, and this call fails, the I2C interrupts will be disabled.
 *      This call is used to implement both  
 *          startMasterRead   
 *          startMasterWrite
 * ------------------------------------------------------------ */
bool DTWI::startMaster(uint8_t addrSlave, uint32_t cbRead, bool fRead)
{
    uint8_t volatile rcvB;  // make volatile so the compiler will actually read the recv buffer and not opt out
    uint32_t    tCur = 0;
    uint32_t    tStart = 0;

    // Not in Master mode, or we still have stuff to transmit, or we initiated a stop condition
    if(!fMasterMode || ptwi->i2cStat.TRSTAT || (ptwi->ixCon.reg & 0b11111))
    {
        return(false);
    }

    // we don't want to take an interrupt right now
    // we want to manually poll that the addr was accepted
    pregIec->clr = bitMASK;
    pregIfs->clr = bitMASK;

    // if we have something in the read buffer, just get it out
    rcvB = ptwi->ixRcv.reg;

    // clear error flags
    ptwi->ixStat.reg = 0;

    // If there is a start condition on the bus and we own the bus
    // we need to do a repeat start
    if(ptwi->i2cStat.S && curState != I2C_IDLE)
    {
        // go back to the idle state
        curState = I2C_IDLE;

        // the lower 5 bits must be set to zero
        while(ptwi->ixCon.reg & 0b11111);

        ptwi->i2cCon.RSEN = 1;

        // wait repeat start to complete
        while(ptwi->i2cCon.RSEN);
    }

    // if there is no start condition on the bus
    else if(!ptwi->i2cStat.S)
    {
        // force an idle state
        curState = I2C_IDLE;

        // the lower 5 bits must be set to zero
        while(ptwi->ixCon.reg & 0b11111);

        // set the start event
        ptwi->i2cCon.SEN = 1;

        // wait for the start condition to complete
        while(ptwi->i2cCon.SEN);
    }

    // someone else has the bus
    else
    {
        return(false);
    }

    // someone else has the bus, it could be a client had SDA held low
    if(ptwi->i2cStat.BCL)
    {
        return(false);
    }

    fStop = false;

    // Write out the address and R/W bit
    ptwi->ixTrn.reg = (addrSlave << 1) | fRead;

    // required settling time on the transmit buffer
    read_count(tStart);
    do {
        read_count(tCur);
    } while(tCur - tStart < (CORETIMER_TICKS_PER_MICROSECOND / 4));

    // release the stretch so we will transmit the byte
//    ptwi->i2cCon.SCLREL = 1;

    // quit if we get a bus conflict OR the transmit compiletes
    // if the TRSTAT get set, we know we got the ACK/NAK
    while(ptwi->i2cStat.BCL == 0 && ptwi->i2cStat.TRSTAT);

    // got a bus collision; we are done and don't have the bus
    if(ptwi->i2cStat.BCL)
    {
        return(false);
    }

    // we got the bus, but the address failed to NAK
    // there is no device so we want to release the bus and get out
    else if(ptwi->i2cStat.ACKSTAT)
    {
        // the lower 5 bits must be set to zero
        while(ptwi->ixCon.reg & 0b11111);
        
        // assert the stop condition
        ptwi->i2cCon.PEN = 1;

        return(false);
    }

    // all is good!
    addr = addrSlave;
    iSession++;

    // if this is a MASTER READ
    if(fRead)
    {
        // how many bytes to read before the NAK
        cbToNAK = cbRead;

        // say we are recieving data
        curState = I2C_DATA_READ;

        // enable recieving data from the slave
        ptwi->i2cCon.RCEN = 1;
    }

    // if this is a MASTER WRITE
    else
    {
        // say we are recieving data
        curState = I2C_DATA_WRITE;
    }

    // re-enable the interrupts
    pregIfs->clr = bitMASK;
    pregIec->set = bitMASK;

    // see if we got the ACK, or NAK or bus collision
    return(true);
}

/***    bool stopMaster(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          True if the a stop condition was asserted on the bus, false if still writing data or
 *          reading data. If true, the I2C interrupts are disabled. If false, continue calling stopMaster() until it succeeds.
 *
 *    Description: 
 *      Assert a stop condition on the I2C bus
 *      You may not be done transimitting data, so call this until it succeeds and you know your data went out.
 * ------------------------------------------------------------ */
bool DTWI::stopMaster(void)
{

    // if not in master mode or not enabled, Master is stopped
    if(!fMasterMode || !ptwi->i2cCon.ON)
    {
        return(true);
    }

    fStop = true;

    // kick off the state machine and get things writing
    primeMasterSlave();

    // assert the stop condition
    if(curState == I2C_WAIT)
    {
        // put the state machine in the idle state
        curState = I2C_IDLE;

        // the lower 5 bits must be set to zero
        while(ptwi->i2cStat.TRSTAT || (ptwi->ixCon.reg & 0b11111));

        // assert the stop condition
#if defined(__PIC32MZXX__)
  
        if(ptwi->i2cStat.ACKSTAT)
        {

            // assert the stop condition
            ptwi->i2cCon.PEN = 1;
        }
        else
        {
            uint32_t        tStart  = 0;
            uint32_t        tCur    = 0;
            uint8_t         port    = digitalPinToPort(pinSDA);
            p32_ioport *	iop     =  (p32_ioport *)portRegisters(port);
            uint32_t        bit     = digitalPinToBitMask(pinSDA);

            iop->lat.clr  = bit;	// put a zero in the latch		
            iop->tris.clr = bit;	// make it an output

            // turn off the I2C controller
            // the low value of the latch will pull
            // the SDA low (hold it low).
            ptwi->i2cCon.ON = 0;

            // wait some time
            read_count(tStart);
            do {
                read_count(tCur);
            } while(tCur - tStart < 5 * CORETIMER_TICKS_PER_MICROSECOND);

            // tri-state the SDA, let the pull up 
            // resistor pull it up
            iop->tris.set = bit;	

            // we have to put some time on the stop condtion
            read_count(tStart);
            do {
                read_count(tCur);
            } while(tCur - tStart < 10 * CORETIMER_TICKS_PER_MICROSECOND);

            // this will clear the controller
            forceIdleState();
        }

#else
        // assert the stop condition
        ptwi->i2cCon.PEN = 1;
#endif

    }

    // if the stop condition has completed or bus error; disable interrupts
    else if(!(ptwi->ixCon.reg & 0b11111) && (curState == I2C_IDLE || curState == I2C_BUS_ERROR))
    {        
        // turn off interrupts
        pregIec->clr    = bitMASK;
        pregIfs->clr    = bitMASK;

        addr            = addrGenCall;
        forceIdleState();

        return(true);
    }

    return(false);
}

/************************************************************************/
/************************************************************************/
/*                      SLAVE  MODE                                     */
/************************************************************************/
/************************************************************************/

/***    bool beginSlave(uint8_t addrSlave, bool fGenCall)
 *
 *    Parameters:
 *          addrSlave:  The address to respond to as the slave
 *          fGenCall:   True if the application wants to respond to the GenCall address as well. by default this is false
 *              
 *    Return Values:
 *          True if the the I2C controller successfully initialized for slave mode. False if already in Master mode or someone else is using the controller.
 *
 *    Description:
 *          Initializes the I2C controller for slave mode. Interrupts are NOT enabled until startSlave() is called.
 *    
 * ------------------------------------------------------------ */
bool DTWI::beginSlave(uint8_t addrSlave, uint32_t cbToNak, bool fGenCall)
{ 
    uint8_t volatile rcvB;  // make volatile so the compiler will actually read the recv buffer and not opt out

    // if in master mode, we can't begin the slave
    if(fMasterMode || ptwi->i2cCon.ON)
    {
        return(false);
    }

    // turn off interrupts
    pregIec->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);

    // little known fact, the I2C controller will not automatically
    // select digital mode on the pin. So if it was used the pins for
    // the I2C controller will not work. This is particulary true on the MZ
    pinMode(pinSDA, INPUT);
    pinMode(pinSCL, INPUT);

    // we are in the idle state
    curState = I2C_IDLE;
    iSession = 0;

    // set how long until a NAK
    cbToNAK = cbToNak;

    // get the address we are listening on
    addr = addrSlave;

    // see if general call is enabled
    ptwi->i2cCon.GCEN = fGenCall;

    // say we do not want to go into a stop condition
    fStop = false;

    // put the slave address in
    ptwi->ixAdd.reg = addrSlave;

    // turn on clk stretching
    ptwi->i2cCon.STREN   = 1;

    // enable Master mode interrupts
    bitMASK = bitB | (bitB << shiftSlave);

    // turn on the I2C controller, if it is not already ON
    ptwi->i2cCon.ON  = 1; 

    // if we have something in the read buffer, just get it out
    rcvB = ptwi->ixRcv.reg;

    // make sure the clock is released
    // actually don't because we don't want to accept data
    // until we can read it from the buffer
    //ptwi->i2cCon.SCLREL = 1; 

    // clear all status bits
    ptwi->ixStat.reg = 0;

    // clear interrupt flags
    pregIfs->clr = bitMASK;

    // turn interrupts on
    pregIec->set = bitMASK;

    return(true);
}

/***    bool stopSlave(void)
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          true if the I2C stops listening on the bus. False if still writing data out. Keep calling this until it passes to ensure
 *          all data is written to the Master.
 *
 *    Description: 
 *          Turns of the slave controller by disabling the slave interrupts; and reseting the slave state machine
 *    
 * ------------------------------------------------------------ */
bool DTWI::endSlave(bool fForce)
{
    if(fMasterMode || !ptwi->i2cCon.ON)
        return(true);

    // stop after everything is written out
    fStop = true;

    primeMasterSlave();

    // if we are done.
    if(fForce || !getStatus().fMyBus)
    {
        // turn off all interrupts
        pregIec->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);
        pregIfs->clr = bitB | (bitB << shiftSlave) | (bitB << shiftMaster);

        // turn off the controller
        ptwi->i2cCon.ON  = 0; 

        // clear ourselves out of our state
        bitMASK = 0;
 
        // make sure we don't assert a stop condition
        curState    = I2C_IDLE;
        fStop       = false;
        fMasterMode = false;    // slave mode is sort of always on
        iWriteNext  = 0;
        iWriteLast  = 0;
        addr        = addrGenCall;

        return(true);
    }

    return(false);
}

/************************************************************************/
/************************************************************************/
/*                      STATE MACHINE CODE                              */
/************************************************************************/
/************************************************************************/

/***    stateMachine
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *      This is the master interrupt routine for the I2C controller and vectors
 *      to either the Master or Slave state machines
 *    
 * ------------------------------------------------------------ */
void __attribute__((nomips16)) DTWI::stateMachine(void)
{
    uint32_t bitS   = (bitB << shiftSlave);
    uint32_t bitM   = (bitB << shiftMaster);
    uint32_t bitBSM = bitB | bitS | bitM;
     
    // as long as we have interrupts to process, process them
    while(pregIfs->reg & bitBSM)
    {
        // save the ifs, so we can clear ifs and make sure
        // we don't miss an interrupt while processing
        // ints could be coming fast.
        uint32_t ifs = pregIfs->reg;

        // clear IFS flags to make sure I catch a missed interrupt
        pregIfs->clr = bitBSM;

        // got an error, go to the idle state.
        if(ifs & bitB)
        {
            // turn off interrupts, we are not to be on the bus
            pregIec->clr    = bitBSM;
            curState        = I2C_BUS_ERROR;
            return;
        }

        // otherwise a Master or Slave interrupt
        else
        {
            // slave interrupt
            if(ifs & bitS)
            {
                // if we see an address bit, we know we are starting over; this could be a repeated start
                // We must have the start condition asserted, an address in the recv buffer and it be an address
                // Or if we see a stop condition, we are idle
                if(ptwi->i2cStat.P)
                {
                    curState = I2C_IDLE;
                }
                else if(!ptwi->i2cStat.D_A && ptwi->i2cStat.RBF && ptwi->i2cStat.S)
                {
                    curState = I2C_IDLE;
                }

                slaveMachine();
            }

            // master interrupt
            if(ifs & bitM)
            {
                // if we see a stop condition, go to the idle state
                if(!ptwi->i2cStat.S || ptwi->i2cStat.P)
                {
                    curState = I2C_IDLE;
                }

                masterMachine();
            }
        }
    }
}

/***    masterMachine
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *          This is the master state machine called by the interrupt service routine
 *    
 * ------------------------------------------------------------ */
void __attribute__((nomips16)) DTWI::masterMachine(void)
{
    switch(curState)
    {
         case I2C_ACK:

            // if it was a NAK we are done, just wait
            if(ptwi->i2cStat.ACKSTAT || fStop)
            {
                curState = I2C_WAIT;
            }

            // otherwise initiate for another read
            // if we have room for another byte, lets recieve it
            // otherwise we will just halt the clock until we can read
            // some more data.
            else if((iReadLast - iReadNext) < sizeof(rgbIn))
            {
                // the lower 5 bits must be set to zero
                while(ptwi->ixCon.reg & 0b11111);

                curState = I2C_DATA_READ;
                ptwi->i2cCon.RCEN = 1;
            }
            break;

        // got a read
        case I2C_DATA_READ:
            if(ptwi->i2cStat.RBF)
            {
                rgbIn[iReadLast % sizeof(rgbIn)] = ptwi->ixRcv.reg;
                iReadLast++;

                if(cbToNAK != recvInfinite)
                {
                    cbToNAK--;
                }
                curState = I2C_ACK;
         
                ptwi->i2cCon.ACKDT = (cbToNAK == 0 || fStop);  // /ACK NAK value
                ptwi->i2cCon.ACKEN = 1;  //send the ACK
            }

            // we are told to finish
            else if(fStop)
            {
                curState = I2C_WAIT;
            }
            break;

        // if we have a write
        case I2C_DATA_WRITE:

            // only if the transmit engine is idle
            if(!ptwi->i2cStat.TRSTAT && !ptwi->i2cStat.TBF)
            {
                // get a NAK from the other side, or asked to stop by user
                if(ptwi->i2cStat.ACKSTAT || (fStop && iWriteNext == iWriteLast))
                {
                    curState = I2C_WAIT;
                }

                // otherwise keep writing data out
                else if(iWriteNext < iWriteLast)
                {
                    uint32_t tStart;
                    uint32_t tCur;

                    ptwi->ixTrn.reg = rgbOut[iWriteNext % sizeof(rgbOut)];
 
                    // we need 250ns (1/4 usec) for setup time
                    read_count(tStart);

                    // update the next pointer
                    // it is okay to go beyond the buffer
                    // because we use the modulo, and the write
                    // funciton will adjust the index down
                    iWriteNext++;

                    // required settling time on the transmit buffer
                    do {
                        read_count(tCur);
                    } while(tCur - tStart < (CORETIMER_TICKS_PER_MICROSECOND / 4));

                    // release the stretch so we will transmit the byte
 //                   ptwi->i2cCon.SCLREL = 1;

                }
            }
            break;

        case I2C_WAIT:
        case I2C_IDLE:
        case I2C_BUS_ERROR:
        default:
            break;
       
    }
}

/***    slaveMachine
 *
 *    Parameters:
 *          None
 *              
 *    Return Values:
 *          None
 *
 *    Description: 
 *          This is the slave state machine called by the interrupt routine.
 *    
 * ------------------------------------------------------------ */
void __attribute__((nomips16)) DTWI::slaveMachine(void)
{
    I2C_STATE passState;

    // we must loop because we my need to transmit after the address
    // so keep looping until the state is repeated
    do
    {
        passState = curState;
        switch(curState)
        {

            case I2C_IDLE:

                if(ptwi->i2cStat.RBF)
                {
                    // what we are expecting is and address being sent
                    if(!ptwi->i2cStat.D_A)
                    {
                        uint8_t rcvB = ptwi->ixRcv.reg;

                        // save the address away, this might be different than the init addr
                        // if we enabled the fGenCall, it might be the general call address
                        // remember to shift off the R/W bit
                        addr = rcvB >> 1;
                        iSession++;           // say we saw a start condition

                        // see if this is a Read or Write from the Master perspective
                        // or Write or Read from the slave perspective
                        if(ptwi->i2cStat.R_W)
                        {
                            curState = I2C_DATA_WRITE;      // Master R, slave W
                            ptwi->i2cStat.IWCOL = 0;         // clear write collisions
                        }

                        // we are not excepting data
                        else if(cbToNAK == 0)
                        {
                            curState            = I2C_IDLE; // we are not doing reads
                            ptwi->i2cStat.I2COV  = 1;        // make it so we NAK
                        }
                 
                        else
                        {
                            curState = I2C_DATA_READ;   // Master W, slave R
                            ptwi->i2cStat.I2COV = 0;     // clear overflow 

                            // not needed on an MX as this is auto released on an address
                            // read, not so on an MZ. we need to release it
                            // buffer because
                            ptwi->i2cCon.SCLREL = 1;     // release the clk stretching 
                        }
                    }
                }

                // I just don't know what this is
                // in the idle state I need to get an address... or I just don't know what to do with it
                // Just get rid of it...
                else
                {
                    uint8_t rcvB = ptwi->ixRcv.reg;
                    ptwi->i2cStat.I2COV = 0;     // clear overflow
                    ptwi->i2cCon.SCLREL = 1;     // release the clk stretching 
                }

                break;

            case I2C_DATA_READ:
                if(ptwi->i2cStat.RBF && iReadLast - iReadNext < sizeof(rgbIn))
                {
                    rgbIn[iReadLast % sizeof(rgbIn)] = ptwi->ixRcv.reg;
                    iReadLast++;

                    if(cbToNAK != recvInfinite && cbToNAK != 0)
                    {
                        cbToNAK--;
                    }
         
                    // if we are done reading data, release the clk and go
                    // to an I2C_WAIT state
                    if(cbToNAK == 0)
                    {
                        curState = I2C_WAIT;        // we are done with the reads
                    }

                    ptwi->i2cCon.SCLREL = 1;     // release the clk stretching 
                }
                break;

            case I2C_DATA_WRITE:

                // get a NAK from the other side
                // I really don't know what to do because
                // the master is clocking me, but he asked me to stop
                // transmitting. So just release the clock and quit
                if(ptwi->i2cStat.ACKSTAT)
                {
                    curState = I2C_IDLE;
                }

                // normal case, the write register is open
                else if(!ptwi->i2cStat.TBF)
                {

                    // we have something to write
                    if(iWriteNext < iWriteLast)
                    {
                        uint32_t tStart;
                        uint32_t tCur;

                        // load the buffer
                        ptwi->ixTrn.reg = rgbOut[iWriteNext % sizeof(rgbOut)];
                        
                        // we need 250ns (1/4 usec) for setup time
                        read_count(tStart);

                        // update the next pointer
                        // it is okay to go beyond the buffer
                        // because we use the modulo, and the write
                        // funciton will adjust the index down
                        iWriteNext++;

                        // required settling time on the transmit buffer
                        do {
                            read_count(tCur);
                        } while(tCur - tStart < (CORETIMER_TICKS_PER_MICROSECOND / 4));

                        // release the stretch so we will transmit the byte
                        ptwi->i2cCon.SCLREL = 1;
                    }

                    // if we are to stop
                    else if(fStop)
                    {
                        curState = I2C_WAIT;
                    }
                }
                break;

            case I2C_WAIT:
                ptwi->i2cStat.I2COV  = 1;    // Cause a NAK
                ptwi->i2cCon.SCLREL  = 1;    // release the clk
                curState = I2C_IDLE;
                break;

            case I2C_BUS_ERROR:
            default:
                break;
        }

    } while(curState != passState);
}

/************************************************************************/
/************************************************************************/
/*                      OBJECTS INSTANCES AND INTERRUPTS                */
/************************************************************************/
/************************************************************************/

#ifdef _DTWI0_BASE
DTWI0 * DTWI0::pDTWI0 = NULL;

// the class methods
DTWI0::DTWI0() : DTWI(((p32_i2c *) _DTWI0_BASE), _DTWI0_BUS_IRQ, _DTWI0_VECTOR, _DTWI0_IPL, _DTWI0_SPL, _DTWI0_SCL_PIN, _DTWI0_SDA_PIN) 
{
    // save the instance away so the interrupt routine can
    // get back to this instance
    pDTWI0 = this;

    // set the interrupt vector
    setIntVector(_DTWI0_VECTOR, IntDtwi0Handler);
};

// the associated interrupt routine.
#if defined(__PIC32MZXX__)
void __attribute__((nomips16,vector(_DTWI0_VECTOR),interrupt(_DTWI0_IPL_ISR))) IntDtwi0Handler(void)
#else
void __attribute__((interrupt(),nomips16)) IntDtwi0Handler(void)
#endif
{
    DTWI0::pDTWI0->stateMachine();
}
#endif

#ifdef _DTWI1_BASE
DTWI1 * DTWI1::pDTWI1 = NULL;

// the class methods
DTWI1::DTWI1() : DTWI(((p32_i2c *) _DTWI1_BASE), _DTWI1_BUS_IRQ, _DTWI1_VECTOR, _DTWI1_IPL, _DTWI1_SPL, _DTWI1_SCL_PIN, _DTWI1_SDA_PIN) 
{
    // save the instance away so the interrupt routine can
    // get back to this instance
    pDTWI1 = this;

    // set the interrupt vector
    setIntVector(_DTWI1_VECTOR, IntDtwi1Handler);
};

// the associated interrupt routine.
#if defined(__PIC32MZXX__)
void __attribute__((nomips16,vector(_DTWI1_VECTOR),interrupt(_DTWI1_IPL_ISR))) IntDtwi1Handler(void)
#else
void __attribute__((interrupt(),nomips16)) IntDtwi1Handler(void)
#endif
{
    DTWI1::pDTWI1->stateMachine();
}
#endif

#ifdef _DTWI2_BASE
DTWI2 * DTWI2::pDTWI2 = NULL;

// the class methods
DTWI2::DTWI2() : DTWI(((p32_i2c *) _DTWI2_BASE), _DTWI2_BUS_IRQ, _DTWI2_VECTOR, _DTWI2_IPL, _DTWI2_SPL, _DTWI2_SCL_PIN, _DTWI2_SDA_PIN) 
{
    // save the instance away so the interrupt routine can
    // get back to this instance
    pDTWI2 = this;

    // set the interrupt vector
    setIntVector(_DTWI2_VECTOR, IntDtwi2Handler);
};

// the associated interrupt routine.
#if defined(__PIC32MZXX__)
void __attribute__((nomips16,vector(_DTWI2_VECTOR),interrupt(_DTWI2_IPL_ISR))) IntDtwi2Handler(void)
#else
void __attribute__((interrupt(),nomips16)) IntDtwi2Handler(void)
#endif
{
    DTWI2::pDTWI2->stateMachine();
}
#endif

#ifdef _DTWI3_BASE
DTWI3 * DTWI3::pDTWI3 = NULL;

// the class methods
DTWI3::DTWI3() : DTWI(((p32_i2c *) _DTWI3_BASE), _DTWI3_BUS_IRQ, _DTWI3_VECTOR, _DTWI3_IPL, _DTWI3_SPL, _DTWI3_SCL_PIN, _DTWI3_SDA_PIN) 
{
    // save the instance away so the interrupt routine can
    // get back to this instance
    pDTWI3 = this;

    // set the interrupt vector
    setIntVector(_DTWI3_VECTOR, IntDtwi3Handler);
};

// the associated interrupt routine.
#if defined(__PIC32MZXX__)
void __attribute__((nomips16,vector(_DTWI3_VECTOR),interrupt(_DTWI3_IPL_ISR))) IntDtwi3Handler(void)
#else
void __attribute__((interrupt(),nomips16)) IntDtwi3Handler(void)
#endif
{
    DTWI3::pDTWI3->stateMachine();
}
#endif

#ifdef _DTWI4_BASE
DTWI4 * DTWI4::pDTWI4 = NULL;

// the class methods
DTWI4::DTWI4() : DTWI(((p32_i2c *) _DTWI4_BASE), _DTWI4_BUS_IRQ, _DTWI4_VECTOR, _DTWI4_IPL, _DTWI4_SPL, _DTWI4_SCL_PIN, _DTWI4_SDA_PIN) 
{
    // save the instance away so the interrupt routine can
    // get back to this instance
    pDTWI4 = this;

    // set the interrupt vector
    setIntVector(_DTWI4_VECTOR, IntDtwi4Handler);
};

// the associated interrupt routine.
#if defined(__PIC32MZXX__)
void __attribute__((nomips16,vector(_DTWI4_VECTOR),interrupt(_DTWI4_IPL_ISR))) IntDtwi4Handler(void)
#else
void __attribute__((interrupt(),nomips16)) IntDtwi4Handler(void)
#endif
{
    DTWI4::pDTWI4->stateMachine();
}
#endif



