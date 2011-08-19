/*********************************************************************
 *
 *       Emulating Data EEPROM for PIC32 microcontrollers
 *
 *********************************************************************
 * FileName:        dee_emulation_pic32.c
 * Dependencies:
 * Processor:       PIC32
 *
 * Complier:        MPLAB C32
 *                  MPLAB IDE
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * The software supplied herewith by Microchip Technology Incorporated
 * (the “Company”) for its PIC32 Microcontroller is intended
 * and supplied to you, the Company’s customer, for use solely and
 * exclusively on Microchip PIC32 Microcontroller products.
 * The software is owned by the Company and/or its supplier, and is
 * protected under applicable copyright laws. All rights are reserved.
 * Any use in violation of the foregoing restrictions may subject the
 * user to criminal sanctions under applicable laws, as well as to
 * civil liability for the breach of the terms and conditions of this
 * license.
 *
 * THIS SOFTWARE IS PROVIDED IN AN “AS IS” CONDITION. NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 * TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 * IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 *$Id: dee_emulation_pic32.c,v 1.1.1.1 2011/08/12 18:45:37 gapperson Exp $
 *
 **********************************************************************/
#include <dee_emulation_pic32.h>
#include <plib.h>

//For the DEE emulation operation 3 Pages should be allocated in the program memory.
const unsigned int eedata_addr[NUM_DATA_EE_PAGES][NUMBER_OF_INSTRUCTIONS_IN_PAGE] __attribute__ ((aligned(4096)))={0};
unsigned int lowerAddress = 0;     // to identify the read/write pointer address location
DATA_EE_FLAGS dataEEFlags;         //Flags for the error/warning condition. 

/****************************************************************************
 * Function:        GetPageStatus
 *
 * PreCondition:    None
 *
 * Input:           page : Page number
 *                  field : Status field
 *
 * Output:          Right justified bit value representing selected Status
 *                  Field value
 *
 * Side Effects:    None
 *
 * Overview:        This routine returns the page status for the selected page, for the
 *                  selected field. The return value is right shifted into LSB position.
 *
 * Note:            This is a private function.
 *****************************************************************************/
char GetPageStatus(unsigned char page, unsigned char field)
{
    unsigned char statusByte;
    unsigned char status;

    // read the status bits from the specified page.
    statusByte = (eedata_addr[page-1][0] >> 17) & 0xF;
    switch(field)
    {
        case STATUS_ACTIVE:
            status = ((statusByte & 1) >> 0);
            break;
        case STATUS_CURRENT:
            status = ((statusByte & 2) >> 1);
            break;
        case STATUS_AVAILABLE:
            status = ((statusByte & 4) >> 2);
            break;
        case STATUS_EXPIRED:
            status = ((statusByte & 8) >> 3);
            break;
        default:
            status = 0;
            break;
    }

    return(status);
}

/****************************************************************************
 * Function:        ErasePage
 *
 * PreCondition:    None
 *
 * Input:           page : Page number
 *
 * Output:          None
 *
 * Side Effects:    Generates CPU stall during program/erase operations
 *                  
 * Overview:        This routine erases the selected page and update the status 
 *                  bits by incrementing the erase count.
 *
 * Note:            This is private function.
 *****************************************************************************/
unsigned int ErasePage(unsigned char page)
{
    unsigned int currentStatus;
    unsigned int retCode;

    currentStatus = ((0xFFFF0000)|eedata_addr[page-1][0])+1; //increment the erase count.

    if((currentStatus & 0xFFFF) == ERASE_WRITE_CYCLE_MAX)
    {
        retCode = NVMWriteWord((void*)eedata_addr[page-1], currentStatus&0xFFEFFFFF); //page expired
    }
    else
    {
        retCode = NVMErasePage((void*)eedata_addr[page-1]);
        if(!retCode)
            retCode = NVMWriteWord((void*)eedata_addr[page-1], currentStatus); //update the status bits
    }
    
    if(retCode & _NVMCON_LVDERR_MASK)
    {
        SetLowVoltageError(1);
        return (8);
    }
    else if(retCode & _NVMCON_WRERR_MASK)
    {
        SetPageWriteError(1);
        return (7);
    }
    return 0;
}

/****************************************************************************
 * Function:        PrevPage
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          return the previous page
 *
 * Side Effects:    None
 *
 * Overview:        This routine gives you the page before the current page
 *
 * Note:            This is a private function.
 *****************************************************************************/

unsigned int PrevPage(unsigned int currentPage)
{
   unsigned int prevPage;

   prevPage = currentPage - 1;
   if(currentPage == 1)
   prevPage = NUM_DATA_EE_PAGES;
   return prevPage;
}

/****************************************************************************
 * Function:        GetNextAvailCount
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          Page offset to next available location
 *
 * Side Effects:    None
 *
 * Overview:        This routine finds the current page and performs a backward search to find
 *                  the first available location. The available location is determined by
 *                  reading a 0xFFFF in the address region. The returned value can be added
 *                  to the first address in page to compute the available address. A return
 *                  value of 0xFFFF means the entire page was filled which is an error condition.
 *                  This routine can be called by the user to determine how full the current
 *                  page is prior to a pack.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int GetNextAvailCount(void)
{
    int i = 0;
    int currentPage=0;
    int activePage = 0;
    int pageCount;
    unsigned int dataEEval;
    unsigned int nextAvailCount = 0;

    // Find the current active page.
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_ACTIVE) == PAGE_ACTIVE)
      {
         activePage++;
         if(GetPageStatus(pageCount, STATUS_CURRENT) == PAGE_CURRENT)
         {
            currentPage = pageCount;
         }
      }
    }

    if(currentPage == 0)
    {
       SetPageCorruptStatus(1);
    } 
    else
    {
       do
       {
          dataEEval = eedata_addr[currentPage-1][4 + i];
          if((dataEEval >> 16) == 0xFFFF)
          {
             lowerAddress = 0;
             break;
          }
          else if((dataEEval & 0xFFFF) == 0xFFFF)
          {
             lowerAddress = 1;
             break;
          }
          i++;
          nextAvailCount +=4;
       }while(nextAvailCount < DATA_OFFSET);
    }
         
    if((nextAvailCount == DATA_OFFSET)&&(activePage > 1))
    {
       nextAvailCount = 0xFFFF;  //Error - No available locations
    }
 
    return(nextAvailCount);
}

/****************************************************************************
 * Function:        EmulationCheckSum
 *
 * PreCondition:    None
 *
 * Input:           data
 *
 * Output:          return the checksum
 *
 * Side Effects:    None
 *
 * Overview:        This routine gives you the checksum for the data. Checksum will be
 *                  stored in upper 6 bits of 16 bit address value. This is mainly used
 *                  for the data integrity purpose. 
 *
 * Note:            This is a private function.
 *****************************************************************************/

unsigned char EmulationCheckSum(unsigned int data)
{
   unsigned char sum;
   
   sum = 0x3 & data;

   while((data = data >> 2))
      sum = sum + (0x3 & data);
   return sum;
}

/****************************************************************************
 * Function:        DataEEInit
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 2 for expired page.
 *                  Value 6 for page corrupt status.
 *                  Value 7 for write error.
 *                  Value 8 for Low voltage operation.
 *
 * Side Effects:    Data EE flags may be updated.
 *
 * Overview:        This routine finds an unexpired page to become an active page. It then
 *                  counts the number of active pages. If no active pages are found, the
 *                  first unexpired page is initialized for emulation. If one or two active pages
 *                  found, it assumes a reset occurred and the function does nothing. If
 *                  three active pages are found, it is assumes a reset occurred during a pack.
 *                  The page after current is erased and a pack is called. This
 *                  function must be called prior to any other operation.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int DataEEInit(void)
{
    unsigned int activePage=0;
    unsigned int pageCount;
    unsigned int currentPage;
    unsigned int retCode;
    int packedPage=1;         //Array row (PM page) of packed page
    int i;
    
    dataEEFlags.val = 0;
    //Erase the whlole emulation page for the first time
    for(i=0; i<3; i++)
    {
        if(eedata_addr[i][0] == 0x0)
        {
            retCode = NVMErasePage((void*)eedata_addr[i]);
            if(retCode & _NVMCON_LVDERR_MASK)
            {
                SetLowVoltageError(1);
                return (8);
            }
            else if(retCode & _NVMCON_WRERR_MASK)
            {
                SetPageWriteError(1);
                return (7);
            }
        }
    }
    
    // Find unexpired page
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_EXPIRED) == PAGE_EXPIRED)
      {
         SetPageExpiredPage(1);
         return(2);
      }
    }

    //count active pages
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_ACTIVE) == PAGE_ACTIVE)
      {
         activePage++;
         if(GetPageStatus(pageCount, STATUS_CURRENT) == PAGE_CURRENT)
         {
            currentPage = pageCount;
         }
      }
    }

    //If no active pages found, initialize page 1
    if(activePage == 0)
    {
        int i;
        for(i=1; i <= NUM_DATA_EE_PAGES;i++)
        {
            retCode = NVMWriteWord((void*)eedata_addr[i-1], 0xFFFF0000);
            if(retCode & _NVMCON_LVDERR_MASK)
            {
                SetLowVoltageError(1);
                return (8);
            }
            else if(retCode & _NVMCON_WRERR_MASK)
            {
                SetPageWriteError(1);
                return (7);
            }
            ErasePage(i);
        }
        
        retCode = NVMWriteWord((void*)(eedata_addr[0]), 0xFFFDFFFF); // Page Active & Current
        if(retCode & _NVMCON_LVDERR_MASK)
        {
            SetLowVoltageError(1);
            return (8);
        }
        else if(retCode & _NVMCON_WRERR_MASK)
        {
            SetPageWriteError(1);
            return (7);
        }
        return(0);
    }
    //If Full active pages, erase the page after the current page
    else if(activePage == NUM_DATA_EE_PAGES)
    {
        ErasePage((currentPage % NUM_DATA_EE_PAGES)+1); // Erase the page after the current page

        if(GetNextAvailCount()==0xFFFF)//Page full
        {
            PackEE();
        }
        return(0);
    }
    //If some active pages, do nothing
    else if(activePage > 0)
    {
        return(0);
    }
    else
    {
        SetPageCorruptStatus(1);
        return(6);
    }
}

/****************************************************************************
 * Function:        DataEEWrite
 *
 * PreCondition:    None
 *
 * Input:           Data EE address and data
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 2 for expired page.
 *                  Value 4 for pack skipped.
 *                  Value 5 for Illegal address.
 *                  Value 6 for page corrupt status.
 *                  Value 7 for write error.
 *                  Value 8 for Low voltage operation.
 *
 * Side Effects:    Data EE flags may be updated. CPU stall occurs for flash
 *                  programming. Pack may be generated.
 *
 * Overview:        This routine verifies the address is valid. If not, the Illegal Address
 *                  flag is set and an error code is returned. It then finds the active page.
 *                  If an active page can not be found, the Page Corrupt status bit is set
 *                  and an error code is returned. A read is performed, if the data was not
 *                  changed, the function exits. If the last location is programmed, the Pack
 *                  Skipped error flag is set (one location should always be available). The
 *                  data EE information address and data is programmed and verified. The data
 *                  checksum is written along with the address. 10 LSBits are allocated for 
 *                  address and 6 bits are allotted for checksum. If the verify fails, 
 *                  the Write Error flag is set. If the write went into the last location 
 *                  of the page, pack is called. This function can be called by the user.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int DataEEWrite(unsigned int data, unsigned int addr)
{
    int currentPage=0;
    int pageCount;
    unsigned int nextAddLoc;
    unsigned int addLoc;
    int addrIndex;
    unsigned int nextDataLoc;
    unsigned int activePage=0;
    unsigned int addCheckSum;
    unsigned int dataRead;
    unsigned int retCode;

    if(addr >= DATA_EE_SIZE)
    {
        SetPageIllegalAddress(1);
        return(5);
    }

    // Find the current active page.
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_ACTIVE) == PAGE_ACTIVE)
      {
         activePage++;
         if(GetPageStatus(pageCount, STATUS_CURRENT) == PAGE_CURRENT)
         {
            currentPage = pageCount;
         }
      }
    }

    if(activePage == 0)
    {
        SetPageCorruptStatus(1);
        return (6);
    }
    //Do not write data if it did not change
    if((DataEERead(&dataRead,addr) != 0) && (dataEEFlags.val >1))
    {
        return (6); //error condition
    }
    if(dataRead == data)
    {
        return(0);
    }
    
    addrIndex = GetNextAvailCount();
    if(addrIndex == 0xFFFF)//Page Full
    {
        SetPagePackSkipped(1);
        return(4);  //Error - Number of writes exceeds page size
    }
    addLoc = (unsigned int)eedata_addr[currentPage-1]+16;
    nextAddLoc = addLoc + addrIndex;
    addCheckSum = (unsigned int)EmulationCheckSum(data);
    addCheckSum = addCheckSum << 0xA;
    if(lowerAddress == 0)
    {
        addr = ((addCheckSum | addr)<<16)|0xFFFF;
        retCode = NVMWriteWord((void*)(nextAddLoc), addr); //Writing address to the location
        nextDataLoc = (addrIndex*2) + DATA_OFFSET + addLoc;
        if(!retCode)
            retCode = NVMWriteWord((void*)(nextDataLoc), data); //Writing data to the location
        if(retCode & _NVMCON_LVDERR_MASK)
        {
            SetLowVoltageError(1);
            return (8);
        }
        else if(retCode & _NVMCON_WRERR_MASK)
        {
            SetPageWriteError(1);
            return (7);
        }
        //Check whether data and address are written correctly.
        if((addr != (*(int *)(nextAddLoc))) || (data != (*(int *)(nextDataLoc))))
        {
            SetPageWriteError(1);
            return(7);  //Error - RAM does not match PM
        }
    }
    else if(lowerAddress == 1)
    {
        addr = addCheckSum | addr | 0xFFFF0000;
        retCode = NVMWriteWord((void*)(nextAddLoc), addr); //Writing address to the location
        nextDataLoc = (addrIndex*2) + DATA_OFFSET + 4 + addLoc;
        if(!retCode)
            retCode = NVMWriteWord((void*)(nextDataLoc), data); //Writing data to the location
        if(retCode & _NVMCON_LVDERR_MASK)
        {
            SetLowVoltageError(1);
            return (8);
        }
        else if(retCode & _NVMCON_WRERR_MASK)
        {
            SetPageWriteError(1);
            return (7);
        }
        //Check whether data and address are written correctly.
        if(((addr<<16) != ((*(int *)(nextAddLoc))<<16)) || (data != (*(int *)(nextDataLoc))))
        {
            SetPageWriteError(1);
            return(7);  //Error - RAM does not match PM
        }
    }

    //Pack if page is full
    if(lowerAddress == 1)
    {
        if (((addrIndex + 4) == DATA_OFFSET)&&(activePage == 1))
        {
            //mark the page as not_current and active
            retCode = NVMWriteWord((void*)(addLoc-16), 0xFFF9FFFF);
            //mark the next page as current and active.
            if(!retCode)
                retCode = NVMWriteWord((void*)eedata_addr[currentPage % NUM_DATA_EE_PAGES], 0xFFFDFFFF); 
            if(retCode & _NVMCON_LVDERR_MASK)
            {
                SetLowVoltageError(1);
                return (8);
            }
            else if(retCode & _NVMCON_WRERR_MASK)
            {
                SetPageWriteError(1);
                return (7);
            }
        }
        else if (((addrIndex + 4) == DATA_OFFSET)&&(activePage == 2))// both active pages are full then pack the page.
        {
            PackEE();
        }
    }
    return(0);
}

/****************************************************************************
 * Function:        DataEERead
 *
 * PreCondition:    None
 *
 * Input:           Read pointer and Data EE address
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 1 for address not found.
 *                  Value 5 for Illegal address.
 *                  Value 6 for page corrupt status.
 *
 * Side Effects:    Data EE flags may be updated.
 *
 * Overview:        This routine verifies whether the address is valid. If not, the Illegal Address
 *                  flag is set and 0 is returned. It then finds the active page. If an
 *                  active page can not be found, the Page Corrupt status bit is set and
 *                  0 is returned. A reverse search of the active page attempts to find
 *                  the matching address in the program memory. If a match is found,
 *                  the corresponding data EEPROM data is returned, otherwise 0
 *                  is returned. This function can be called by the user.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int DataEERead(unsigned int *data, unsigned int addr)
{
    unsigned int currentPage=0;
    unsigned int activePage=0;
    unsigned int pageCount;
    unsigned int addLoc;
    unsigned int dataLoc;
    int addrIndex;
    unsigned int addrRead;

    if(addr >= DATA_EE_SIZE)
    {
        SetPageIllegalAddress(1);
        return(5);
    }

    // Find the current active page.
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_ACTIVE) == PAGE_ACTIVE)
      {
         activePage++;
         if(GetPageStatus(pageCount, STATUS_CURRENT) == PAGE_CURRENT)
         {
            currentPage = pageCount;
         }
      }
    }

    if(activePage == 0)
    {
       SetPageCorruptStatus(1);
       return(6);
    }

    addLoc = (unsigned int)eedata_addr[currentPage-1] + 16;
    
    addrIndex = 1356; // go to the end of the page where address is stored.
    do // scan the current page
    {
       addrRead = (*(int*)(addrIndex+addLoc));
       if((addrRead & 0x3FF)== addr)
       {
         dataLoc = (addrIndex*2) + DATA_OFFSET + 4 + addLoc;
         *data = (*(int*)(dataLoc));
         if(((addrRead & 0xFCFF)>>0xA) == EmulationCheckSum(*data))
         {
            return (0); //Success
         }
         else
         {
            SetPageCorruptStatus(1);
            return(6);
         } 
       }
       else if(((addrRead>>16)&0x3FF) == addr)
       {
         dataLoc = (addrIndex*2) + DATA_OFFSET + addLoc;
         *data = (*(int*)(dataLoc));
         if(((addrRead & 0xFCFFFFFF)>>0x1A) == EmulationCheckSum(*data))
         {
            return 0; //Success
         }
         else
         {
            SetPageCorruptStatus(1);
            return(6);
         } 
       }
       addrIndex -=4;
    }while(addrIndex >= 0);

    if((addrIndex < 0)&&(activePage == 2))
    {
      addLoc = (unsigned int)eedata_addr[PrevPage(currentPage)-1]+16;//go to the previous page starting
    }

    if(activePage == 2)
    {
       addrIndex = 1356; // go to the end of the page where address is stored.
       do // scan the second active page.
       {
          addrRead = (*(int*)(addrIndex+addLoc));
          if((addrRead & 0x3FF)== addr)
          {
            dataLoc = (addrIndex*2) + DATA_OFFSET + 4 + addLoc;
            *data = (*(int*)(dataLoc));
            if(((addrRead & 0xFCFF)>>0xA) == EmulationCheckSum(*data))
            {
               return 0; //Success
            }
            else
            {
               SetPageCorruptStatus(1);
               return(6);
            } 
          }
          else if(((addrRead>>16)&0x3FF) == addr)
          {
            dataLoc = (addrIndex*2) + DATA_OFFSET + addLoc;
            *data = (*(int*)(dataLoc));
            if(((addrRead & 0xFCFFFFFF)>>0x1A) == EmulationCheckSum(*data))
            {
               return 0; //Success
            }
            else
            {
               SetPageCorruptStatus(1);
               return(6);
            } 
          }
          addrIndex -=4;
       }while(addrIndex >= 0);
    }
    if(addrIndex<0)
    {
        SetaddrNotFound(1);
        return(1);
    }
    return 0;
}

/****************************************************************************
 * Function:        PackEE
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 6 for page corrupt status.
 *                  Value 7 for write error.
 *                  Value 8 for Low voltage operation.
 *
 * Side Effects:    Generates CPU stall during program/erase operations
 *                  Data EE flags may be updated
 *
 * Overview:        This routine finds the active page and an unexpired packed page. The most
 *                  recent data EEPROM values are located for each address will be read and 
 *                  written into pack page. Page status is read from active
 *                  page and erase/write count is incremented if page 0 is packed. After all
 *                  information is programmed and verified, the current page is erased. The
 *                  packed page becomes the current page. This function can be called at any-
 *                  time by the user to schedule the CPU stall.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int PackEE(void)
{
    int currentPage;
    int pageCount;
    int activePage=0;
    int i;
    unsigned int data;
    unsigned int addr=0;
    unsigned int addCount=0;
    unsigned int addLoc;
    unsigned int nextAddLoc;
    unsigned int addrIndex=0;
    unsigned int nextDataLoc;
    unsigned int lowerAddr=0;
    unsigned int addCheckSum;
    unsigned int retCode;

    // Find the active page.
    for (pageCount = 1; pageCount <= NUM_DATA_EE_PAGES; pageCount++)
    {
      if(GetPageStatus(pageCount, STATUS_ACTIVE) == PAGE_ACTIVE)
      {
         activePage++;
         if(GetPageStatus(pageCount, STATUS_CURRENT) == PAGE_CURRENT)
         {
            currentPage = pageCount;
         }
      }
    }

    switch(activePage)
    {
      case 1:
         break;
      case 2:
         addLoc = (unsigned int)eedata_addr[currentPage %NUM_DATA_EE_PAGES]+16;

         do
         {
            addr = addCount;
            if((DataEERead(&data,addr) != 0) && (dataEEFlags.val ==1))            
            {
                addCount++;
                continue;
            }
            else if(dataEEFlags.val > 1)
            {
                SetPageCorruptStatus(1);
                return (6);
            }
            nextAddLoc = addLoc + addrIndex;
            addCheckSum = (unsigned int)EmulationCheckSum(data);
            addCheckSum = addCheckSum << 0xA;
            if(lowerAddr == 0)
            {
                addr = ((addCheckSum | addr)<<16)|0xFFFF;
                retCode = NVMWriteWord((void*)(nextAddLoc), addr);
                nextDataLoc = (addrIndex*2) + DATA_OFFSET + addLoc;
                if(!retCode)
                    retCode = NVMWriteWord((void*)(nextDataLoc), data);
                if(retCode & _NVMCON_LVDERR_MASK)
                {
                    SetLowVoltageError(1);
                    return (8);
                }
                else if(retCode & _NVMCON_WRERR_MASK)
                {
                    SetPageWriteError(1);
                    return (7);
                }
                lowerAddr = 1;
                //Check whether data and address are written correctly.
                if((addr != (*(int *)(nextAddLoc))) || (data != (*(int *)(nextDataLoc))))
                {
                    SetPageWriteError(1);
                    return(7);  //Error - RAM does not match PM
                }
            }
            else if(lowerAddr == 1)
            {
                addr = addCheckSum | addr | 0xFFFF0000;
                retCode = NVMWriteWord((void*)(nextAddLoc), addr);
                nextDataLoc = (addrIndex*2) + DATA_OFFSET + 4 + addLoc;
                if(!retCode)
                   retCode = NVMWriteWord((void*)(nextDataLoc), data);
                if(retCode & _NVMCON_LVDERR_MASK)
                {
                    SetLowVoltageError(1);
                    return (8);
                }
                else if(retCode & _NVMCON_WRERR_MASK)
                {
                    SetPageWriteError(1);
                    return (7);
                }
                addrIndex +=4;
                lowerAddr = 0;
                //Check whether data and address are written correctly.
                if(((addr<<16) != ((*(int *)(nextAddLoc))<<16)) || (data != (*(int *)(nextDataLoc))))
                {
                    SetPageWriteError(1);
                    return(7);  //Error - RAM does not match PM
                }
            }
            addCount++;
         }while(addCount < DATA_EE_SIZE);

         if(addrIndex != DATA_OFFSET)
         {
            retCode = NVMWriteWord((void*)(addLoc-16), 0xFFFDFFFF); //mark the packed page as active and current.
            ErasePage(currentPage);
            ErasePage(PrevPage(currentPage));
         }
         else
         {
            retCode = NVMWriteWord((void*)(addLoc-16), 0xFFF9FFFF); //mark the packed page as active and not current.
            ErasePage(currentPage);
            ErasePage(PrevPage(currentPage));
            
            switch(currentPage)//mark the next page as current and active.
            {
               case 1:
                  retCode = NVMWriteWord((void*)eedata_addr[2], 0xFFFDFFFF);
                  break;
               case 2:
                  retCode = NVMWriteWord((void*)eedata_addr[0], 0xFFFDFFFF);
                  break;
               case 3:
                  retCode = NVMWriteWord((void*)eedata_addr[1], 0xFFFDFFFF);
                  break;
               default:
                  break;
            }
         }
         if(retCode & _NVMCON_LVDERR_MASK)
         {
            SetLowVoltageError(1);
            return (8);
         }
         else if(retCode & _NVMCON_WRERR_MASK)
         {
            SetPageWriteError(1);
            return (7);
         }
            
         break;
      case 3:
         SetPagePackBeforeInit(1);
         break; // Error - no active page
      default:
         break;
    }

    return(0);
}

/****************************************************************************
 * Function:        DataEEWriteArray
 *
 * PreCondition:    None
 *
 * Input:           char array pointer, address to be started and the size of array
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 2 for expired page.
 *                  Value 4 for pack skipped.
 *                  Value 5 for Illegal address.
 *                  Value 6 for page corrupt status.
 *                  Value 7 for write error.
 *                  Value 8 for Low voltage operation.
 *
 * Side Effects:    Data EE flags may be updated. CPU stall occurs for flash
 *                  programming. Pack may be generated.
 *
 * Overview:        This routine will write a char array of data with a given 
 *                  starting address upto the array size specified by the user.
 *                  Use DataEEWriteArray function to read the data written using this function
 *                  This is solely designed to write char array.
 *
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int DataEEWriteArray(unsigned char *data, unsigned int addr, unsigned int size)
{
   int i;
   int numberOfWords;
   unsigned int status=0;
   unsigned int writeData;
   unsigned char *tempData;

   if((size%4))
   {
      numberOfWords = (size/4)+1;
   }
   else
   {
      numberOfWords = (size/4);
   }
   tempData = data;
   
   for(i=0; i<numberOfWords; i++)
   {
      writeData = (((unsigned int)*tempData)<<24) | (((unsigned int)*(tempData+1))<<16) | (((unsigned int)*(tempData+2)) << 8) | (*(tempData+3));
      tempData +=4;
      if((status = DataEEWrite(writeData, addr))>0)
      {
         return status;
      }
      addr++;
   }
   return (0);
}

/****************************************************************************
 * Function:        DataEEReadArray
 *
 * PreCondition:    None
 *
 * Input:           data pointer, address to be started and the size of array
 *
 * Output:          Check the dataEEFlags for the error status.
 *                  value 0 for success.
 *                  Value 1 for address not found.
 *                  Value 5 for Illegal address.
 *                  Value 6 for page corrupt status.
 *
 * Side Effects:    Data EE flags may be updated. Reading the data in between the 
 *                  array address will cause incorrect data return.
 *
 * Overview:        This function will read a byte array of values starting from addr 
 *                  and will copy to the array pointer "data". User should read the
 *                  data from the starting address of the array. 
 *                  
 * Note:            This is a public function.
 *****************************************************************************/
unsigned int DataEEReadArray(unsigned char *data, unsigned int addr, unsigned int size)
{
   int i;
   unsigned int status=0;
   unsigned int numberOfWords;
   unsigned int readData;
   unsigned int count=0;

   if((size%4))
   {
      numberOfWords = (size/4)+1;
   }
   else
   {
      numberOfWords = (size/4);
   }
   for(i=0; i<numberOfWords; i++)
   {
      if((status = DataEERead(&readData,addr))>0)
      {
         return status;
      }
      
      *(data+count++) = (readData & 0xFF000000)>>24;
      *(data+count++) = (readData & 0xFF0000)>>16;
      *(data+count++) = (readData & 0xFF00)>>8;
      *(data+count++) = (readData & 0xFF);
      addr++;
   }
   return (0);
}

