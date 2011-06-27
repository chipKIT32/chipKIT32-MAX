// *** util.h ******************************************************************

// N.B. the usb controller bdt data structures and the usb protocol
// layers are defined to be little endian.

#define TF_LITTLE(x)  (x)

int
splx(int level);

void *
memcpy(void *d,  const void *s, size_t n);

void *
memset(void *p,  int d, size_t n);

char *
strcpy(char *dest, const char *src);
