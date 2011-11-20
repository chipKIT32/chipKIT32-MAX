/************************************************************************/
/*																		*/
/*	Deeprom.h	--	eeprom routine declarations							*/
/*																		*/
/************************************************************************/
/*	Author: 	Oliver Jones											*/
/*	Copyright 2011, Digilent Inc.										*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	09/01/2011(OliverJ): created										*/
/*																		*/
/************************************************************************/

#include <stdint.h>

#define fTrue 1
#define fFalse 0

typedef uint32_t BOOL;

typedef union {
	struct {
		//Bit deterimes whether a segment is usable or not
		unsigned valid : 1;
		//Bit dtermines whether the segment is in use or free to be used
		unsigned taken : 1;
		unsigned address : 22;
		unsigned data : 8;
	} temp;
	unsigned int data;
} eeSeg;

BOOL setMax(uint32_t value);
uint32_t getMax();
void clearEeprom();
BOOL writeEeprom(uint32_t address, uint8_t data);
BOOL readEeprom(uint32_t address, uint8_t * data);
BOOL putEeprom(eeSeg * eeprom, uint32_t address, uint8_t data);
BOOL getEeprom(eeSeg * eeprom, uint32_t address, uint8_t * data);
uint32_t putBuffer(eeSeg * eeprom, uint8_t * buffer);
void getBuffer(eeSeg * eeprom, uint8_t * buffer);
eeSeg pack(uint32_t address, uint8_t data);
uint32_t getAddress(eeSeg segment);
uint8_t getData(eeSeg segment);
BOOL getValid(eeSeg segment);
BOOL getTaken(eeSeg segment);