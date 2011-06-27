// *** flash.c *****************************************************************
//
// this file implements the low level flash control and access.
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.

#include "main.h"

#define NVMOP_PAGE_ERASE        0x4004      // Page erase operation
#define NVMOP_WORD_PGM          0x4001      // Word program operation

static
void
__attribute__((nomips16))
flash_operation(unsigned int nvmop)
{
    // Enable Flash Write/Erase Operations
    NVMCON = NVMCON_WREN | nvmop;

    NVMKEY = 0xAA996655;
    NVMKEY = 0x556699AA;
    NVMCONSET = NVMCON_WR;

    // Wait for WR bit to clear
    while (NVMCON & NVMCON_WR) {
        // NULL
    }
    ASSERT(! (NVMCON & NVMCON_WR));

    // Disable Flash Write/Erase operations
    NVMCONCLR = NVMCON_WREN;

    // assert no errors
    ASSERT(! (NVMCON & (_NVMCON_WRERR_MASK | _NVMCON_LVDERR_MASK)));
}

void
flash_erase_pages(uint32 *addr_in, uint32 npages_in)
{
#if SODEBUG
    int i;
#endif
    int x;
    uint32 *addr;
    uint32 npages;

    addr = addr_in;
    npages = npages_in;

    x = splx(7);
    DMACONSET = _DMACON_SUSPEND_MASK;
    while (! DMACONbits.SUSPEND) {
        // NULL
    }
    
    // while there are more pages to erase...
    while (npages) {
        // Convert Address to Physical Address
        NVMADDR = KVA_TO_PA((unsigned int)addr);
    
        // Unlock and Erase Page
        flash_operation(NVMOP_PAGE_ERASE);

        npages--;
        addr += FLASH_PAGE_SIZE/sizeof(uint32);
    }

    DMACONCLR = _DMACON_SUSPEND_MASK;
    (void)splx(x);

#if SODEBUG
    for (i = 0; i < npages_in*FLASH_PAGE_SIZE/sizeof(uint32); i++) {
        assert(addr_in[i] == -1);
    }
#endif
}

void
flash_write_words(uint32 *addr_in, uint32 *data_in, uint32 nwords_in)
{
#if SODEBUG
    int i;
#endif
    int x;
    uint32 *addr;
    uint32 *data;
    uint32 nwords;

    addr = addr_in;
    data = data_in;
    nwords = nwords_in;

    x = splx(7);
    DMACONSET = _DMACON_SUSPEND_MASK;
    while (! DMACONbits.SUSPEND) {
        // NULL
    }
    
    while (nwords--) {
        // Convert Address to Physical Address
        NVMADDR = KVA_TO_PA((unsigned int)addr);
    
        // Load data into NVMDATA register
        NVMDATA = *data;
    
        // Unlock and Write Word
        flash_operation(NVMOP_WORD_PGM);
    
        addr++;
        data++;
    }

    DMACONCLR = _DMACON_SUSPEND_MASK;
    (void)splx(x);

#if SODEBUG
    for (i = 0; i < nwords_in; i++) {
        assert(addr_in[i] == data_in[i]);
    }
#endif
}
