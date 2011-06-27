// *** flash.h *****************************************************************

void
flash_erase_pages(uint32 *addr, uint32 npages);

void
flash_write_words(uint32 *addr, uint32 *data, uint32 nwords);

void
flash_initialize(void);

