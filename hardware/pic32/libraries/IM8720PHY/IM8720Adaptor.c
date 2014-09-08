/************************************************************************/
/*                                                                      */
/*	IM8720Adaptor.c This implements a Nework adaptor                    */
/*	for the MX6/7 internal MAC with 8720 PHY                            */
/*                                                                      */
/************************************************************************/
/*  Author:     Keith Vogel                                             */
/*  Copyright 2013, Digilent Inc.                                       */
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
/*  Module Description:                                                 */
/*                                                                      */
/*	Internal MAC adaptor with 8720 PHY for deIP                         */
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*	8/9/2013(KeithV): Created                                           */
/*                                                                      */
/************************************************************************/
#include "..\DEIPck\utility\deIP.h"
#include "IM8720Adaptor.h"

#define FOREVER             (0xFFFFFFFF)
#define PhyAddrFromVir(_pB) (((uint32_t) (_pB)) & 0x1FFFFFFF)
#define RAMAddrFromPhy(_pB) ((void *) ((_pB) | 0xA0000000))


#pragma pack(push,1)                    // we want to have control over this structure

typedef struct ETHDCPT_T {
    volatile union {
        volatile struct {
            unsigned                        : 7;
            unsigned        eOwn            : 1;
            unsigned        npv             : 1;
            unsigned                        : 7;
            unsigned        cbEDBuff        : 11;   // 1 - 2047 size of bytes this desciptor, set on trans, look on recv
            unsigned                        : 3;
            unsigned        eop             : 1;
            unsigned        sop             : 1;
        };
        uint32_t u32;
    } hdr;
    uint32_t                uEDBuff;        // ul-physical pointer to the data

    volatile union
    {
        // transmit values
        volatile struct TX_T
        {
            uint16_t            cbTransmitted;      // number of bytes trasmitted for this packet including collisions, could be a lot more than the packet size
            union
            {
                struct
                {
                    unsigned    controlFrame    : 1;
                    unsigned    pauseFrame      : 1;
                    unsigned    backPressure    : 1;
                    unsigned    vlanFrame       : 1;
                    unsigned                    : 4;
                };
                uint8_t         tsvHigh;
            };
            union
            {
                struct
                {
                    unsigned    user0           : 1;
                    unsigned    user1           : 1;
                    unsigned    user2           : 1;
                    unsigned    user3           : 1;
                    unsigned    user4           : 1;
                    unsigned    user5           : 1;
                    unsigned    user6           : 1;
                    unsigned    user7           : 1;
                };
                uint8_t         userFlags;
            };

            uint16_t            cbFrame;        // return value, how many byes in the frame were transmitted.
            union
            {
                struct
                {
                    unsigned    cCollision          : 4;
                    unsigned    crcError            : 1;
                    unsigned    lenCheckError       : 1;
                    unsigned    lenOutOfRange       : 1;
                    unsigned    done                : 1;
                    unsigned    multicast           : 1;
                    unsigned    broadcast           : 1;
                    unsigned    deferred            : 1;
                    unsigned    deferredExceeded    : 1;
                    unsigned    maxCollision        : 1;
                    unsigned    lateCollision       : 1;
                    unsigned    giantFrame          : 1;
                    unsigned    underRead           : 1;
                };
                uint16_t        tsv;            // transmit Status Vector
            };
        } tx;

        // RX Values
        volatile struct RX_T
        {
            uint16_t            checksum;
            union
            {
                struct
                {
                    unsigned    user0           : 1;
                    unsigned    user1           : 1;
                    unsigned    user2           : 1;
                    unsigned    user3           : 1;
                    unsigned    user4           : 1;
                    unsigned    user5           : 1;
                    unsigned    user6           : 1;
                    unsigned    user7           : 1;
                };
                uint8_t         userFlags;
            };
            union
            {
                struct
                {
                    unsigned    fRuntPkt        : 1;
                    unsigned    fNotUMCastMatch : 1;
                    unsigned    fHashMatch      : 1;
                    unsigned    fMagicPkt       : 1;
                    unsigned    fPatternMatch   : 1;
                    unsigned    fUnicastMatch   : 1;
                    unsigned    fBroadcast      : 1;
                    unsigned    fMulticastMatch : 1;
                };
                uint8_t         rxfRsv;         // Recieve Filter Status Vector
            };
            uint16_t            cbRcv;          // how many bytes came in on the frame
            union
            {
                struct
                {
                    unsigned    evLongDrop          : 1;
                    unsigned    evPrevSeen          : 1;
                    unsigned    evCarrierPrevSeen   : 1;
                    unsigned    codeViolation       : 1;
                    unsigned    crcError            : 1;
                    unsigned    lenCheckError       : 1;
                    unsigned    lenOutOfRange       : 1;
                    unsigned    ok                  : 1;
                    unsigned    multicast           : 1;
                    unsigned    broadcast           : 1;
                    unsigned    dribbleNibble       : 1;
                    unsigned    controlFrame        : 1;
                    unsigned    pauseFrame          : 1;
                    unsigned    unknownlFrame       : 1;
                    unsigned    vlanFrame           : 1;
                    unsigned                        : 1;
                };
                uint16_t        rsv;                // Receive Status Vector
            };
        } rx;
    };
//    uint32_t                pPhyDcptNext;           // physical address
} ETHDCPT;

// allocate static input buffer space
// flow control requires that we have 2*1536 at the high water mark
// therefore we must have at least 3 * 1536 bytes.
// but lets have a little more, say 4 * 1536 == 6144 == 6K
#define CBMAXETHPKT     (1536)
#define CMAXETHPKT      (4)
#define CBRXDCPTBUFF    (128)                           // This is tuned as a balance between the number of discriptors and size wasting empty space at the end of a discriptor
//#define IRXBUFSZ        (CBRXDCPTBUFF >> 4)           // this CBRXDCPTBUFF / 16; This is a magic number for the ethernet controller
#define CBRXBUFFTOTAL   (CMAXETHPKT * CBMAXETHPKT)      // how much buffer space we have for incoming frames
#define CRXDCPT         (CBRXBUFFTOTAL / CBRXDCPTBUFF)  // check that this works out to be even ie with a modulo of zero
#define IRXFWM          (CRXDCPT - ((CBMAXETHPKT * 2) / CBRXDCPTBUFF))
#define IRXEWM          (CBMAXETHPKT /CBRXDCPTBUFF)

#define iGetNextRxDcpt(_iCur) ((_iCur + 1) % CRXDCPT)

// on the transmit side we know what is coming at us...
// an IPStack has...
// 1:Frame, 2:IPHeader, 3:Transport hdr, and 4. payload.
// so to trasmitt we might need 4 descriptor and one to terminate == 5.
// now lets say we can handle 3 transmits at once...
// that is 15 descriptors.
#define CTXDCPPERIPSTACK    (5)

static void ProcessRxPacket(void);

/*****************************************************************************/
/************************* Static Memory usage *******************************/
/*****************************************************************************/
// To implement mult adaptors, some of these can not be static
// we have a real problem in that the Internal MAC has only 1 MAC, so how
// do we handle multiple PHYs with only 1 MAC?
static uint8_t myPhyID = 0;

static uint8_t rxBuffer[CBRXBUFFTOTAL];    // the rx buffer space
static ETHDCPT rxDcpt[CRXDCPT+1];          // the +1 is the terminating descriptor, or room for a loop back pointer
static ETHDCPT txDcpt[CTXDCPPERIPSTACK];   // just big enough for a transmit of an IPSTACK

static uint32_t iNextDcptRead = 0;         // The next descriptor to look at waiting for incoming data
static IMSTATE imState = IMIDLE;           // The state of the Internal Mac state machine.
static bool    fLinkWasUp = false;         // used to determine if we need to set speed and duplex

// these are frame pointers into the current frame to read out of the DMA descriptor
// these are set with GetFrameSize and used by ReadFrame
static uint32_t iFmDcptRead = 0;
static uint32_t obFmRead = 0;
static uint32_t cbFmFrame = 0;
static uint32_t cbFmRead = 0;

static void         InternalMACPeriodicTasks(void);
static bool         IsAdaptorLinked(IPSTATUS * pStatus);
//static bool         IsReadyToSend(IPSTATUS * pStatus);
static bool         Send(IPSTACK * pIPStack, IPSTATUS * pStatus);
static IPSTACK *    Read(IPSTATUS * pStatus);
static bool         Close(void);

static NWADP im8720Adp =
{
        IM8720_NWA_VERSION,
        false,
        IM8720_NWA_MTU_RX,
        IM8720_NWA_MIN_TX_MTU,
        MACNONE,
        NULL,
        InternalMACPeriodicTasks,
        IsAdaptorLinked,
        IsAdaptorLinked,        // maybe check the TXRTS bit too
        Send,
        Read,
        Close,
};

static FFPT ffptIpStackRead = {NULL, NULL};
static FFPT ffptIpStackSend = {NULL, NULL};
static IPSTACK * pIpStackBeingTx = NULL;

#pragma pack(pop)

static int32_t PHYReadReg(uint8_t phyID, uint8_t regID, uint32_t timeout)
{
    uint32_t tStart = SYSGetMilliSecond();

    // clear any commands
    EMAC1MCMD = 0;
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(-1);
        }
    }

    // read the PHY status register
    // to see if we are stable.
    EMAC1MADRbits.PHYADDR = phyID;
    EMAC1MADRbits.REGADDR = regID;
    EMAC1MCMDbits.READ = 1;

    // wait to finish (this will execute our 3 cycles
    tStart = SYSGetMilliSecond();
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            EMAC1MCMD = 0;
            return(-1);
        }
    }

    EMAC1MCMD = 0;

    // return the value
    return(EMAC1MRDDbits.MRDD);
}

static bool PHYScanReg(uint8_t phyID, uint8_t regID, uint16_t scanMask, bool fIsEqual, uint32_t timeout)
{
    uint32_t tStart = SYSGetMilliSecond();

    // clear any commands
    EMAC1MCMD = 0;
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }

    // scan the PHY until it is ready
    EMAC1MADRbits.PHYADDR   = phyID;
    EMAC1MADRbits.REGADDR   = regID;
    EMAC1MCMDbits.SCAN      = 1;

    // wait for it to become valid
    tStart = SYSGetMilliSecond();
    while(EMAC1MINDbits.NOTVALID)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }

    // wait until we hit our mask
    tStart = SYSGetMilliSecond();

    while(((EMAC1MRDDbits.MRDD & scanMask) == scanMask) != fIsEqual)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }

    // kill the scan
    EMAC1MCMD = 0;
    tStart = SYSGetMilliSecond();
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }
    return(true);
}

static bool PHYWriteReg(uint8_t phyID, uint8_t regID, uint16_t value, uint32_t timeout)
{
    uint32_t tStart = SYSGetMilliSecond();

    // clear any commands
    EMAC1MCMD = 0;
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }

    EMAC1MADRbits.PHYADDR   = phyID;
    EMAC1MADRbits.REGADDR   = regID;
    EMAC1MWTDbits.MWTD      = value;

    // wait to finish (this will execute our 3 cycles
    tStart = SYSGetMilliSecond();
    while(EMAC1MINDbits.MIIMBUSY)
    {
        // timeout error
        if(SYSGetMilliSecond() - tStart > timeout)
        {
            return(false);
        }
    }
    return(true);
}

/*****************************************************************************/
/********************* Reset the Ethernet Controller *************************/
/*****************************************************************************/
static void ResetEthernetController(uint32_t cbRxDescriptorBuff, uint8_t lowDescriptorWaterMark, uint8_t highDescriptorWaterMark)
{

    // Disable the ethernet interrupt
    IEC1bits.ETHIE      = 0;

    // Turn the Ethernet cotroller OFF
    ETHCON1bits.ON      = 0;    // THIS TURNS THE CONTROLLER OFF!
    ETHCON1bits.RXEN    = 0;    // Rx enable; set to OFF
    ETHCON1bits.TXRTS   = 0;    // Rx have something to send; set to OFF

    // wait for abort to finish
    while(ETHSTATbits.ETHBUSY);

    // clear the interrupt IF bit
    IFS1bits.ETHIF      = 0;

    // clear individual interrupt bits
    ETHIENCLR   = 0x000063ef;
    ETHIRQCLR   = 0x000063ef;

    // clear discriptor pointers; for now
    ETHTXST     = 0;
    ETHRXST     = 0;

/*****************************************************************************/
/***************************** init flow control *****************************/
/***************************** init RX filtering *****************************/
/*****************************************************************************/

    // manual flow control is OFF
    ETHCON1bits.MANFC = 0;

    // WE MAY WITH TO TURN FLOW CONTROL OFF! I can block the network for others
    // auto flow control is on
    ETHCON1bits.PTV     = 1;    // the max number of pause timeouts
    ETHCON1bits.AUTOFC  = 1;

    // high and low water marks
    ETHRXWMbits.RXEWM   = lowDescriptorWaterMark;
    ETHRXWMbits.RXFWM   = highDescriptorWaterMark;

    // set buffer size, descriptor buffer size in bytes / 16
    // got to do this with the ethernet controller OFF, so can't wait to
    // this with the
    ETHCON2bits.RXBUF_SZ = (cbRxDescriptorBuff >> 4);

    // clear everything, and then set our Rx filters
    ETHRXFCCLR = 0x0000DFFF;
    ETHRXFCbits.CRCOKEN = 1; // CRC must checkout
    ETHRXFCbits.UCEN    = 1; // our MAC address will match
    ETHRXFCbits.BCEN    = 1; // match on broadcast

    // hash table; not using
    ETHHT0CLR           = 0xFFFFFFFF;
    ETHHT1CLR           = 0xFFFFFFFF;

    // pattern match, not used
    ETHPMM1CLR          = 0xFFFFFFFF;
    ETHPMM1CLR          = 0xFFFFFFFF;

    // byte in TCP like checksum pattern calculation.
    ETHPMCSbits.PMCS    = 0;

    // turn on the ethernet controller
    // this is a point of inescapable dispute with
    // documentation. The docs say don't do this yet
    // but if you done, you can't talk to the MIIM management functions
    // the controller has to be running to talk to the PHY
    ETHCON1bits.ON      = 1;
}

/*****************************************************************************/
/***************************** Reset the MAC *********************************/
/*****************************************************************************/
static void ResetMAC(MACADDR *pUseThisMac)
{

    // reset the MAC
    EMAC1CFG1bits.SOFTRESET = 1;

    // pull it out of reset
    EMAC1CFG1bits.SOFTRESET = 0;

    // believe this to be unneeded as SOFTRESET does it
    EMAC1CFG1bits.SIMRESET  = 0;
    EMAC1CFG1bits.RESETRMCS = 0;
    EMAC1CFG1bits.RESETRFUN = 0;
    EMAC1CFG1bits.RESETTMCS = 0;
    EMAC1CFG1bits.RESETTFUN = 0;

    // more configuration
    EMAC1CFG1bits.LOOPBACK  = 0;
    EMAC1CFG1bits.TXPAUSE   = 1;
    EMAC1CFG1bits.RXPAUSE   = 1;
    EMAC1CFG1bits.RXENABLE  = 1;
//    EMAC1CFG1bits.PASSALL   = 0;  // don't understand this

    EMAC1CFG2bits.EXCESSDFR = 1;
    EMAC1CFG2bits.BPNOBKOFF = 1;
    EMAC1CFG2bits.NOBKOFF   = 0;
    EMAC1CFG2bits.LONGPRE   = 0;
    EMAC1CFG2bits.PUREPRE   = 0;
    EMAC1CFG2bits.AUTOPAD   = 1;
    EMAC1CFG2bits.VLANPAD   = 0;
    EMAC1CFG2bits.PADENABLE = 1;
    EMAC1CFG2bits.CRCENABLE = 1;
    EMAC1CFG2bits.DELAYCRC  = 0;
    EMAC1CFG2bits.HUGEFRM   = 0;
    EMAC1CFG2bits.LENGTHCK  = 1;
//    EMAC1CFG2bits.FULLDPLX = ?;  // set in the is Linked function

    EMAC1IPGRbits.NB2BIPKTGP1   = 0x0C;
    EMAC1IPGRbits.NB2BIPKTGP2   = 0x12;

    // this all default
//    EMAC1CLRTbits.CWINDOW       = 0x37;
//    EMAC1CLRTbits.RETX          = 0x0F
//    EMAC1MAXFbits.MACMAXF       = 0x05EE;  // max frame of 1518

    if(pUseThisMac != NULL)
    {
        // save away our MAC
        EMAC1SA2bits.STNADDR1 = pUseThisMac->u8[0];
        EMAC1SA2bits.STNADDR2 = pUseThisMac->u8[1];
        EMAC1SA1bits.STNADDR3 = pUseThisMac->u8[2];
        EMAC1SA1bits.STNADDR4 = pUseThisMac->u8[3];
        EMAC1SA0bits.STNADDR5 = pUseThisMac->u8[4];
        EMAC1SA0bits.STNADDR6 = pUseThisMac->u8[5];
    }
}

/*****************************************************************************/
/*******************************  RMII and MIIM reset  ***********************/
/*****************************************************************************/
static void ResetRMIIandMIIM(void)
{
    EMAC1SUPPbits.RESETRMII = 1;    // reset RMII
    EMAC1SUPPbits.RESETRMII = 0;

    // block reset the management protocol
    EMAC1MCFGbits.RESETMGMT = 1;    // reset the management fuctions
    EMAC1MCFGbits.RESETMGMT = 0;

    // As per table 35-3
    // SYSCLK / 4 == 0000 or 0001
    // SYSCLK / 6 == 0010
    // SYSCLK / 8 == 0011
    // SYSCLK / 10 == 0100
    // SYSCLK / 14 == 0101
    // SYSCLK / 20 == 0110
    // SYSCLK / 28 == 0111
    // SYSCLK / 40 == 1000
    // The IEEE 802.3 spec says no faster than 2.5MHz.
    // 80 / 40 = 2MHz; use 0b1000
    EMAC1MCFGbits.CLKSEL = 0b1000;
}

/*****************************************************************************/
/************************* Remotely reset the PHY via MIIM *******************/
/*****************************************************************************/
static bool ResetPHY(uint8_t phyID)
{
    uint16_t phyReg = 0;

    // if it is not see, lets attempt to set it
    if((PHYReadReg(phyID, 18, 1000) & 0x000F) != phyID)
    {
        // maybe you want to do a hardware reset here
        // but not today

        // try zero, the most likely phy addres
        // but also an illegal one
        if(((phyReg = PHYReadReg(0, 18, 1000)) & 0x000F) == 0)
        {
            if(!PHYWriteReg(0, 18, ((phyReg & 0xFFF0) | phyID), 1000)) return(false);
        }
        else if(((phyReg = PHYReadReg(1, 18, 1000)) & 0x000F) == 1)
        {
            if(!PHYWriteReg(1, 18, ((phyReg & 0xFFF0) | phyID), 1000)) return(false);
        }
    }

    // now this should work
    if((PHYReadReg(phyID, 18, 1000) & 0x000F) != phyID) return(false);

    // send a reset to the PHY
    if(!PHYWriteReg(phyID, 0, 0b1000000000000000, 1000)) return(false);

    // wait for the reset pin to autoclear, this says the reset is done
    if(!PHYScanReg(phyID, 0, 0b1000000000000000, false, 1000)) return(false);

    return(true);
}

static void InitDMADescriptors(void)
{
    uint32_t i = 0;
/*****************************************************************************/
/***************************** Set Descptor tables ***************************/
/*****************************************************************************/

    // set Rx discriptor list
    // all owned by the ethernet controller / DMA
    memset(rxDcpt, 0, sizeof(rxDcpt));
    for(i=0; i< CRXDCPT; i++)
    {
        rxDcpt[i].hdr.eOwn = 1;
        rxDcpt[i].hdr.npv   = 0;  // 0 = next in memory, 1 = use ED field
        rxDcpt[i].uEDBuff = PhyAddrFromVir(rxBuffer + (i * CBRXDCPTBUFF));
    }

    // loop the list back to the begining
    // this is a circular array descriptor list
    *((uint32_t *) (&rxDcpt[CRXDCPT])) = PhyAddrFromVir(rxDcpt);
    rxDcpt[CRXDCPT-1].hdr.npv   = 1;  // 0 = next in memory, 1 = use ED field

    // set us at the start of the list
    iNextDcptRead = 0;
    ETHRXST = PhyAddrFromVir(&rxDcpt[0]);

    // set up the transmitt descriptors all owned by
    // the software; clear it completely out
    memset(txDcpt, 0, sizeof(txDcpt));
    ETHTXST = PhyAddrFromVir(txDcpt);

    // init our frame reading values
    // used by GetFrameSize, and ReadFrame
    iFmDcptRead = 0;
    obFmRead = 0;
    cbFmFrame = 0;
    cbFmRead = 0;
}

static bool InitInternalMAC(uint8_t phyID, MACADDR *pUseThisMac)
{
    // keep the Internal MAC state machine at idle
    imState = IMIDLE;

    // say the link is not up
    fLinkWasUp = false;

    // we should have for the MX7
    // FETHIO == 1; default pin out
    // AND THE RMII interface FMIIEN == 0
    // ideally we have 4 cases and we set the GPIO pins appropriately
    if(DEVCFG3bits.FETHIO == 1 && DEVCFG3bits.FMIIEN == 0)
    {
        // but we are only configured to the MX7cK and Max32 with RMII
        // set analog pins as digital and set the tris; the rest will be set by the MAC
        // ERXD1    AN13    RB13
        // ERXD0    AN12    RB12
        // ERXERR   AN11    RB11
        AD1PCFGSET = 0b0011100000000000;
        TRISBSET   = 0b0011100000000000;
    }
    else
    {
        return(false);
    }

    // As per section 35.4.10 of the Pic32 Family Ref Manual
    ResetEthernetController(CBRXDCPTBUFF, IRXEWM, IRXFWM);
    ResetMAC(pUseThisMac);
    ResetRMIIandMIIM();

    if(!ResetPHY(phyID)) return(false);

    InitDMADescriptors();

    // wait for auto link to finish
    imState = IMWAITLINK;
    
    return(true);
}

static bool IsPHYLinked(uint8_t phyID, uint32_t timeout)
{
    bool fLinkIsUp = false;

    int32_t val = PHYReadReg(phyID, 1, timeout);

    if(val < 0)
    {
        return(false);
    }

    fLinkIsUp = ((val & 0x2C) == 0x2C);
    
    // set our link speed
    if(fLinkIsUp && !fLinkWasUp)
    {
        bool fFullDuplex    = false;
        bool f100Mbps       = false;
        bool fRXEN          = ETHCON1bits.RXEN;

        // must disable the Rx recieving while setting these parameters
        ETHCON1bits.RXEN    = 0;

        // get the speed
        val = PHYReadReg(phyID, 31, timeout);
        f100Mbps = ((val & 0x1008) == 0x1008);

        // get the duplex
        fFullDuplex = ((val & 0x0010) == 0x0010);

        // set speed
        EMAC1SUPPbits.SPEEDRMII = f100Mbps;
        
        // Section 35-25; set duplex
        EMAC1CFG2bits.FULLDPLX  = fFullDuplex;

        // set Gap size
        EMAC1IPGTbits.B2BIPKTGP = fFullDuplex ? 0x15 : 0x12;

        // return the Rx Enable back to what it was
        ETHCON1bits.RXEN    = fRXEN;
    }
    fLinkWasUp = fLinkIsUp;

    return(fLinkIsUp);
}

/*****************************************************************************/
/***************************** Start of Adaptor functions ********************/
/*****************************************************************************/

static void IntermalMACStateMachine(void)
{
    static uint32_t tStart = 0;

    switch(imState)
    {
        // we haven't even initialized yet.
        case IMIDLE:
            break;

        case IMINIT:
            break;
        
        case IMWAITLINK:
            if(IsPHYLinked(myPhyID, 1))
            {
                tStart= SYSGetMilliSecond();
                imState = IMWAITLINKINTERGAPTIME;
            }
            break;
        
        case IMWAITLINKINTERGAPTIME:
            if(!IsPHYLinked(myPhyID, 1))
            {
                imState = IMWAITLINK;
            }
            else if(SYSGetMilliSecond() - tStart >= 1000)
            {
                imState             = IMLINKED;
                ETHCON1bits.RXEN    = 1;
            }
            break;

        case IMREST:
            if(SYSGetMilliSecond() - tStart >= 10)
            {
                if(IsPHYLinked(myPhyID, 1))
                {
                    imState             = IMLINKED;
                }
                else
                {
                    tStart      = SYSGetMilliSecond();
                }
            }
            break;

        case IMLINKED:
        default:
            if(!IsPHYLinked(myPhyID, 1))
            {
                imState     = IMREST;
                tStart      = SYSGetMilliSecond();
            }
            break;
    }
}

static bool IsFrameWaitingForRead(void)
{
    if(imState < IMWAITLINK)
    {
        return(false);
    }

    // There are no packets waiting
    else if(ETHSTATbits.BUFCNT == 0)
    {
        // update to what the DMA controller thinks
        // this should not be needed, but lets sync anyway
        // if we find this is never called we can remove this.
        // if it is called, we need to understand why
        // tests look good, this is never hit...

        // there is a timing window here
        // if between the BUFCNT == 0 above and here a packet comes in
        // and DMA occurs, the ETHRXST pointer will be updated while
        // seemingly BUFCNT == 0. So check the BUFCNT again after the pointer test
        if(ETHRXST != PhyAddrFromVir(&rxDcpt[iNextDcptRead]) && ETHSTATbits.BUFCNT == 0)
        {
            iNextDcptRead = (ETHRXST - PhyAddrFromVir(&rxDcpt[0])) / sizeof(ETHDCPT);
        }

        return(false);
    }

    // I better own this, or I am lost; this should not happen if BUFCNT > 0
    // I should own it! Not the DMA
    // this looks good and never seems to be hit
    else if(rxDcpt[iNextDcptRead].hdr.eOwn)
    {
        uint32_t i = 0;

        // lets find where we are suppose to be; this is a bug if we get here
        // as we should stay in sync with the DMA usage
        // this looks good too, we never hit this
        for(i=0; i<CRXDCPT; i++)
        {
            // if I own it, get out of the loop
            if(!rxDcpt[iNextDcptRead].hdr.eOwn)
            {
                break;
            }

            // go look at the next one to see if I own it
            iNextDcptRead = iGetNextRxDcpt(iNextDcptRead);
        }
    }

    // we should be at a SOP, if not we are lost
    // just drop the packets until we get to a start of frame
    // again, a bug if we get lost
    // looks good, does not see to be hit...
    if(!rxDcpt[iNextDcptRead].hdr.sop)
    {
        // if we own it, and it is not a start of frame; give it back to the DMA
        while(!rxDcpt[iNextDcptRead].hdr.eOwn && !rxDcpt[iNextDcptRead].hdr.sop)
        {
            // give it back to the DMA
            rxDcpt[iNextDcptRead].hdr.eOwn = true;
            ETHCON1bits.BUFCDEC = 1;                        // dec the BUFCNT
            iNextDcptRead = iGetNextRxDcpt(iNextDcptRead);
        }
    }

    // if I own it, and it is the start of packet, we have something
    return(!rxDcpt[iNextDcptRead].hdr.eOwn && rxDcpt[iNextDcptRead].hdr.sop);
}

// if you call this, it resets for ReadFrame at the begining of the current frame
static uint32_t GetFrameSize()
{
    // this is the size of the frame as the Eth controller knows it
    // this may include the FCS at the end of the frame
    // and may included padding bytes to make a min packet size of 64 bytes
    // so it is likely this is longer than the payload length
    iFmDcptRead = iNextDcptRead;
    cbFmFrame = rxDcpt[iNextDcptRead].rx.cbRcv;
    obFmRead = 0;
    cbFmRead = 0;
    return(cbFmFrame);
}

static uint32_t ReadFrame(uint8_t * pBuff, uint32_t cbBuff)
{
    uint32_t cbCopy = 0;
    
    // we are not reading a frame
    if(cbFmFrame == 0 || cbFmRead == cbFmFrame)
    {
        return(0);
    }

    // make sure we own the descriptor, bad if we don't!
    while(!rxDcpt[iFmDcptRead].hdr.eOwn && cbBuff > 0)
    {
        uint32_t    cbDcpt  = rxDcpt[iFmDcptRead].hdr.cbEDBuff;
        uint32_t    cb      = min(cbDcpt - obFmRead, cbBuff);
        bool        fEOP    = rxDcpt[iFmDcptRead].hdr.eop;

        memcpy(&pBuff[cbCopy], RAMAddrFromPhy(rxDcpt[iFmDcptRead].uEDBuff + obFmRead), cb);
        cbCopy      += cb;
        obFmRead    += cb;
        cbFmRead    += cb;
        cbBuff      -= cb;

        // if we read the whole descriptor page
        if(obFmRead == cbDcpt)
        {
            // set up for the next page
            obFmRead = 0;
            iFmDcptRead = iGetNextRxDcpt(iFmDcptRead);

            // if we are done, get out
            if(fEOP || cbFmRead == cbFmFrame)
            {
                break;
            }
        }
    }

    return(cbCopy);
}

static bool FreeFrame(void)
{
    // if we never called get size, or there is nothing to free
    if(cbFmFrame == 0)
    {
        return(false);
    }

    while(!rxDcpt[iNextDcptRead].hdr.eOwn)
    {
        bool        fEOP    = rxDcpt[iNextDcptRead].hdr.eop;

        rxDcpt[iNextDcptRead].hdr.eOwn = true;          // give up ownership
        ETHCON1bits.BUFCDEC = 1;                        // dec the BUFCNT
        iNextDcptRead = iGetNextRxDcpt(iNextDcptRead);  // check the next one

        // hit the end of packet
        if(fEOP)
        {
            break;
        }
    }

    // init our state variables
    iFmDcptRead = 0;
    obFmRead = 0;
    cbFmFrame = 0;
    cbFmRead = 0;
    return(true);
}

/*****************************************************************************/
/***************************** Adaptor code  *********************************/
/*****************************************************************************/

static bool IsAdaptorLinked(IPSTATUS * pStatus)
{
    AssignStatusSafely(pStatus, MkLinkStatus(imState));
    return(imState == IMLINKED);
}

static IPSTACK * Read(IPSTATUS * pStatus)
{
    IPSTACK * pIpStack = FFOutPacket(&ffptIpStackRead);

    if(pIpStack == NULL)
    {
        AssignStatusSafely(pStatus, ipsIM8720PhyRxEmpty);
    }
    else
    {
        pIpStack->fOwnedByAdp = false;
        AssignStatusSafely(pStatus, ipsSuccess);
    }
    return(pIpStack);
}

static bool Send(IPSTACK * pIpStack, IPSTATUS * pStatus)
{
    AssignStatusSafely(pStatus, ipsSuccess);
    pIpStack->fOwnedByAdp = true;
    FFInPacket(&ffptIpStackSend, pIpStack);
    return(true);
}

static bool Close(void)
{
    return(true);
}

static bool SendNextIpStack(void)
{
    if(!ETHCON1bits.TXRTS)
    {
        if(pIpStackBeingTx != NULL)
        {
            pIpStackBeingTx->fOwnedByAdp = false;
            IPSRelease(pIpStackBeingTx);
            pIpStackBeingTx = NULL;
        }

        // if we can send right now
        // is the adaptor up and do we have the transmit bit?
        if(IsAdaptorLinked(NULL))
        {
            IPSTACK *   pIpStack    = FFOutPacket(&ffptIpStackSend);
            int32_t     i           = 0;
            int32_t     j           = 0;

            if(pIpStack != NULL)
            {
                // clear the tx buffer, but we don't have to 
                // worry about the last one as it is just
                // a dummy that will always have the software
                // own to stop the DMA from running off the end
                memset(txDcpt, 0, sizeof(txDcpt) - sizeof(ETHDCPT));

                // always have a frame, alwasy FRAME II (we don't support 802.3 outgoing frames; this is typical)
                txDcpt[i].hdr.cbEDBuff = pIpStack->cbFrame;
                txDcpt[i].uEDBuff = PhyAddrFromVir(pIpStack->pFrameII);
                txDcpt[i].hdr.sop = 1;
                i++;

                // IP Header
                if(pIpStack->cbIPHeader > 0)
                {
                    txDcpt[i].hdr.cbEDBuff = pIpStack->cbIPHeader;
                    txDcpt[i].uEDBuff = PhyAddrFromVir(pIpStack->pIPHeader);
                    i++;
                }

                // Transport Header (TCP/UDP)
                if(pIpStack->cbTranportHeader > 0)
                {
                    txDcpt[i].hdr.cbEDBuff = pIpStack->cbTranportHeader;
                    txDcpt[i].uEDBuff = PhyAddrFromVir(pIpStack->pTransportHeader);
                    i++;
                }

                // Payload / ARP / ICMP
                if(pIpStack->cbPayload > 0)
                {
                    txDcpt[i].hdr.cbEDBuff = pIpStack->cbPayload;
                    txDcpt[i].uEDBuff = PhyAddrFromVir(pIpStack->pPayload);
                    i++;
                }

                // put in eop; I is one past the last
                // entry; lets bump it down one
                i--;
                txDcpt[i].hdr.eop = 1;

                // set the ownership bits
                // the last descriptor is a dummy the software
                // always owns, do look at that.
                for(j = (CTXDCPPERIPSTACK - 1); j>=0; j--)
                {
                    // i is the last descriptor that is
                    // go to be transmitted
                    txDcpt[j].hdr.eOwn = (j <= i);
                }
                
                // set the descriptor table to be transmitted
                ETHTXST = PhyAddrFromVir(txDcpt);
                // transmit
                ETHCON1bits.TXRTS = 1;

                pIpStackBeingTx = pIpStack;
            }
            return(true);
        }
    }
    return(false);
}

// will only be called when something is ready for read
static void ProcessRxPacket(void)
{
    uint16_t cbPkt = GetFrameSize();
    IPSTACK * pIpStack = RRHPAlloc(im8720Adp.hAdpHeap, cbPkt + sizeof(IPSTACK));

    if(pIpStack != NULL)
    {
        // fill in info about the frame data
        pIpStack->fFrameIsParsed    = FALSE;
        pIpStack->fFreeIpStackToAdp = TRUE;
        pIpStack->headerOrder       = NETWORK_ORDER;
        pIpStack->pPayload          = ((uint8_t *) pIpStack) + sizeof(IPSTACK);
        pIpStack->cbPayload         = cbPkt;

        // if something actually to do, put it on the stack to do
        if(cbPkt > 0)
        {
            ReadFrame(pIpStack->pPayload, pIpStack->cbPayload);
            pIpStack->fOwnedByAdp = true;
            FFInPacket(&ffptIpStackRead, pIpStack);
        }
        // otherwise just free this.
        else
        {
            RRHPFree(im8720Adp.hAdpHeap, pIpStack);
        }

        // always free the DMA
        FreeFrame();
    }
}

static void InternalMACPeriodicTasks(void)
{
        IntermalMACStateMachine();

        // transmit any pending data
        SendNextIpStack();

// POTENTIALLY THIS COULD GO IN AN ISR
        if(IsFrameWaitingForRead())
        {
            ProcessRxPacket();
        }
// END OF ISR
}

const NWADP * GetIM8720Adaptor(uint8_t phyID, MACADDR *pUseThisMac, HRRHEAP hAdpHeap, IPSTATUS * pStatus)
{
    
    // right now we can only support 1 phy
    // in the future we will store many of these
    if(myPhyID != 0 || phyID == 0)
    {
        return(NULL);
    }
    myPhyID = phyID;

    if(hAdpHeap == NULL)
    {
        AssignStatusSafely(pStatus, ipsNoHeapGiven);
        return(NULL);
    }

    pIpStackBeingTx = NULL;
    memset(&ffptIpStackRead, 0, sizeof(ffptIpStackRead));
    memset(&ffptIpStackSend, 0, sizeof(ffptIpStackSend));

    if(!InitInternalMAC(phyID, pUseThisMac))
    {
        AssignStatusSafely(pStatus, ipsIM8720PhyFailToInit);
        return(NULL);    
    }

    // set the heap up.
    im8720Adp.hAdpHeap = hAdpHeap;

    // set our mac address
    im8720Adp.mac.u8[0] = EMAC1SA2bits.STNADDR1;
    im8720Adp.mac.u8[1] = EMAC1SA2bits.STNADDR2;
    im8720Adp.mac.u8[2] = EMAC1SA1bits.STNADDR3;
    im8720Adp.mac.u8[3] = EMAC1SA1bits.STNADDR4;
    im8720Adp.mac.u8[4] = EMAC1SA0bits.STNADDR5;
    im8720Adp.mac.u8[5] = EMAC1SA0bits.STNADDR6;
    
    return(&im8720Adp);
}
