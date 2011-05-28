//************************************************************************
//*	HardwareSerial.h
//*
//*	Arduino Library for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	Got MPLAB X working on MacOSX 1.6 for the first time
//*	May 25, 2011	<MLS> Added support for Uart2 on UNO32
//************************************************************************
/*
  HardwareSerial.h - Hardware serial library for Wiring
  Copyright (c) 2006 Nicholas Zambetti.  All right reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#ifndef HardwareSerial_h
#define HardwareSerial_h
#define __LANGUAGE_C__

#include <inttypes.h>
#include <plib.h>

#include "Print.h"

//#undef _UART3A
//#undef _UART3B

//************************************************************************
//*	this defines which serial ports are present
enum 
{
	kSerialPort_dummy	=	0,
#if defined (_UART1) && !defined(_UART1A)
	kSerialPort_1,
#endif

#if defined (_UART1A)
	kSerialPort_1A,
#endif

#if defined (_UART1B)
	kSerialPort_1B,
#endif

#if defined (_UART2) && !defined(_UART2A)
	kSerialPort_2,
#endif

#if defined (_UART2A)
	kSerialPort_2A,
#endif

#if defined (_UART2B)
	kSerialPort_2B,
#endif
	
#if defined (_UART3) && !defined(_UART3A)
	kSerialPort_3,
#endif

#if defined (_UART3A)
	kSerialPort_3A,
#endif

#if defined (_UART3B)
	kSerialPort_3B,
#endif

#if defined (_UART4) 
	kSerialPort_4,
#endif

#if defined (_UART5) 
	kSerialPort_5,
#endif

#if defined (_UART6) 
	kSerialPort_6,
#endif

	kSerialPort_extra

};

#define	kSerialPort_Count	(kSerialPort_extra - 1)

//************************************************************************


// Define constants and variables for buffering incoming serial data.  We're
// using a ring buffer, in which rx_buffer_head is the index of the
// location to which to write the next incoming character and rx_buffer_tail
// is the index of the location from which to read.
#define RX_BUFFER_SIZE 128

typedef struct 
{
	unsigned char buffer[RX_BUFFER_SIZE];
	int head;
	int tail;
} ring_buffer;


//*******************************************************************************************
class HardwareSerial : public Print
{
	private:
		ring_buffer				*_rx_buffer;
		uint8_t					_uartNumber;
		//*	pic32 registers
		volatile uint32_t		*_UxBRG;
		volatile uint32_t		*_UxMODE;
		volatile uint32_t		*_UxSTA;
		volatile uint32_t		*_UxTXREG;
		
	public:
		HardwareSerial(	uint8_t					uartNumber,
						ring_buffer				*rx_buffer,
						volatile uint32_t		*uxbrg_reg,
						volatile uint32_t		*uxmode_reg,
						volatile uint32_t		*uxsta_reg,
						volatile uint32_t		*uxtxreg_reg
						);

		void	begin(long baudRate);
		void	end();
		uint8_t	available(void);
		int		read(void);
		void	flush(void);
		virtual	void	write(uint8_t);
		using	Print::write; // pull in write(str) and write(buf, size) from Print
};

#if defined(_BOARD_MEGA_)
	extern HardwareSerial Serial;
	extern HardwareSerial Serial1;
	extern HardwareSerial Serial2;
	extern HardwareSerial Serial3;

	#define	_HARDWARE_SERIAL_1_AVAILABLE_	
	#define	_HARDWARE_SERIAL_2_AVAILABLE_	
	#define	_HARDWARE_SERIAL_3_AVAILABLE_	
	
	#define	_HARDWARE_SERIAL_PORT_COUNT_	4
#else

	#if defined (_UART1) || defined(_UART1A)
		extern HardwareSerial Serial;
		#define	_HARDWARE_SERIAL_0_AVAILABLE_	
	#endif

	#ifdef _UART2
		extern HardwareSerial Serial1;
		#define	_HARDWARE_SERIAL_1_AVAILABLE_	
	#endif

	#ifdef _UART3
		extern HardwareSerial Serial2;
		#define	_HARDWARE_SERIAL_2_AVAILABLE_	
	#endif

	#ifdef _UART4
		extern HardwareSerial Serial3;
		#define	_HARDWARE_SERIAL_3_AVAILABLE_	
	#endif

	#ifdef _UART5
		extern HardwareSerial Serial4;
		#define	_HARDWARE_SERIAL_4_AVAILABLE_	
	#endif

	#ifdef _UART6
		extern HardwareSerial Serial5;
		#define	_HARDWARE_SERIAL_5_AVAILABLE_	
	#endif
#endif

#endif		//	HardwareSerial_h
