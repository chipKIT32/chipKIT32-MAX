/*
  twi.c - TWI/I2C library for Wiring & Arduino (chipKit line)
  Copyright (c) 2011 Digilent.  All right reserved.
  Author: Oliver Jones
  Revision Date: 5/20/2011

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

#include <plib.h>
#include "twi.h"

static volatile uint8_t twi_state;
static uint8_t twi_slarw;

static volatile uint8_t TW_STATUS;

static void (*twi_onSlaveTransmit)(void);
static void (*twi_onSlaveReceive)(uint8_t*, int);

static uint8_t twi_masterBuffer[TWI_BUFFER_LENGTH];
static volatile uint8_t twi_masterBufferIndex;
static uint8_t twi_masterBufferLength;

static uint8_t twi_txBuffer[TWI_BUFFER_LENGTH];
static volatile uint8_t twi_txBufferIndex;
static volatile uint8_t twi_txBufferLength;

static uint8_t twi_rxBuffer[TWI_BUFFER_LENGTH];
static volatile uint8_t twi_rxBufferIndex;
static volatile uint8_t twi_rxBufferLength;

static volatile uint8_t twi_error;

/* 
 * Function twi_init
 * Desc     readys twi pins and sets twi bitrate
 * Input    none
 * Output   none
 */
void twi_init( void )
{
	// Enable the I2C1 module and turn on clock stretching.
	I2C1CONSET = ( 1 << bnOn ) | ( 1 << bnStren );
	// Enable Interrupts
	IEC0SET = ( 1 << bnI2c1mie ) | ( 1 << bnI2c1sie) | ( 1 << bnI2c1bie); // Enable interrupts
	IPC6SET = ( 1 << bnI2c1ip2) | ( 1 << bnI2c1ip1); // Setup Interupt Priority
	
	// Configure the I2C1 baud rate generator to output the appropriate
	// clock.
	I2C1BRGSET = ( CLK_PBUS/ ( 2 * TWI_FREQ ) ) - 2;
	
	// Clear the interrupt flags associated with the I2C1 module.
	IFS0CLR = ( 1 << bnI2c1mif ) | ( 1 << bnI2c1sif ) | ( 1 << bnI2c1bif );
	INTEnableSystemMultiVectoredInt ();
	INTEnableInterrupts ();
}

/* 
 * Function twi_slaveInit
 * Desc     sets slave address
 * Input    none
 * Output   none
 */
void twi_setAddress(uint8_t address)
{
  // set twi slave address
  I2C1ADDSET = address;
}

/* 
 * Function twi_readFrom
 * Desc     attempts to become twi bus master and read a
 *          series of bytes from a device on the bus
 * Input    address: 7bit i2c device address
 *          data: pointer to byte array
 *          length: number of bytes to read into array
 * Output   number of bytes read
 */
uint8_t twi_readFrom(uint8_t address, uint8_t* data, uint8_t length)
{
  unsigned int i;
  // Ensure data will fit into buffer
  if(TWI_BUFFER_LENGTH < length){
    return 0;
  }

  // reset error state (0xFF.. no error occured)
  twi_error = 0xFF;

  // initialize buffer iteration vars
  twi_masterBufferIndex = 0;
  twi_masterBufferLength = length;

   // send start condition
  TW_STATUS = TW_START;
  twi_slarw = ( address << 1 ) + 1;
  I2C1CONSET = ( 1 << bnSen );

  // wait for write operation to complete
  while(TW_IDLE != TW_STATUS)
  {
	asm volatile("nop");
  }

  // Set length to what was actualy sent
  length = twi_masterBufferIndex;

  // copy twi buffer to data
  for(i = 0; i < length; i++){
    data[i] = twi_masterBuffer[i];
  }

  return length;
}

/* 
 * Function twi_writeTo
 * Desc     attempts to become twi bus master and write a
 *          series of bytes to a device on the bus
 * Input    address: 7bit i2c device address
 *          data: pointer to byte array
 *          length: number of bytes in array
 *          wait: boolean indicating to wait for write or not
 * Output   0 .. success
 *          1 .. length to long for buffer
 *          2 .. address send, NACK received
 *          3 .. data send, NACK received
 *          4 .. other twi error (lost bus arbitration, bus error, ..)
 */
uint8_t twi_writeTo(uint8_t address, uint8_t* data, uint8_t length, uint8_t wait)
{
  uint8_t i;

  // ensure data will fit into buffer
  if(TWI_BUFFER_LENGTH < length){
    return 1;
  }

  // reset error state (0xFF.. no error occured)
  twi_error = 0xFF;

  // initialize buffer iteration vars
  twi_masterBufferIndex = 0;
  twi_masterBufferLength = length;
  
  // copy data to twi buffer
  for(i = 0; i < length; ++i){
    twi_masterBuffer[i] = data[i];
  }
  
  // send start condition
  TW_STATUS = TW_START;
  twi_slarw = ( address << 1 );
  I2C1CONSET = ( 1 << bnSen );

  // wait for write operation to complete
  while(wait && TW_IDLE != TW_STATUS)
  {
	asm volatile("nop");
  }

  if (twi_error == 0xFF)
    return 0;	// success
  else if (twi_error == TW_MT_SLA_NACK)
    return 2;	// error: address send, nack received
  else if (twi_error == TW_MT_DATA_NACK)
    return 3;	// error: data send, nack received
  else
    return 4;	// other twi error
}

/* 
 * Function twi_transmit
 * Desc     fills slave tx buffer with data
 *          must be called in slave tx event callback
 * Input    data: pointer to byte array
 *          length: number of bytes in array
 * Output   1 length too long for buffer
 *          2 not slave transmitter
 *          0 ok
 */
uint8_t twi_transmit(uint8_t* data, uint8_t length)
{
  uint8_t i;

  // ensure data will fit into buffer
  if(TWI_BUFFER_LENGTH < length){
    return 1;
  }
  
  // set length and copy data into tx buffer
  twi_txBufferLength = length;
  for(i = 0; i < length; ++i){
    twi_txBuffer[i] = data[i];
  }
  
  return 0;
}

/* 
 * Function twi_attachSlaveRxEvent
 * Desc     sets function called before a slave read operation
 * Input    function: callback function to use
 * Output   none
 */
void twi_attachSlaveRxEvent( void (*function)(uint8_t*, int) )
{
  twi_onSlaveReceive = function;
}

/* 
 * Function twi_attachSlaveTxEvent
 * Desc     sets function called before a slave write operation
 * Input    function: callback function to use
 * Output   none
 */
void twi_attachSlaveTxEvent( void (*function)(void) )
{
  twi_onSlaveTransmit = function;
}


/* 
 * Function I2CHandler
 * Desc     Handler for slave and master interrupt requests
 * Input    none
 * Output   none
 */
void __ISR(_I2C_1_VECTOR , ipl6) I2CHandler(void)
{
	if ( I2C1STAT & ( 1 << bnBcl ) ) 
	{
		// Bus collusion occured exit
		I2C1STATCLR = ( 1 << bnBcl );
		TW_STATUS = TW_ARB_LOST;
	}
	else if( IFS0 & ( 1 << bnI2c1mif ) )
	{
		asm volatile("nop");
	}
	else if( IFS0 & ( 1 << bnI2c1sif ) )
	{
		// Slave interrupt ocurred
		if( !( I2C1STAT & ( 1 << bnDa )) )
		{
			// Clear recieve register
			twi_slarw = I2C1RCV;

			if( twi_slarw & 1 )
			{
				// Data was Requested
				TW_STATUS = TW_ST_SLA;
			}
			else
			{
				// Data will be recieved
				TW_STATUS = TW_SR_SLA;
			}
		}
	}

	switch(TW_STATUS)
	{
		case TW_START: // sent start condition
			// Check if data will be sent or recieved
			if( twi_slarw & 1 )
			{
				TW_STATUS = TW_MR_SLA;
			}
			else
			{
				TW_STATUS = TW_MT_SLA;
			}
			I2C1TRN = twi_slarw;
			break;

		case TW_STOP:
			// Set status to idle to exit while loop
			TW_STATUS = TW_IDLE;
			break;

		//Master Transmitter
		case TW_MT_SLA:
  		    // Check if adress was acked or nacked
			if ( I2C1STAT & ( 1 << bnAckstat ) )
			{	
				twi_error = TW_MT_SLA_NACK;		
				TW_STATUS = TW_STOP;
				I2C1CONSET = ( 1 << bnPen );
				break;
			}
			TW_STATUS = TW_MT_DATA; //No break, immediately send data
		case TW_MT_DATA:
			if ( I2C1STAT & ( 1 << bnAckstat ) )
			{
				// Data was nacked send stop bit
				twi_error = TW_MT_DATA_NACK;
				TW_STATUS = TW_STOP;
				I2C1CONSET = ( 1 << bnPen );
			}
			else
			{
				// Check if there is more data to send
				if(twi_masterBufferIndex < twi_masterBufferLength)
				{
					// More data to send load transmit buffer
					I2C1TRN = twi_masterBuffer[twi_masterBufferIndex];
					twi_masterBufferIndex++;
				}
				else
				{
					// No more data to send
					TW_STATUS = TW_STOP;
					// Send stop condition
					I2C1CONSET = ( 1 << bnPen );
				}
			}	
			break;
		
		//Master Receiver
		case TW_MR_SLA: // address sent, ack received
			// Check if adress was acked or nacked
			if ( I2C1STAT & ( 1 << bnAckstat ) )
			{	
				twi_error = TW_MR_SLA_NACK;		
				TW_STATUS = TW_STOP;
				I2C1CONSET = ( 1 << bnPen );
				break;
			}
			I2C1CONSET = ( 1 << bnRcen );
			TW_STATUS = TW_MR_DATA;
			break;

		case TW_MR_DATA: // data received
			// put byte into buffer
			twi_masterBuffer[twi_masterBufferIndex] = I2C1RCV;
			twi_masterBufferIndex++;
			// ack if more bytes are expected, otherwise nack
			if(twi_masterBufferIndex < twi_masterBufferLength)
			{
				I2C1CONCLR = ( 1 << bnAckdt ); // Send Ack
				I2C1CONSET = ( 1 << bnAcken );
				TW_STATUS = TW_MR_ACK_SENT;
			}
			else
			{		
				I2C1CONSET = ( 1 << bnAckdt ); // Send Nack
				I2C1CONSET = ( 1 << bnAcken );
				TW_STATUS = TW_MR_NACK_SENT;
			}
			break;

		case TW_MR_ACK_SENT:
			// Set I2C for recieving
			I2C1CONSET = ( 1 << bnRcen );
			TW_STATUS = TW_MR_DATA;
			break;

		case TW_MR_NACK_SENT:
			// Send stop bit
			I2C1CONSET = ( 1 << bnPen );
			TW_STATUS = TW_STOP;
			break;

		//Slave Reciever
		case TW_SR_SLA:
			twi_rxBufferIndex = 0;
			TW_STATUS = TW_SR_DATA;
			// Release clock line
			I2C1CONSET = ( 1 << bnSclrel );
			break;

		case TW_SR_DATA:
			twi_rxBuffer[0] = I2C1RCV;
			twi_onSlaveReceive(twi_rxBuffer, 1);
			// Release clock line
			I2C1CONSET = ( 1 << bnSclrel );
			I2C1STATCLR = ( 1 << bnI2cov ) | ( 1 << bnRbf );
			break;

		//Slave Transmitter
		case TW_ST_SLA:
			twi_txBufferIndex = 0;
			twi_txBufferLength = 0;
			TW_STATUS = TW_ST_DATA;
			
			twi_onSlaveTransmit();

			if(0 == twi_txBufferLength)
			{
				twi_txBufferLength = 1;
				twi_txBuffer[0] = 0x00;
			} // No break, immediately send data
		case TW_ST_DATA:
			if ( I2C1STAT & ( 1 << bnAckstat ) )
			{
				I2C1CONSET = ( 1 << bnSclrel );
				break; // Master requires no more data
			}
			else
			{
				// Check if ther is more data to send otherwise send null
				if(twi_txBufferIndex < twi_txBufferLength)
				{
					I2C1TRN = twi_txBuffer[twi_txBufferIndex++];			
				}
				else
				{
					I2C1TRN = 0;
				}
				I2C1CONSET = ( 1 << bnSclrel );	
			}
			break;

		case TW_ARB_LOST: // lost bus arbitration
			TW_STATUS = TW_IDLE;
			twi_error = TW_ARB_LOST;
			break;
	}
	IFS0CLR = ( 1 << bnI2c1mif ) | ( 1 << bnI2c1sif) | ( 1 << bnI2c1bif );
}


