//************************************************************************
//*	HardwareSerial.cpp
//*	
//*	Arduino core files for PIC32
//*		Copyright (c) 2010, 2011 by Mark Sproul
//*	
//*	
//************************************************************************
//*	this code is based on code Copyright (c) 2005-2006 David A. Mellis
//*	
//*	This library is free software; you can redistribute it and/or
//*	modify it under the terms of the GNU Lesser General Public
//*	License as published by the Free Software Foundation; either
//*	version 2.1 of the License, or (at your option) any later version.
//*	
//*	This library is distributed in the hope that it will be useful,
//*	but WITHOUT ANY WARRANTY; without even the implied warranty of
//*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.//*	See the GNU
//*	Lesser General Public License for more details.
//*	
//*	You should have received a copy of the GNU Lesser General
//*	Public License along with this library; if not, write to the
//*	Free Software Foundation, Inc., 59 Temple Place, Suite 330,
//*	Boston, MA  02111-1307  USA
//*	
//*	
//************************************************************************
//*		Important Note
//*			On AVR, uarts start at 0, on Pic, they start at 1
//*			So Serial is uart 1
//*			So Serial1 is really uart 2
//*			etc
//*
//************************************************************************
//*	USB support
//*		If USB is enabled, the first serial port (Serial.xxx) is redirected to USB
//*		Serial0.xxx then takes over for the 1st uart in case the programmer needs to use it as well
//************************************************************************
//*	this code is best viewed with tabs set to 4 spaces
//************************************************************************
//*	Edit History
//************************************************************************
//*	Oct 12,	2010	<MLS> Got MPLAB X working on MacOSX 1.6 for the first time
//*	Oct 12,	2010	<MLS> Discovered pic32-gcc does not support c++
//*	Oct 13,	2010	<MLS> borrowing code from "uart_interrupt.c" example from microchip
//*	Dec 13,	2010	<MLS> Interrupt must be AFTER the read
//*	Jan 22,	2011	<MLS> Working on testing serial1 -> 3
//*	Feb  6,	2011	<MLS> Uart2 working pin Pic32 starterKit (32MX360F512L)
//*	Feb  6,	2011	<MLS> Uart1B, Uart3A, Uart3B working pin Digilent MEGA (32MX795F512L)
//*	Apr 10,	2011	<MLS> Added defs for UNO board
//*	Apr 13,	2011	<MLS> Support for UART4 is NOT finished
//*	May 25, 2011	<MLS> Added support for Uart2 on UNO32
//*	Jun 17,	2011	<MLS> Added Serial4 and Serial5 for MEGA32, ISRs not finished
//*	Jun 24,	2011	<MLS> Adding USB support, code from Rich Testardi (http://www.cpustick.com/downloads.htm)
//*	Jul  3,	2011	<MLS> Fixed bug in baud rate calculation (http://www.chipkit.org/forum/viewtopic.php?f=7&t=213&p=948#p948)
//************************************************************************
#define __LANGUAGE_C__


#include <stdio.h>
#include <string.h>
#include <inttypes.h>

#include <plib.h>

#include "wiring.h"
#include "wiring_private.h"

#include "HardwareSerial.h"

#if defined(_USE_USB_FOR_SERIAL_)
//	#define	_DEBUG_USB_VIA_SERIAL0_
#endif

//*	defines for kSerialPort_x are in "HardwareSerial.h"
#if defined(_UART1) && !defined(_UART1A)
	ring_buffer rx_buffer1 = { { 0 }, 0, 0 };
#endif
#if defined(_UART1A)
	ring_buffer rx_buffer1A = { { 0 }, 0, 0 };
#endif
#if defined(_UART1B)
	ring_buffer rx_buffer1B = { { 0 }, 0, 0 };
#endif

#if defined(_UART2) && !defined(_UART2A)
	ring_buffer rx_buffer2 = { { 0 }, 0, 0 };
#endif
#if defined(_UART2A)
	ring_buffer rx_buffer2A = { { 0 }, 0, 0 };
#endif
#if defined(_UART2B)
	ring_buffer rx_buffer2B = { { 0 }, 0, 0 };
#endif

#if defined(_UART3) && !defined(_UART3A)
	ring_buffer rx_buffer3 = { { 0 }, 0, 0 };
#endif
#if defined(_UART3A)
	ring_buffer rx_buffer3A = { { 0 }, 0, 0 };
#endif
#if defined(_UART3B)
	ring_buffer rx_buffer3B = { { 0 }, 0, 0 };
#endif

#ifdef _UART4
	ring_buffer rx_buffer4 = { { 0 }, 0, 0 };
#endif
#ifdef _UART5
	ring_buffer rx_buffer5 = { { 0 }, 0, 0 };
#endif
#ifdef _UART6
	ring_buffer rx_buffer6 = { { 0 }, 0, 0 };
#endif


//*******************************************************************************************
HardwareSerial::HardwareSerial(	uint8_t					uartNumber,
								ring_buffer				*rx_buffer,
								volatile uint32_t		*uxbrg_reg,
								volatile uint32_t		*uxmode_reg,
								volatile uint32_t		*uxsta_reg,
								volatile uint32_t		*uxtxreg_reg
								)
{
	_uartNumber	=	uartNumber;
	_rx_buffer	=	rx_buffer;
	_UxBRG		=	uxbrg_reg;
	_UxMODE		=	uxmode_reg;
	_UxSTA		=	uxsta_reg;
	_UxTXREG	=	uxtxreg_reg;
}


//*******************************************************************************************
void HardwareSerial::begin(long baudRate)
{
int	configValue;



	*_UxMODE	=	(UART_EN);
	*_UxSTA		=	(UART_RX_ENABLE | UART_TX_ENABLE);
	//	http://www.chipkit.org/forum/viewtopic.php?f=7&t=213&p=948#p948
	*_UxBRG		= 	((__PIC32_pbClk / 16 / baudRate) - 1);	// calculate actual BAUD generate value.

	switch(_uartNumber)
	{
	#if defined(_UART1) && !defined(_UART1A)
		case kSerialPort_1:
			U1MODEbits.UARTEN	=	0x01;
			U1STAbits.UTXEN		=	0x01;

			// Configure UART1 RX Interrupt
			//-ConfigIntUART1(UART_INT_PR2 | UART_RX_INT_EN);
			mU1ClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			SetPriorityIntU1(configValue);
			SetSubPriorityIntU1(configValue);
			mU1SetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif

	#if defined(_UART1A)
		case kSerialPort_1A:
			U1AMODEbits.UARTEN	=	0x01;
			U1ASTAbits.UTXEN	=	0x01;

			mU1AClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			SetPriorityIntU1(configValue);
			SetSubPriorityIntU1(configValue);
			mU1ASetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif

	#if defined(_UART1B)
		case kSerialPort_1B:
			U1BMODEbits.UARTEN	=	0x01;
			U1BSTAbits.UTXEN	=	0x01;

			mU1BClearAllIntFlags();

			configValue			=	UART_INT_PR1 | UART_RX_INT_EN;

			mU1BSetIntPriority((UART_INT_PR1 & 0x7));

			mU1BSetIntSubPriority((((configValue) >> 4) & 3));
			
			mU1BSetIntEnable((((configValue) >> 6) & 7)) ;

			break;
	#endif

	#if defined(_UART2) && !defined(_UART2A)
		case kSerialPort_2:
			U2MODEbits.UARTEN	=	0x01;
			U2STAbits.UTXEN		=	0x01;

			// Configure UART2 RX Interrupt
			mU2ClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			SetPriorityIntU2(configValue);
			SetSubPriorityIntU2(configValue);
			mU2SetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif

	#if defined (_UART3) && !defined(_UART3A)
		case kSerialPort_3:
			U3MODEbits.UARTEN	=	0x01;
			U3STAbits.UTXEN		=	0x01;

			// Configure UART1 RX Interrupt
			//-ConfigIntUART1(UART_INT_PR2 | UART_RX_INT_EN);
			mU3ClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			SetPriorityIntU1(configValue);
			SetSubPriorityIntU1(configValue);
			mU3SetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif


	#if defined(_UART3A)
		case kSerialPort_3A:
			U3AMODEbits.UARTEN	=	0x01;
			U3ASTAbits.UTXEN	=	0x01;

			mU3AClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			mU3ASetIntPriority((configValue & 0x7));

			mU3ASetIntSubPriority((((configValue) >> 4) & 3));
			
			mU3ASetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif

	#if defined(_UART3B)
		case kSerialPort_3B:
			U3BMODEbits.UARTEN	=	0x01;
			U3BSTAbits.UTXEN	=	0x01;

			mU3BClearAllIntFlags();

			configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

			mU3BSetIntPriority((configValue & 0x7));

			mU3BSetIntSubPriority((((configValue) >> 4) & 3));
			
			mU3BSetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif

	#if defined(_UART4)
		case kSerialPort_4:
			U4MODEbits.UARTEN	=	0x01;
			U4STAbits.UTXEN		=	0x01;

		//+	mU4ClearAllIntFlags();

		//+	configValue	=	UART_INT_PR1 | UART_RX_INT_EN;

		//+	mU4SetIntPriority((configValue & 0x7));

		//+	mU4SetIntSubPriority((((configValue) >> 4) & 3));
			
		//+	mU4SetIntEnable((((configValue) >> 6) & 7)) ;
			break;
	#endif
	}

	// Must enable glocal interrupts - in this case, we are using multi-vector mode
	//*	this is already done in Init() (issue #78)
//-	INTEnableSystemMultiVectoredInt();


}


//*******************************************************************************************
void HardwareSerial::end()
{
	//*	disable the uart so that the pins can be used as general purpose I/O
	*_UxMODE	=	0;
}

//*******************************************************************************************
uint8_t HardwareSerial::available(void)
{
	return (RX_BUFFER_SIZE + _rx_buffer->head - _rx_buffer->tail) % RX_BUFFER_SIZE;
}

//*******************************************************************************************
int HardwareSerial::peek()
{
	if (_rx_buffer->head == _rx_buffer->tail)
	{
		return -1;
	}
	else
	{
		return _rx_buffer->buffer[_rx_buffer->tail];
	}
}

//*******************************************************************************************
int HardwareSerial::read(void)
{
	unsigned char theChar;

	// if the head isn't ahead of the tail, we don't have any characters
	if (_rx_buffer->head == _rx_buffer->tail)
	{
		return -1;
	}
	else
	{
		theChar				=	_rx_buffer->buffer[_rx_buffer->tail];
		_rx_buffer->tail	=	(_rx_buffer->tail + 1) % RX_BUFFER_SIZE;
		return (theChar);
	}
}

//*******************************************************************************************
void HardwareSerial::flush()
{
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of rx_buffer_head but before writing
	// the value to rx_buffer_tail; the previous value of rx_buffer_head
	// may be written to rx_buffer_tail, making it appear as if the buffer
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of rx_buffer_head but before writing
	// the value to rx_buffer_tail; the previous value of rx_buffer_head
	// may be written to rx_buffer_tail, making it appear as if the buffer
	// were full, not empty.
	_rx_buffer->head	=	_rx_buffer->tail;
}

//*******************************************************************************************
void HardwareSerial::write(uint8_t theChar)
{
	switch(_uartNumber)
	{
	#if defined(_UART1) && !defined(_UART1A)
		case kSerialPort_1:
			while (!U1STAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART1A)
		case kSerialPort_1A:
			while (!U1ASTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART1B)
		case kSerialPort_1B:
			while (!U1BSTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART2) && !defined(_UART2A)
		case kSerialPort_2:
			while (!U2STAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART2A)
		case kSerialPort_2A:
			while (!U2ASTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART2B)
		case kSerialPort_2B:
			while (!U2BSTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART3A)
		case kSerialPort_3A:
			while (!U3ASTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif

	#if defined(_UART3B)
		case kSerialPort_3B:
			while (!U3BSTAbits.TRMT)
			{
				//*	wait for the buffer to be clear
			}
			break;
	#endif
	}
	*_UxTXREG	=	theChar;
}


//*******************************************************************************************
//*	we need the extern C so that the interrupt handler names dont get mangled by C++
extern "C"
{

//*******************************************************************************************
inline void store_char(unsigned char theChar, ring_buffer *rx_buffer)
{
int	bufIndex;

	bufIndex	= (rx_buffer->head + 1) % RX_BUFFER_SIZE;

	// if we should be storing the received character into the location
	// just before the tail (meaning that the head would advance to the
	// current location of the tail), we're about to overflow the buffer
	// and so we don't write the character or advance the head.
	if (bufIndex != rx_buffer->tail)
	{
		rx_buffer->buffer[rx_buffer->head]	=	theChar;
		rx_buffer->head	=	bufIndex;
	}
}




#if defined(_UART1) && !defined(_UART1A)
//*******************************************************************************************
// UART 1 interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART1_VECTOR, ipl2) IntUart1Handler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU1RXGetIntFlag())
	{

		theChar	=	ReadUART1();
		store_char(theChar, &rx_buffer1);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU1RXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU1TXGetIntFlag() )
	{
		mU1TXClearIntFlag();
	}
}
#endif


#ifdef _UART1A
//*******************************************************************************************
// UART 1a interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_1A_VECTOR, ipl2) IntUart1AHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU1ARXGetIntFlag())
	{

		theChar	=	U1ARXREG;
		store_char(theChar, &rx_buffer1A);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU1ARXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU1ATXGetIntFlag() )
	{
		mU1ATXClearIntFlag();
	}
}
#endif


#ifdef _UART1B
//*******************************************************************************************
// UART 1 interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_1B_VECTOR, ipl2) IntUart1BHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU1BRXGetIntFlag())
	{

		theChar	=	U1BRXREG;
		store_char(theChar, &rx_buffer1B);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU1BRXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU1BTXGetIntFlag() )
	{
		mU1BTXClearIntFlag();
	}
}
#endif


#if defined(_UART2) && !defined(_UART2A)
//*******************************************************************************************
// UART 2 interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART2_VECTOR, ipl2) IntUart2Handler(void)
{
unsigned char theChar;


	// Is this an RX interrupt?
	if (mU2RXGetIntFlag())
	{
	//	theChar	=	ReadUART2();
		theChar	=	U2RXREG;
		store_char(theChar, &rx_buffer2);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU2RXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU2TXGetIntFlag() )
	{
		mU2TXClearIntFlag();
	}
}

#endif

#ifdef _UART2A
//*******************************************************************************************
// UART 2A interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_2A_VECTOR, ipl2) IntUart2AHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU2ARXGetIntFlag())
	{

		theChar	=	U2ARXREG;
		store_char(theChar, &rx_buffer2A);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU2ARXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU2ATXGetIntFlag() )
	{
		mU2ATXClearIntFlag();
	}
}
#endif

#ifdef _UART2B
//*******************************************************************************************
// UART 2B interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_2B_VECTOR, ipl2) IntUart2BHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU2BRXGetIntFlag())
	{

		theChar	=	U2BRXREG;
		store_char(theChar, &rx_buffer2B);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU2BRXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU2BTXGetIntFlag() )
	{
		mU2BTXClearIntFlag();
	}
}
#endif

#if defined(_UART3) && !defined(_UART3A)
//*******************************************************************************************
// UART 3 interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART3_VECTOR, ipl2) IntUart3Handler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU3RXGetIntFlag())
	{
		theChar	=	ReadUART3();
		store_char(theChar, &rx_buffer3);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU3RXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU3TXGetIntFlag() )
	{
		mU3TXClearIntFlag();
	}
}

#endif

#ifdef _UART3A
//*******************************************************************************************
// UART 3A interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_3A_VECTOR, ipl2) IntUart3AHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU3ARXGetIntFlag())
	{

		theChar	=	U3ARXREG;
		store_char(theChar, &rx_buffer3A);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU3ARXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU3ATXGetIntFlag() )
	{
		mU3ATXClearIntFlag();
	}
}
#endif

#ifdef _UART3B
//*******************************************************************************************
// UART 3B interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_3B_VECTOR, ipl2) IntUart3BHandler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
	if (mU3BRXGetIntFlag())
	{

		theChar	=	U3BRXREG;
		store_char(theChar, &rx_buffer3B);

		// Clear the RX interrupt Flag (must be AFTER the read)
		mU3BRXClearIntFlag();
	}

	// We don't care about TX interrupt
	if ( mU3BTXGetIntFlag() )
	{
		mU3BTXClearIntFlag();
	}
}
#endif


#ifdef _UART4_notFinished
//*******************************************************************************************
// UART 4 interrupt handler
// it is set at priority level 2
//*******************************************************************************************
void __ISR(_UART_4_VECTOR, ipl2) IntUart4Handler(void)
{
unsigned char theChar;

	// Is this an RX interrupt?
//	if (mU4RXGetIntFlag())
//	{
//		theChar	=	ReadUART4();
//		store_char(theChar, &rx_buffer4);

		// Clear the RX interrupt Flag (must be AFTER the read)
//		mU4RXClearIntFlag();
//	}

	// We don't care about TX interrupt
//	if ( mU4TXGetIntFlag() )
//	{
//		mU4TXClearIntFlag();
//	}
}

#endif


};	// extern C

//*******************************************************************************************

#pragma mark -
#pragma mark -----------------USB support
#if defined(_USB)

#include	"HardwareSerial_cdcacm.h"
#include	"HardwareSerial_usb.h"

ring_buffer rx_bufferUSB = { { 0 }, 0, 0 };

//****************************************************************
void	USBresetRoutine(void)
{
	
}

//****************************************************************
boolean	USBstoreDataRoutine(const byte *buffer, int length)
{
unsigned int	ii;

	for (ii=0; ii<length; ii++)
	{
		store_char(buffer[ii], &rx_bufferUSB);
	}
}


//*******************************************************************************************
USBSerial::USBSerial(ring_buffer	*rx_buffer)
{
	_rx_buffer			=	rx_buffer;
	_rx_buffer->head	=	0;
	_rx_buffer->tail	=	0;
}

#ifdef _DEBUG_USB_VIA_SERIAL0_
	#define	DebugViaSerial0(x)	Serial0.println(x)
#else
	#define	DebugViaSerial0(x)
#endif


//*******************************************************************************************
void USBSerial::begin(long baudRate)
{
	DebugViaSerial0("USBSerial::begin");

	DebugViaSerial0("calling usb_initialize");
	usb_initialize();
	DebugViaSerial0("returned from usb_initialize");

	cdcacm_register(USBresetRoutine, USBstoreDataRoutine);
	DebugViaSerial0("returned from cdcacm_register");

	// Must enable glocal interrupts - in this case, we are using multi-vector mode
	INTEnableSystemMultiVectoredInt();
	DebugViaSerial0("INTEnableSystemMultiVectoredInt");

}


//*******************************************************************************************
void USBSerial::end()
{
}

//*******************************************************************************************
uint8_t USBSerial::available(void)
{
	return (RX_BUFFER_SIZE + _rx_buffer->head - _rx_buffer->tail) % RX_BUFFER_SIZE;
}

//*******************************************************************************************
int USBSerial::read(void)
{
	unsigned char theChar;

	// if the head isn't ahead of the tail, we don't have any characters
	if (_rx_buffer->head == _rx_buffer->tail)
	{
		return -1;
	}
	else
	{
		theChar				=	_rx_buffer->buffer[_rx_buffer->tail];
		_rx_buffer->tail	=	(_rx_buffer->tail + 1) % RX_BUFFER_SIZE;
		return (theChar);
	}
}

//*******************************************************************************************
void USBSerial::flush()
{
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of rx_buffer_head but before writing
	// the value to rx_buffer_tail; the previous value of rx_buffer_head
	// may be written to rx_buffer_tail, making it appear as if the buffer
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of rx_buffer_head but before writing
	// the value to rx_buffer_tail; the previous value of rx_buffer_head
	// may be written to rx_buffer_tail, making it appear as if the buffer
	// were full, not empty.
	_rx_buffer->head	=	_rx_buffer->tail;
}

//*******************************************************************************************
void USBSerial::write(uint8_t theChar)
{
unsigned char	usbBuf[4];

	usbBuf[0]	=	theChar;
	
	cdcacm_print(usbBuf, 1);
}

//*	testing showed 63 gave better speed results than 64

#define	kMaxUSBxmitPkt	63
//*******************************************************************************************
void USBSerial::write(const uint8_t *buffer, size_t size)
{

	if (size < kMaxUSBxmitPkt)
	{
		//*	it will fit in one transmit packet
		cdcacm_print(buffer, size);
	}
	else
	{
	//*	we can only transmit a maxium of 64 bytes at a time, break it up into 64 byte packets
	unsigned char	usbBuffer[kMaxUSBxmitPkt + 2];
	unsigned short	ii;
	size_t 			packetSize;
	
		packetSize	=	0;
		for (ii=0; ii<size; ii++)
		{
			usbBuffer[packetSize++]	=	buffer[ii];
			if (packetSize >= kMaxUSBxmitPkt)
			{
				cdcacm_print(usbBuffer, packetSize);
				packetSize	=	0;
			}
		}
		if (packetSize > 0)
		{
			cdcacm_print(usbBuffer, packetSize);
		}
	}
}

//*******************************************************************************************
void USBSerial::write(const char *str)
{
size_t size;

	size	=	strlen(str);
	write((const uint8_t *)str, size);
}


#endif		//	defined(_USB)

//*******************************************************************************************
#if defined(_USB) && defined(_USE_USB_FOR_SERIAL_)
//#error USB enabled
		USBSerial		Serial(						&rx_bufferUSB);
#if defined (_UART1A)
		HardwareSerial	Serial0(	kSerialPort_1A,	&rx_buffer1A,	&U1ABRG,	&U1AMODE,	&U1ASTA,	&U1ATXREG);
#elif defined (_UART1)
		HardwareSerial	Serial0(	kSerialPort_1,	&rx_buffer1,	&U1BRG,		&U1MODE,	&U1STA,		&U1TXREG);
#endif


#if defined (_UART1B)
		HardwareSerial	Serial1(	kSerialPort_1B,	&rx_buffer1B,	&U1BBRG,	&U1BMODE,	&U1BSTA,	&U1BTXREG);
#elif defined (_UART1)
		HardwareSerial	Serial1(	kSerialPort_2,		&rx_buffer2,	&U2BRG,	&U2MODE,	&U2STA,	&U2TXREG);
#endif


#if defined (_UART3A)
		HardwareSerial	Serial2(	kSerialPort_3A,	&rx_buffer3A,	&U3ABRG,	&U3AMODE,	&U3ASTA,	&U3ATXREG);
#endif
#if defined (_UART3B)
		HardwareSerial	Serial3(	kSerialPort_3B,	&rx_buffer3B,	&U3BBRG,	&U3BMODE,	&U3BSTA,	&U3BTXREG);
#endif


#if defined (_UART2A)
		HardwareSerial Serial4(	kSerialPort_2A,	&rx_buffer2A,	&U2ABRG,	&U2AMODE,	&U2ASTA,	&U2ATXREG);
#endif
#if defined (_UART2B)
		HardwareSerial Serial5(	kSerialPort_2B,	&rx_buffer2B,	&U2BBRG,	&U2BMODE,	&U2BSTA,	&U2BTXREG);
#endif	//	defined(_USB) && defined(_USE_USB_FOR_SERIAL_)


//*******************************************************************************************
#elif defined(_BOARD_MEGA_)
		HardwareSerial	Serial(		kSerialPort_1A,	&rx_buffer1A,	&U1ABRG,	&U1AMODE,	&U1ASTA,	&U1ATXREG);
		HardwareSerial	Serial1(	kSerialPort_1B,	&rx_buffer1B,	&U1BBRG,	&U1BMODE,	&U1BSTA,	&U1BTXREG);
		HardwareSerial	Serial2(	kSerialPort_3A,	&rx_buffer3A,	&U3ABRG,	&U3AMODE,	&U3ASTA,	&U3ATXREG);
		HardwareSerial	Serial3(	kSerialPort_3B,	&rx_buffer3B,	&U3BBRG,	&U3BMODE,	&U3BSTA,	&U3BTXREG);


		HardwareSerial	Serial4(	kSerialPort_2A,	&rx_buffer2A,	&U2ABRG,	&U2AMODE,	&U2ASTA,	&U2ATXREG);
		HardwareSerial	Serial5(	kSerialPort_2B,	&rx_buffer2B,	&U2BBRG,	&U2BMODE,	&U2BSTA,	&U2BTXREG);

//*******************************************************************************************
#elif defined(_BOARD_UNO_)
		HardwareSerial	Serial(		kSerialPort_1,		&rx_buffer1,	&U1BRG,		&U1MODE,	&U1STA,		&U1TXREG);
		HardwareSerial	Serial1(	kSerialPort_2,		&rx_buffer2,	&U2BRG,	&U2MODE,	&U2STA,	&U2TXREG);

//*******************************************************************************************
//*	the Explorer 16 board has the DB9 port connected to the Uart2 which is normally serial 1
//*	these need to be reversed
//*******************************************************************************************
#elif defined(_BOARD_PIC32_EXPLORER16_)

	#warning	Explorer 16 Serial is actually on Uart2, the DB9 connector
	#ifdef _UART1
		HardwareSerial Serial1(	1,				&rx_buffer1,	&U1BRG,	&U1MODE,	&U1STA,	&U1TXREG);
	#endif
	#ifdef _UART2
		HardwareSerial Serial(	2,				&rx_buffer2,	&U2BRG,	&U2MODE,	&U2STA,	&U2TXREG);
	#endif

//*******************************************************************************************
#else
//*	this is the NORMAL mode of operation
//*	this should be for _BOARD_PIC32_STARTER_KIT_

	#if defined (_UART1) && !defined(_UART1A)
		HardwareSerial Serial(	kSerialPort_1,		&rx_buffer1,	&U1BRG,		&U1MODE,	&U1STA,		&U1TXREG);
	#elif defined(_UART1A)
		HardwareSerial Serial(	kSerialPort_1A,		&rx_buffer1A,	&U1ABRG,	&U1AMODE,	&U1ASTA,	&U1ATXREG);
	#else
		#error Serial not defined for this CPU
	#endif

	#if defined(_UART1B)
		HardwareSerial Serial1(	kSerialPort_1B,		&rx_buffer1B,	&U1BBRG,	&U1BMODE,	&U1BSTA,	&U1BTXREG);
	#elif defined (_UART2) && !defined(_UART2A)
		HardwareSerial Serial1(	kSerialPort_2,		&rx_buffer2,	&U2BRG,	&U2MODE,	&U2STA,	&U2TXREG);
	#endif

	
	
	#if defined (_UART3) && !defined(_UART3A)
	//*******************************************************************************************
		HardwareSerial Serial2(	kSerialPort_3,		&rx_buffer3,	&U3BRG,	&U3MODE,	&U3STA,	&U3TXREG	);
	#elif defined(_UART3A)
		HardwareSerial Serial2(	kSerialPort_3A,	&rx_buffer3A,	&U3ABRG,	&U3AMODE,	&U3ASTA,	&U3ATXREG);
	#endif

	#ifdef _UART4
	//*******************************************************************************************
		HardwareSerial Serial3(	kSerialPort_4,		&rx_buffer4,	&U4BRG,	&U4MODE,	&U4STA,	&U4TXREG	);
	#endif

	#ifdef _UART5
	//*******************************************************************************************
		HardwareSerial Serial4(	kSerialPort_5,		&rx_buffer5,	&U5BRG,	&U5MODE,	&U5STA,	&U2TXREG	);
	#endif

	#ifdef _UART6
	//*******************************************************************************************
		HardwareSerial Serial5(	kSerialPort_6,		&rx_buffer6,	&U6BRG,	&U6MODE,	&U6STA,	&U6TXREG	);
	#endif
#endif
