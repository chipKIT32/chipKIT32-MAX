/************************************************************************/
/*                                                                      */
/*    DTWI.h                                                            */
/*                                                                      */
/*    I2C  implemenation                                                */
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
#if !defined(_DTWI_H_)
#define	_DTWI_H_

#include	<Arduino.h>

/* ------------------------------------------------------------ */
/*					Miscellaneous Declarations					*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */
/*					Variable Declarations						*/
/* ------------------------------------------------------------ */


/* ------------------------------------------------------------ */
/*					Function Declarations						*/
/* ------------------------------------------------------------ */

/* Forward declarations for the interrupt service routines.
** These functions need to be declared so that they can be declared
** as friends of the DSPI class, so that they can call the private
** method doDspiInterrupt
*/
#ifdef __cplusplus
extern "C" {
	void __attribute__((nomips16)) IntDtwi0Handler(void);
	void __attribute__((nomips16)) IntDtwi1Handler(void);
	void __attribute__((nomips16)) IntDtwi2Handler(void);
	void __attribute__((nomips16)) IntDtwi3Handler(void);
	void __attribute__((nomips16)) IntDtwi4Handler(void);
};

/* ------------------------------------------------------------ */
/*					Object Class Declarations					*/
/* ------------------------------------------------------------ */

class DTWI {

    // needed to call the stateMachine
    friend void __attribute__((nomips16)) IntDtwi0Handler(void);
    friend void __attribute__((nomips16)) IntDtwi1Handler(void);
    friend void __attribute__((nomips16)) IntDtwi2Handler(void);
    friend void __attribute__((nomips16)) IntDtwi3Handler(void);
    friend void __attribute__((nomips16)) IntDtwi4Handler(void);

public:
    uint8_t static const    addrGenCall         = 0;
    uint8_t static const    addrStartByte       = 1;
    uint8_t static const    addrCBUS0           = 2;
    uint8_t static const    addrCBUS1           = 3;
    uint8_t static const    addrDiffBusFormat0  = 4;
    uint8_t static const    addrDiffBusFormat1  = 5;
    uint8_t static const    addrResrv0          = 6;
    uint8_t static const    addrResrv1          = 7;

    // these are masks that can be used on I2C_STATUS.status dword
    uint32_t static const   SLAVEADDR           = 0x0000FFFF;
    uint32_t static const   SESSION_ID          = 0x000F0000;
    uint32_t static const   GEN_CALL            = 0x10000000;
    uint32_t static const   BUS_IN_USE          = 0x08000000;
    uint32_t static const   MY_BUS              = 0x04000000;
    uint32_t static const   MASTER_MODE         = 0x02000000;
    uint32_t static const   SLAVE_MODE          = 0x01000000;
    uint32_t static const   BUS_ERROR           = 0x00800000;
    uint32_t static const   NAKING              = 0x00400000;
    uint32_t static const   WRITE               = 0x00200000;
    uint32_t static const   READ                = 0x00100000;

    uint32_t static const   recvInfinite        = 0xFFFFFFFF;

    typedef struct I2C_STATUS_T
    {
        union
        {
            uint32_t            status;             // 32 bit status word for faster access
            struct 
            {
                uint16_t         addr;              // current slave address on the bus; only valid if fMyBus == true
                union 
                {
                    uint16_t flags;
                    struct
                    {
                        unsigned int    iSession    : 4;    // This is the current session ID, will change if another stop/start has occured
                        bool            fRead       : 1;    // currently bytes are being recieved off of the bus
                        bool            fWrite      : 1;    // currently bytes are being transmitted on the bus
                        bool            fNacking    : 1;    // On read, a NAK will be asserted on the 9th bit
                        bool            fBusError   : 1;    // a bus error has occured; interrupts are probably disabled
                        bool            fSlave      : 1;    // I2C controller is in Slave mode
                        bool            fMaster     : 1;    // I2C controller is in Master mode
                        bool            fMyBus      : 1;    // You currently own the bus
                        bool            fBusInUse   : 1;    // the bus is in use by you or someone else, there is a start conditon on the bus
                        bool            fGenCall    : 1;    // In slave mode, the General call address will be accepted
                        bool            resv        : 3;
                    };
                };
            };
        };
    } __attribute__((packed)) I2C_STATUS;

    typedef enum
    {
        FQ0Hz       = 0,
        FQ100KHz    = 100000,
        FQ400KHz    = 400000,
        FQ1MHz      = 1000000
    } I2C_FREQ;

protected:
	DTWI(p32_i2c * ptwiC, uint8_t irqBusC, uint8_t vecC, uint8_t iplC, uint8_t splC, uint8_t pinSCLC, uint8_t pinSDAC);

private:

    typedef enum
    {
        I2C_IDLE,
        I2C_BUS_ERROR,
        I2C_DATA_READ,
        I2C_DATA_WRITE,
        I2C_ACK,
        I2C_WAIT,
    } I2C_STATE;

    I2C_STATE           curState;       // current state of the I2C controller
    p32_i2c *           ptwi;           // i2c register
    p32_regset *	    pregIfs;        // interrupt flag register
    p32_regset *	    pregIec;        // interrupt enable register
    uint32_t            bitB;           // interrupt Fault (Bus), bit for the IEC and IFS, shifted to the approprieate location
    uint32_t            bitMASK;        // interrupt Mask currently in use, is Master, or Slave on?
    uint32_t volatile   cbToNAK;        // how many bytes to read until a NAK is sent
    bool     volatile   fStop;          // stop the MASTER after the reads or writes   
    bool                fMasterMode;    // we are in master mode if true, slave mode if false
    uint16_t            addr;           // address of current endpoint
    uint8_t             irqBus;         // IRQ for the Fault, Master is +1, Slave is +2
    uint8_t             vec;            // vector for all 3 IRQs on MX, vector for fault on MZ (Master is +1,Slave +2)
    uint8_t             ipl;            // interrupt priority level
    uint8_t             spl;            // interrupt subpriority level
    uint8_t             pinSDA;         // so we can put the SDA in digial input mode
    uint8_t             pinSCL;         // so we can put the SCL in digial input mode

    // the only item modified by the interrupt routine is the pWriteNext pointer... everything else is stable in the interrupt routine
    uint8_t volatile    iWriteNext;     // Next byte to write out
    uint8_t             iWriteLast;     // one past the last byte to write out
    uint8_t             iReadNext;      // Next byte to read
    uint8_t volatile    iReadLast;      // one past the last byte to read
    uint8_t volatile    iSession;       // The current session number
    byte                rgbOut[32];     // Output buffer; max size 127, do not exceed
    byte                rgbIn[32];      // Input buffer; max size 127, do not exceed
  
    DTWI();                             // do not allow constructor with no params

    void __attribute__((nomips16)) stateMachine(void);
    void __attribute__((nomips16)) slaveMachine(void);
    void __attribute__((nomips16)) masterMachine(void);

    void primeMasterSlave(void);
    bool startMaster(uint8_t addrSlave, uint32_t cbRead, bool fRead);
    void forceIdleState(void);

public:

    // MASTER methods
    bool beginMaster(I2C_FREQ feqI2C=FQ100KHz);
    void endMaster(void);

    bool startMasterWrite(uint8_t addrSlave)
    {
        return(startMaster(addrSlave, 0, false));
    }
    bool startMasterRead(uint8_t addrSlave, uint32_t cbRead=recvInfinite)
    {
        return(startMaster(addrSlave, cbRead, true));
    }
    bool stopMaster(void);

    // SLAVE methods
    bool beginSlave(uint8_t addrSlave, uint32_t cbToNak, bool fGenCall);
    bool beginSlave(uint8_t addrSlave)
    {
        return(beginSlave(addrSlave, recvInfinite, false));
    }
    bool beginSlave(uint8_t addrSlave, uint32_t cbToNak)
    {
        return(beginSlave(addrSlave, cbToNak, false));
    }
    bool beginSlave(uint8_t addrSlave, bool fGenCall)
    {
        return(beginSlave(addrSlave, recvInfinite, fGenCall));
    }
    bool endSlave(bool fForce = false);

    // COMMON read methods to both Master and Slave
    uint32_t read(byte * pb, uint32_t cbMax);
    void discard(void);
    uint32_t available(void)
    {
        // how many bytes in the recieve buffer still to read.
        return(iReadLast - iReadNext);
    }

    // COMMON write methods to both Master and Slave
    uint32_t write(const byte * pb, uint32_t cbWrite);
    void abort(void);
    uint32_t transmitting(void)
    {
        // how many bytes in the transmit buffer yet to write
        return(iWriteLast - iWriteNext);
    }

    // COMMON methods to both Master and Slave
    bool setNAK(uint32_t cbToNak);
    I2C_STATUS getStatus(void);
};

class DTWI0 : public DTWI {

    // needed to get to pDTWI
    friend void __attribute__((nomips16)) IntDtwi0Handler(void);

private:
    static DTWI0 * pDTWI0;

public:
    DTWI0();
};

class DTWI1 : public DTWI {

    // needed to get to pDTWI
    friend void __attribute__((nomips16)) IntDtwi1Handler(void);

private:
    static DTWI1 * pDTWI1;

public:
    DTWI1();
};

class DTWI2 : public DTWI {

    // needed to get to pDTWI
    friend void __attribute__((nomips16)) IntDtwi2Handler(void);

private:
    static DTWI2 * pDTWI2;

public:
    DTWI2();
};

class DTWI3 : public DTWI {

    // needed to get to pDTWI
    friend void __attribute__((nomips16)) IntDtwi3Handler(void);

private:
    static DTWI3 * pDTWI3;

public:
    DTWI3();
};

class DTWI4 : public DTWI {

    // needed to get to pDTWI
    friend void __attribute__((nomips16)) IntDtwi4Handler(void);

private:
    static DTWI4 * pDTWI4;

public:
    DTWI4();
};
#endif // C++

/* ------------------------------------------------------------ */

#endif	// _DTWI_H_

/************************************************************************/
