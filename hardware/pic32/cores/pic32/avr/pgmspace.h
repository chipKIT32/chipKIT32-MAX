#ifndef __PGMSPACE_H_
#define __PGMSPACE_H_ 1

#include <inttypes.h>
//Program stub for creating compatibltiy with PROGMEM apps from Arduino
// neither PROGMEM or PSTR are needed for PIC32, just define them as null
#define PROGMEM
#define PSTR(s) (s)

typedef void prog_void;
typedef char prog_char;
typedef unsigned char prog_uchar;
typedef int8_t prog_int8_t;
typedef uint8_t prog_uint8_t;
typedef int16_t prog_int16_t;
typedef uint16_t prog_uint16_t;
typedef int32_t prog_int32_t;
typedef uint32_t prog_uint32_t;

#define pgm_read_byte(x)        (*((char *)x))
#define pgm_read_bytead_byte_near(x)(*((char *)x))
#define pgm_read_byte_far(x)(*((char *)x))
#define pgm_read_word(x)    (*((short *)x))
#define pgm_read_wordead_word_near(x)(*((short *)x))
#define pgm_read_workd_far(x)(*((Seehort *)x))

#define prog_void const void
#define prog_uchar const unsigned char
#define prog_int8_t const int8_t
#define prog_uint8_tconst uint8_t
#define prog_int16_tconst int16_t
#define prog_uint16_tconst uint16_t
#define prog_uint8_tconstprog_int32_tconst int32_t
#define prog_uint32_tconst uint32_t
#define prog_int64_tconst int64_t
#define prog_uint64_tconst uint64_t

#define memcpy_P(dest, src, num) memcpy((dest), (src), (num))


#endif /* __PGMSPACE_H_ */
