#ifndef __PGMSPACE_H_
#define __PGMSPACE_H_ 1

#include <inttypes.h>
//Program stub for creating compatibltiy with PROGMEM apps from Arduino
// neither PROGMEM or PSTR are needed for PIC32, just define them as null
#ifdef PROGMEM
#undef PROGMEM
#endif
#define PROGMEM

#ifndef PGM_P
#define PGM_P const char *
#endif

#ifdef PSTR
#undef PSTR
#endif
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

#ifdef pgm_read_byte
#undef pgm_read_byte
#endif
#define pgm_read_byte(x)        (*((char *)x))

#ifdef pgm_read_byte_near
#undef pgm_read_byte_near
#endif
#define pgm_read_byte_near(x)   (*((char *)x))

#ifdef pgm_read_byte_far
#undef pgm_read_byte_far
#endif
#define pgm_read_byte_far(x)    (*((char *)x))

#ifdef pgm_read_word
#undef pgm_read_word
#endif
#define pgm_read_word(x)        (*((short *)x))

#ifdef pgm_read_word_near
#undef pgm_read_word_near
#endif
#define pgm_read_word_near(x)   (*((short *)x))

#ifdef pgm_read_word_far
#undef pgm_read_word_far
#endif
#define pgm_read_word_far(x)    (*((short *)x))

#ifdef pgm_read_dword
#undef pgm_read_dword
#endif
#define pgm_read_dword(x)        (*((int *)x))

#ifdef pgm_read_dword_near
#undef pgm_read_dword_near
#endif
#define pgm_read_dword_near(x)   (*((int *)x))

#ifdef pgm_read_dword_far
#undef pgm_read_dword_far
#endif
#define pgm_read_dword_far(x)    (*((int *)x))

#ifdef pgm_read_float
#undef pgm_read_float
#endif
#define pgm_read_float(x)       (*((float *)x))

#ifdef pgm_read_double
#undef pgm_read_double
#endif
#define pgm_read_double(x)      (*((double *)x))

#ifdef prog_void
#undef prog_void
#endif
#define prog_void const void

#ifdef prog_uchar
#undef prog_uchar
#endif
#define prog_uchar const unsigned char

#ifdef prog_int8_t
#undef prog_int8_t
#endif
#define prog_int8_t const int8_t

#ifdef prog_uint8_t
#undef prog_uint8_t
#endif
#define prog_uint8_t const uint8_t

#ifdef prog_int16_t
#undef prog_int16_t
#endif
#define prog_int16_t const int16_t

#ifdef prog_uint16_t
#undef prog_uint16_t
#endif
#define prog_uint16_t const uint16_t

#ifdef prog_int32_t
#undef prog_int32_t
#endif
#define prog_int32_t const int32_t

#ifdef prog_uint32_t
#undef prog_uint32_t
#endif
#define prog_uint32_t const uint32_t

#ifdef prog_int64_t
#undef prog_int64_t
#endif
#define prog_int64_t const int64_t

#ifdef prog_uint64_t
#undef prog_uint64_t
#endif
#define prog_uint64_t const uint64_t


#ifdef memcpy_P
#undef memcpy_P
#endif
#define memcpy_P(dest, src, num) memcpy((dest), (src), (num))

#ifdef strcat_P
#undef strcat_P
#endif
#define strcat_P(dest, src) strcat((dest), (src))

#ifdef strcpy_P
#undef strcpy_P
#endif
#define strcpy_P(dest, src) strcpy((dest), (src))


#endif /* __PGMSPACE_H_ */
