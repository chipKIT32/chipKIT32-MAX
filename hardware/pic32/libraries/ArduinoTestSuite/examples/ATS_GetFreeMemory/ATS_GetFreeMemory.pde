//************************************************************************
//*	Arduino Test of ATS_GetFreeMemory 
//*		(C) 2011 by Matthew Murdoch
//*		Open source as per standard Arduino code
//*
//************************************************************************
//*	Jun 17,	2011	<MEM> Tests for ATS_GetFreeMemory
//************************************************************************
#include <ArduinoTestSuite.h>

void setup() {
  ATS_begin("Arduino", "ATS_GetFreeMemory() Tests");

  testAllocatingThenDeallocatingPreservesFreeMemory();
  testAllocatingAndDeallocatingInterleavedPreservesFreeMemory();
  testRepeatedlyAllocatingAndDeallocatingMemoryPreservesFreeMemory();
  testReallocatingSmallerPreservesFreeMemory();
  testReallocatingLargerPreservesFreeMemory();
  testAllocatingAndDeallocatingSmallerPreservesFreeMemory();
  testReallocatingRepeatedlyLargerPreservesFreeMemory();

  ATS_end();
}

// This test checks that the free list is taken into account when free memory is calculated
// when using versions of free() which *don't* reset __brkval (such as in avr-libc 1.6.4)
void testAllocatingThenDeallocatingPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();

  void* buffer = malloc(10);
  free(buffer);
  
  ATS_PrintTestStatus("Allocating then deallocating preserves free memory", startMemory == ATS_GetFreeMemory());
}

// This test checks that the free list is taken into account when free memory is calculated
// even when using versions of free() which *do* reset __brkval (such as in avr-libc 1.7.1)
void testAllocatingAndDeallocatingInterleavedPreservesFreeMemory() {
  void* buffer1 = malloc(10);
  int startMemory = ATS_GetFreeMemory();

  void* buffer2 = malloc(10);
  free(buffer1);
  
  ATS_PrintTestStatus("Interleaved allocation and deallocation preserves free memory", startMemory == ATS_GetFreeMemory());
  
  free(buffer2);
}

void testRepeatedlyAllocatingAndDeallocatingMemoryPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();

  for (int i = 0; i < 10; i++) {
    void* buffer1 = malloc(10);
    void* buffer2 = malloc(10);
    void* buffer3 = malloc(10);
    free(buffer3);
    free(buffer2);
    free(buffer1);
  }
 
  ATS_PrintTestStatus("Repeated allocation and deallocation preserves free memory", startMemory == ATS_GetFreeMemory());
}

// TODO MM Currently fails as __brkval is not increased, but the size of the free list is...
// Therefore looks as if the total amount of free memory increases (i.e. negative memory leak)!
void testReallocatingSmallerPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();
  
  // Allocate one byte more than the space taken up by a free list node
  void* buffer = malloc(5);
  buffer = realloc(buffer, 1);
  free(buffer);
  
  ATS_PrintTestStatus("Reallocating smaller preserves free memory", startMemory == ATS_GetFreeMemory());
}

void testReallocatingLargerPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();

  void* buffer = malloc(1);
  buffer = realloc(buffer, 5);
  free(buffer);
  
  ATS_PrintTestStatus("Reallocating larger preserves free memory", startMemory == ATS_GetFreeMemory());
}

void testAllocatingAndDeallocatingSmallerPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();
  
  // Allocate one byte more than the space taken up by a free list node
  void* buffer = malloc(5);
  free(buffer);
  buffer = malloc(1);
  free(buffer);
  
  ATS_PrintTestStatus("Allocating and deallocating smaller preserves free memory", startMemory == ATS_GetFreeMemory());
}

void testReallocatingRepeatedlyLargerPreservesFreeMemory() {
  int startMemory = ATS_GetFreeMemory();
  
  void* buffer = malloc(2);
  for (int i = 4; i <= 8; i+=2) {
    buffer = realloc(buffer, i);
  }
  free(buffer);
  
  ATS_PrintTestStatus("Reallocating repeatedly larger preserves free memory", startMemory == ATS_GetFreeMemory());
}

void loop() {
}
