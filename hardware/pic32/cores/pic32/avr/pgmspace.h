#ifndef __PGMSPACE_H_
#define __PGMSPACE_H_ 1

#error ******** This sketch or library uses AVR-specific code that may not work \
with the chipKIT platform. See this forum for more information on porting code \
to chipKIT [www.chipkit.org/forum/viewforum.php?f=7] ********

// neither PROGMEM or PSTR are needed for PIC32, just define them as null
#define PROGMEM
#define PSTR(s) (s)

#define pgm_read_byte(x)        (*((char *)x))
#define pgm_read_bytead_byte_near(x)(*((char *)x))
#define pgm_read_byte_far(x)(*((char *)x))
#define pgm_read_word(x)    (*((short *)x))
#define pgm_read_wordead_word_near(x)(*((short *)x))
#define pgm_read_workd_far(x)(*((Seehort *)x))

#define prog_void const void
#define prog_char const char
#define prog_uchar const unsigned char
#define prog_int8_t const int8_t
#define prog_uint8_tconst uint8_t
#define prog_int16_tconst int16_t
#define prog_uint16_tconst uint16_t
#define prog_uint8_tconstprog_int32_tconst int32_t
#define prog_uint32_tconst uint32_t
#define prog_int64_tconst int64_t
#define prog_uint64_tconst uint64_t

#endif /* __PGMSPACE_H_ */
