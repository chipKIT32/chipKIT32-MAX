#ifndef StaticDynamicMemory_h
#define StaticDynamicMemory_h

/*
||
|| @file        StaticDynamicMemory.h
|| @version     1.1
|| @author      Alexander Brevig
|| @contact     alexanderbrevig@gmail.com
||
|| @description
|| | A class for providing dynamic memory in a static context
|| | 
|| | Additionally this library implements an algorithm  of my own invention that ensures no fragmentation
|| | At all times, the memory used is as efficiently used as possible
|| | For details regarding this algorithm, please contact me
|| #
||
|| @license
|| | Copyright (c) 2010 Alexander Brevig
|| | This library is free software; you can redistribute it and/or
|| | modify it under the terms of the GNU Lesser General Public
|| | License as published by the Free Software Foundation; version
|| | 2.1 of the License.
|| |
|| | This library is distributed in the hope that it will be useful,
|| | but WITHOUT ANY WARRANTY; without even the implied warranty of
|| | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
|| | Lesser General Public License for more details.
|| |
|| | You should have received a copy of the GNU Lesser General Public
|| | License along with this library; if not, write to the Free Software
|| | Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
|| #
||
*/

/*
	TODO explain and comment the algorithm and logic
*/
typedef char blockId;
	
template <int size>
class StaticDynamicMemory {
public:
	StaticDynamicMemory() {
		for (int i=0; i<size; i++) {
			block[i] = 0;
		}
	}
	int capacityFor(blockId bid) {
		char *ptr = blockFor(bid);
		if (!ptr) { return 0; }
		return ptr[-HEADER_LENGTH]-HEADER_LENGTH; 
	}
	int newBlock(int length) {
		static int currentID = 1;
		char *blockpoint = &block[0];
		char *blockstart = blockpoint;
		while (blockpoint != &block[size-1]) {
			if (*blockpoint == 0) {
				//possible block found
				blockstart = blockpoint + HEADER_LENGTH;
				int iterations = 0;
				do {
					iterations++;
					if (iterations>length) { 
						blockstart[IDX_BLOCK_ID] =  currentID++;
						blockstart[IDX_ALLOCATED_BLOCK_LENGTH] =  iterations+1;
						return currentID-1; 
					}
				}while (*(++blockpoint)==0);
			} else {
				blockpoint += blockpoint[0];
			}
		}
		return 0;
	}
	bool freeFor(blockId id) {
		char* ptr = blockFor(id);
		if (ptr==0) {return false;}
		char* free = ptr;
		free -= HEADER_LENGTH;
		int end = free[0];
		for (char *endp=free+end; endp!=&block[size-1]; free++, endp++) {
			*free = *endp;
		}
		return true;
	}
	char *blockFor(blockId id) {
		if (id==0) {return 0;}
		char *blockpoint = &block[0];
		int whileIterations = 1;
		while (blockpoint != &block[size-1]) {
			if (blockpoint[-IDX_BLOCK_ID]==id) {
				return &blockpoint[HEADER_LENGTH]; 
			}
			blockpoint += blockpoint[0];
			whileIterations++;
			if (whileIterations>size) {	break; } //stop infinate loop if it happens
			//TODO add error flag
		}
		char* ptr = 0;
		return ptr;
	}
	void growFor(blockId bid, int amount) {
		char *ptr = blockFor(bid);
		if (ptr==0) {return;}
		int id = newBlock(amount);

		if (id!=0) {
			char* free = ptr;
			free -= HEADER_LENGTH; //include the length and id
			int length = free[0];
			
			char* end = blockFor(id);

			end -= HEADER_LENGTH; //include the length and id

			for (int i=0; i<length; i++) {
				*end = *free;
				char* f = free;
				while( (f+1) != &block[size-1]) {
					*f = *(f+1);
					f++;
				}
			}
			
			ptr = blockFor(bid);
			ptr[-HEADER_LENGTH] += amount;
			
		}
	}
	//DUMMY TODO remove
	inline char* getBlock() {return block;}

private:
	static const char HEADER_LENGTH = 2;
	static const char IDX_ALLOCATED_BLOCK_LENGTH = -2;
	static const char IDX_BLOCK_ID = -1;
	char block[size];
};

#endif