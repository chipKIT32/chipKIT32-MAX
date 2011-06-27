// *** util.c ******************************************************************
//
// this file implements generic utility functions.
//
// This file originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and was originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.

#include "main.h"

// set the current interrupt mask level and return the old one
int
splx(int level)
{
#if ! INTERRUPT
    return 0;
#else
    int csr;
    int oldlevel;

    // get the sr
    csr = _CP0_GET_STATUS();

    oldlevel = (csr >> 10) & 7;
    if (level <= 0) {
        // we're going down
        level = -level;
    } else {
        // we're going up
        level = MAX(level, oldlevel);
    }
    assert(level >= 0 && level <= 7);
    csr = (csr & 0xffffe3ff) | (level << 10);

    // update the sr
    _CP0_SET_STATUS(csr);

    assert(oldlevel >= 0 && oldlevel <= 7);
    return -oldlevel;
#endif
}

void *
memcpy(void *d,  const void *s, size_t n)
{
    uint8 *dtemp = d;
    const uint8 *stemp = s;

    while (n--) {
        *(dtemp++) = *(stemp++);
    }
    return d;
}

void *
memset(void *p,  int d, size_t n)
{
    uint8 *ptemp = p;

    while (n--) {
        *(ptemp++) = d;
    }
    return p;
}

char *
strcpy(char *dest, const char *src)
{
    char *orig_dest = dest;

    do {
        *(dest++) = *src;
    } while (*(src++));

    return orig_dest;
}
