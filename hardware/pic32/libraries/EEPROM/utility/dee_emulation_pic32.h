/*********************************************************************
 *
 *       Emulating Data EEPROM for PIC32 microcontrollers
 *
 *********************************************************************
 * FileName:        dee_emulation_pic32.h
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
 * $Id: dee_emulation_pic32.h,v 1.1.1.1 2011/08/12 18:45:37 gapperson Exp $
 *
 **********************************************************************/
    // User defined constants
#define DATA_EE_SIZE        (680) // Total number of 32-bit data
#define NUM_DATA_EE_PAGES   (3) // Total number of pages reserved for the operation
    
    // Internal constants
#define ERASE_WRITE_CYCLE_MAX           (1000) // Maximum erase cycle per page
#define NUMBER_OF_INSTRUCTIONS_IN_PAGE  (1024) // number of 32-bit word instructions per page
#define DATA_OFFSET                     (1360) // The point where address starts
#define PIC32MX_PAGE_SIZE               (NUMBER_OF_INSTRUCTIONS_IN_PAGE*4) // Total page size in bytes

#define PAGE_CURRENT                    1 // Indicate the page status
#define PAGE_NOT_CURRENT                0 // Indicate the page status
#define PAGE_EXPIRED                    0 // Indicate the page status 
#define PAGE_NOT_EXPIRED                1 // Indicate the page status
#define PAGE_AVAILABLE                  1 // Indicate the page status
#define PAGE_NOT_AVAILABLE              0 // Indicate the page status
#define PAGE_ACTIVE                     0 // Indicate the page status
#define PAGE_NOT_ACTIVE                 1 // Indicate the page status

#define STATUS_ACTIVE                   17 // Indicate the page status
#define STATUS_AVAILABLE                18 // Indicate the page status
#define STATUS_CURRENT                  19 // Indicate the page status
#define STATUS_EXPIRED                  20 // Indicate the page status

//Flags for the error/warning conditions.    
typedef union
{
   unsigned int val; // a non-zero value indicate error/warning
   struct
   {
      unsigned addrNotFound:1;       // Return 0x1
      unsigned expiredPage:1;        // Return 0x2
      unsigned packBeforePageFull:1; // Not a return condition
      unsigned packBeforeInit:1;     // Return 0x3
      unsigned packSkipped:1;        // Return 0x4
      unsigned IllegalAddress:1;     // Return 0x5
      unsigned pageCorrupt:1;        // Return 0x6
      unsigned writeError:1;         // Return 0x7
      unsigned lowVoltageError:1;    // Return 0x8
      unsigned reserved:23;          // Reserved for future use
   };
} DATA_EE_FLAGS;
    
extern DATA_EE_FLAGS dataEEFlags; //Flags for the error/warning condition.

#define GetaddrNotFound() dataEEFlags.addrNotFound  //Get the flag address not found
#define SetaddrNotFound(x) dataEEFlags.addrNotFound = x // Set the flag address not found

#define GetPageExpiredPage() dataEEFlags.expiredPage  //Get the flag for expired page
#define SetPageExpiredPage(x) dataEEFlags.expiredPage = x // Set the flag for expired page

#define GetPagePackBeforePageFull() dataEEFlags.packBeforePageFull  //Get the flag for pack before page full
#define SetPagePackBeforePageFull(x) dataEEFlags.packBeforePageFull = x //Set the flag for pack before page full

#define GetPagePackBeforeInit() dataEEFlags.packBeforeInit  //Get the flag for pack before initialize
#define SetPagePackBeforeInit(x) dataEEFlags.packBeforeInit = x //Set the flag for pack before initialize

#define GetPagePackSkipped() dataEEFlags.packSkipped //Get the flag pack skipped
#define SetPagePackSkipped(x) dataEEFlags.packSkipped = x //Set the flag pack skipped

#define GetPageIllegalAddress() dataEEFlags.IllegalAddress  //Get the flag for illegal address
#define SetPageIllegalAddress(x) dataEEFlags.IllegalAddress = x //Set the flag for illegal address

#define GetPageCorruptStatus() dataEEFlags.pageCorrupt  //Get the flag page Corrupt
#define SetPageCorruptStatus(x) dataEEFlags.pageCorrupt = x // Set the flag page corrupt
    
#define GetPageWriteError() dataEEFlags.writeError //Get the flag for write error
#define SetPageWriteError(x) dataEEFlags.writeError = x //Set the flag for write error

#define GetLowVoltageError() dataEEFlags.lowVoltageError//Get the flag for low voltage error
#define SetLowVoltageError(x) dataEEFlags.lowVoltageError = x //Set the flag for low voltage error


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
unsigned int GetNextAvailCount(void);

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
unsigned int   DataEEInit(void);

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
unsigned int DataEERead(unsigned int *data, unsigned int addr);

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
unsigned int DataEEWrite(unsigned int data, unsigned int addr);

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
unsigned int PackEE(void);

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
unsigned int DataEEWriteArray(unsigned char *data, unsigned int addr, unsigned int size);

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
unsigned int DataEEReadArray(unsigned char *data, unsigned int addr, unsigned int size);

