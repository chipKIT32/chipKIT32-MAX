//************************************************************************
//*    cpudefs.h
//*    
//*    Arduino core files for PIC32
//*        Copyright (c) 2011 by Mark Sproul
//*    
//*        This file is designed to provide some of the cpu specific definitions
//*        that are available for avr chips and not for pic32 chips
//************************************************************************
//*    
//*    This library is free software; you can redistribute it and/or
//*    modify it under the terms of the GNU Lesser General Public
//*    License as published by the Free Software Foundation; either
//*    version 2.1 of the License, or (at your option) any later version.
//*    
//*    This library is distributed in the hope that it will be useful,
//*    but WITHOUT ANY WARRANTY; without even the implied warranty of
//*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*    See the GNU
//*    Lesser General Public License for more details.
//*    
//*    You should have received a copy of the GNU Lesser General
//*    Public License along with this library; if not, write to the
//*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*    Boston, MA    02111-1307    USA
//*    
//*    
//************************************************************************
//*    Edit History
//************************************************************************
//*    Apr 16, 2011    <MLS> started on cpudefs.h
//*    Apr 24,    2011    <MLS> copied to bootloader, important to keep them in sync
//*    Jun 16,    2011    <MLS> Added 32MX360F256L
//*    Jun 21,    2011    <MLS> Added 32MX440F512H
//* Nov 19, 2011    <GeneApperson> corrected errors in some parts, added
//*                        definitions for all 1XX/2XX/3XX/4XX/5XX/6XX/7XX devices
//************************************************************************

//************************************************************************
//*    Microchip pic32 chip names
#if defined(__PIC32MX__) || defined(__PIC32MZ__)

    #define    E2END        0x0fff    //*    4 k of simulated EEPROM
    
    //************************************************************************
    //*    MX 100 series

    #if defined(__32MX110F016B__)
        #define _CPU_NAME_      "32MX110F016B"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX1XX__

    #elif defined(__32MX110F016C__)
        #define _CPU_NAME_      "32MX110F016C"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX1XX__

    #elif defined(__32MX110F016D__)
        #define _CPU_NAME_      "32MX110F016D"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX1XX__

    #elif defined(__32MX120F032B__)
        #define _CPU_NAME_      "32MX120F032B"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX1XX__

    #elif defined(__32MX120F032C__)
        #define _CPU_NAME_      "32MX120F032C"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX1XX__

    #elif defined(__32MX120F032D__)
        #define _CPU_NAME_      "32MX120F032D"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX1XX__

    #elif defined(__32MX130F064B__)
        #define _CPU_NAME_      "32MX130F064B"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX1XX__

    #elif defined(__32MX130F064C__)
        #define _CPU_NAME_      "32MX130F064C"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX1XX__

    #elif defined(__32MX130F064D__)
        #define _CPU_NAME_      "32MX130F064D"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX1XX__

    #elif defined(__32MX150F128B__)
        #define _CPU_NAME_      "32MX150F128B"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX1XX__

    #elif defined(__32MX150F128C__)
        #define _CPU_NAME_      "32MX150F128C"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX1XX__

    #elif defined(__32MX150F128D__)
        #define _CPU_NAME_      "32MX150F128D"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX1XX__

    //************************************************************************
    //*   MX 200 series

    #elif defined(__32MX210F016B__)
        #define _CPU_NAME_      "32MX210F016B"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX2XX__

    #elif defined(__32MX210F016C__)
        #define _CPU_NAME_      "32MX210F016C"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX2XX__

    #elif defined(__32MX210F016D__)
        #define _CPU_NAME_      "32MX210F016D"
        #define FLASHEND        (((16 - 4) * 1024L) - 1)
        #define RAMEND          ((4 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX2XX__

    #elif defined(__32MX220F032B__)
        #define _CPU_NAME_      "32MX220F032B"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX2XX__

    #elif defined(__32MX220F032C__)
        #define _CPU_NAME_      "32MX220F032C"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX2XX__

    #elif defined(__32MX220F032D__)
        #define _CPU_NAME_      "32MX220F032D"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX2XX__

    #elif defined(__32MX230F064B__)
        #define _CPU_NAME_      "32MX230F064B"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX2XX__

    #elif defined(__32MX230F064C__)
        #define _CPU_NAME_      "32MX230F064C"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX2XX__

    #elif defined(__32MX230F064D__)
        #define _CPU_NAME_      "32MX230F064D"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX2XX__

    #elif defined(__32MX250F128B__)
        #define _CPU_NAME_      "32MX250F128B"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  28
        #define __PIC32MX2XX__

    #elif defined(__32MX250F128C__)
        #define _CPU_NAME_      "32MX250F128C"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  36
        #define __PIC32MX2XX__

    #elif defined(__32MX250F128D__)
        #define _CPU_NAME_      "32MX250F128D"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  44
        #define __PIC32MX2XX__

    //************************************************************************
    //*  MX  300 series

    #elif defined(__32MX320F032H__)
        #define _CPU_NAME_      "32MX320F032H"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX320F064H__)
        #define _CPU_NAME_      "32MX320F064H"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX320F128H__)
        #define _CPU_NAME_      "32MX320F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX340F128H__)
        #define _CPU_NAME_      "32MX340F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX340F256H__)
        #define _CPU_NAME_      "32MX340F256H"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX340F512H__)
        #define _CPU_NAME_      "32MX340F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX3XX__

    #elif defined(__32MX320F128L__)
        #define _CPU_NAME_      "32MX320F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX3XX__

    #elif defined(__32MX340F128L__)
        #define _CPU_NAME_      "32MX340F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX3XX__

    #elif defined(__32MX360F256L__)
        #define _CPU_NAME_      "32MX360F256L"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX3XX__

    #elif defined(__32MX360F512L__)
        #define _CPU_NAME_      "32MX360F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX3XX__

    //************************************************************************
    //*  MX  400 series

    #elif defined(__32MX420F032H__)
        #define _CPU_NAME_      "32MX420F032H"
        #define FLASHEND        (((32 - 4) * 1024L) - 1)
        #define RAMEND          ((8 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX4XX__

    #elif defined(__32MX440F128H__)
        #define _CPU_NAME_      "32MX440F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX4XX__

    #elif defined(__32MX440F256H__)
        #define _CPU_NAME_      "32MX440F256H"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX4XX__

    #elif defined(__32MX440F512H__)
        #define _CPU_NAME_      "32MX440F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX4XX__

    #elif defined(__32MX440F128L__)
        #define _CPU_NAME_      "32MX440F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX4XX__

    #elif defined(__32MX460F256L__)
        #define _CPU_NAME_      "32MX460F256L"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX4XX__

    #elif defined(__32MX460F512L__)
        #define _CPU_NAME_      "32MX460F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX4XX__

    #elif defined(__32MX470F512H__)
        #define _CPU_NAME_      "32MX470F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX47X__
        #define __PIC32MX47XH__
    
    #elif defined(__32MX470F512L__)
        #define _CPU_NAME_      "32MX470F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX47X__
        #define __PIC32MX47XL__

    //************************************************************************
    //*  MX  500 series

    #elif defined(__32MX534F064H__)
        #define _CPU_NAME_      "32MX534F064H"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX5XX__

    #elif defined(__32MX564F064H__)
        #define _CPU_NAME_      "32MX564F064H"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX5XX__

    #elif defined(__32MX564F128H__)
        #define _CPU_NAME_      "32MX564F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX5XX__

    #elif defined(__32MX575F256H__)
        #define _CPU_NAME_      "32MX575F256H"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX5XX__

    #elif defined(__32MX575F512H__)
        #define _CPU_NAME_      "32MX575F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX5XX__

    #elif defined(__32MX534F064L__)
        #define _CPU_NAME_      "32MX534F064L"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((16 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX5XX__

    #elif defined(__32MX564F064L__)
        #define _CPU_NAME_      "32MX564F064L"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX5XX__

    #elif defined(__32MX564F128L__)
        #define _CPU_NAME_      "32MX564F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX5XX__

    #elif defined(__32MX575F256L__)
        #define _CPU_NAME_      "32MX575F256L"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX5XX__

    #elif defined(__32MX575F512L__)
        #define _CPU_NAME_      "32MX575F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX5XX__

    //************************************************************************
    //*  MX  600 series

    #elif defined(__32MX664F064H__)
        #define _CPU_NAME_      "32MX664F064H"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX6XX__

    #elif defined(__32MX664F128H__)
        #define _CPU_NAME_      "32MX664F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX6XX__

    #elif defined(__32MX675F256H__)
        #define _CPU_NAME_      "32MX675F256H"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX6XX__

    #elif defined(__32MX675F512H__)
        #define _CPU_NAME_      "32MX675F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX6XX__

    #elif defined(__32MX695F512H__)
        #define _CPU_NAME_      "32MX695F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__ 64
        #define __PIC32MX6XX__

    #elif defined(__32MX664F064L__)
        #define _CPU_NAME_      "32MX664F064L"
        #define FLASHEND        (((64 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX6XX__

    #elif defined(__32MX664F128L__)
        #define _CPU_NAME_      "32MX664F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX6XX__

    #elif defined(__32MX675F256L__)
        #define _CPU_NAME_      "32MX675F256L"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX6XX__

    #elif defined(__32MX675F512L__)
        #define _CPU_NAME_      "32MX675F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX6XX__

    #elif defined(__32MX695F512L__)
        #define _CPU_NAME_      "32MX695F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX6XX__

    //************************************************************************
    //*  MX  700 series

    #elif defined(__32MX764F128H__)
        #define _CPU_NAME_      "32MX764F128H"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX7XX__

    #elif defined(__32MX775F256H__)
        #define _CPU_NAME_      "32MX775F256H"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX7XX__

    #elif defined(__32MX775F512H__)
        #define _CPU_NAME_      "32MX775F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX7XX__

    #elif defined(__32MX795F512H__)
        #define _CPU_NAME_      "32MX795F512H"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__  64
        #define __PIC32MX7XX__

    #elif defined(__32MX764F128L__)
        #define _CPU_NAME_      "32MX764F128L"
        #define FLASHEND        (((128 - 4) * 1024L) - 1)
        #define RAMEND          ((32 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX7XX__

    #elif defined(__32MX775F256L__)
        #define _CPU_NAME_      "32MX775F256L"
        #define FLASHEND        (((256 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX7XX__

    #elif defined(__32MX775F512L__)
        #define _CPU_NAME_      "32MX775F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((64 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX7XX__

    #elif defined(__32MX795F512L__)
        #define _CPU_NAME_      "32MX795F512L"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PINS__  100
        #define __PIC32MX7XX__

    //************************************************************************
    //*  MZ  EC series
        
    #elif defined(__32MZ1024ECG064__)
        #define _CPU_NAME_      "32MZ1024ECG064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECH064__)
        #define _CPU_NAME_      "32MZ1024ECH064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECM064__)
        #define _CPU_NAME_      "32MZ1024ECM064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECG064__)
        #define _CPU_NAME_      "32MZ2048ECG064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECH064__)
        #define _CPU_NAME_      "32MZ2048ECH064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECM064__)
        #define _CPU_NAME_      "32MZ2048ECM064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECG100__)
        #define _CPU_NAME_      "32MZ1024ECG100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
 
    #elif defined(__32MZ1024ECH100__)
        #define _CPU_NAME_      "32MZ1024ECH100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECM100__)
        #define _CPU_NAME_      "32MZ1024ECM100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
 
    #elif defined(__32MZ2048ECG100__)
        #define _CPU_NAME_      "32MZ2048ECG100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECH100__)
        #define _CPU_NAME_      "32MZ2048ECH100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECM100__)
        #define _CPU_NAME_      "32MZ2048ECM100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECG124__)
        #define _CPU_NAME_      "32MZ1024ECG124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECH124__)
        #define _CPU_NAME_      "32MZ1024ECH124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECM124__)
        #define _CPU_NAME_      "32MZ1024ECM124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECG124__)
        #define _CPU_NAME_      "32MZ2048ECG124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECH124__)
        #define _CPU_NAME_      "32MZ2048ECH124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECM124__)
        #define _CPU_NAME_      "32MZ2048EC124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECG144__)
        #define _CPU_NAME_      "32MZ1024ECG144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
 
    #elif defined(__32MZ1024ECH144__)
        #define _CPU_NAME_      "32MZ1024ECH144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECM144__)
        #define _CPU_NAME_      "32MZ1024ECM144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
 
    #elif defined(__32MZ2048ECG144__)
        #define _CPU_NAME_      "32MZ2048ECG144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECH144__)
        #define _CPU_NAME_      "32MZ2048ECH144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ2048ECM144__)
        #define _CPU_NAME_      "32MZ2048ECM144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECE064__)
        #define _CPU_NAME_      "32MZ0512ECE064"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECF064__)
        #define _CPU_NAME_      "32MZ0512ECF064"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECK064__)
        #define _CPU_NAME_      "32MZ0512ECK064"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
 
    #elif defined(__32MZ1024ECE064__)
        #define _CPU_NAME_      "32MZ1024ECE064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECF064__)
        #define _CPU_NAME_      "32MZ1024ECF064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECK064__)
        #define _CPU_NAME_      "32MZ1024ECK064"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECE100__)
        #define _CPU_NAME_      "32MZ0512ECE100"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECF100__)
        #define _CPU_NAME_      "32MZ0512ECF100"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECK100__)
        #define _CPU_NAME_      "32MZ0512ECK100"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECE100__)
        #define _CPU_NAME_      "32MZ1024ECE100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECF100__)
        #define _CPU_NAME_      "32MZ1024ECF100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECK100__)
        #define _CPU_NAME_      "32MZ1024ECK100"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECE124__)
        #define _CPU_NAME_      "32MZ0512ECE124"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECF124__)
        #define _CPU_NAME_      "32MZ0512ECF124"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECK124__)
        #define _CPU_NAME_      "32MZ0512ECK124"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__
 
    #elif defined(__32MZ1024ECE124__)
        #define _CPU_NAME_      "32MZ1024ECE124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECF124__)
        #define _CPU_NAME_      "32MZ1024ECF124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECK124__)
        #define _CPU_NAME_      "32MZ1024ECK124"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECE144__)
        #define _CPU_NAME_      "32MZ0512ECE144"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ0512ECF144__)
        #define _CPU_NAME_      "32MZ0512ECF144"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
 
    #elif defined(__32MZ0512ECK144__)
        #define _CPU_NAME_      "32MZ0512ECK144"
        #define FLASHEND        (((512 - 4) * 1024L) - 1)
        #define RAMEND          ((128 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECE144__)
        #define _CPU_NAME_      "32MZ1024ECE144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECF144__)
        #define _CPU_NAME_      "32MZ1024ECF144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    #elif defined(__32MZ1024ECK144__)
        #define _CPU_NAME_      "32MZ1024ECK144"
        #define FLASHEND        (((1024 - 4) * 1024L) - 1)
        #define RAMEND          ((256 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__

    //************************************************************************
    //*   MZ   EF series

    #elif defined(__32MZ2048EFG064__)
        #define _CPU_NAME_      "32MZ2048EFG064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFG100__)
        #define _CPU_NAME_      "32MZ2048EFG100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFG124__)
        #define _CPU_NAME_      "32MZ2048EFG124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFG144__)
        #define _CPU_NAME_      "32MZ2048EFG144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFH064__)
        #define _CPU_NAME_      "32MZ2048EFH064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFH100__)
        #define _CPU_NAME_      "32MZ2048EFH100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFH124__)
        #define _CPU_NAME_      "32MZ2048EFH124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFH144__)
        #define _CPU_NAME_      "32MZ2048EFH144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFM064__)
        #define _CPU_NAME_      "32MZ2048EFM064"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  64
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFM100__)
        #define _CPU_NAME_      "32MZ2048EFM100"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  100
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFM124__)
        #define _CPU_NAME_      "32MZ2048EFM124"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  124
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #elif defined(__32MZ2048EFM144__)
        #define _CPU_NAME_      "32MZ2048EFM144"
        #define FLASHEND        (((2048 - 4) * 1024L) - 1)
        #define RAMEND          ((512 * 1024L) - 1)
        #define __PIC32_PPS__
        #define __PIC32_PINS__  144
        #define __PIC32MZXX__
        #define __PIC32MZEFADC__

    #else
        #error CPU type is unknown, cpudefs.h needs to have additions
    #endif
#endif //defined(__PIC32MX__) || defined(__PIC32MZ__)

// Set up MZ ADC type   
#if defined(__PIC32MZ__)
    // do we have EF or EC ADCs
    #ifndef __PIC32MZEFADC__
        #define __PIC32MZECADC__
    #endif
#endif

//************************************************************************
#ifndef _CPU_NAME_
    #define _CPU_NAME_    "Unknown"
#endif
