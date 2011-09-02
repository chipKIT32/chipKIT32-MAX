//************************************************************************
/*
 Servo.cpp - Interrupt driven Servo library for Arduino using 16 bit timers- Version 2
 Copyright (c) 2009 Michael Margolis.  All right reserved.
 Revision date: 08/18/2011(Michelle Yu)
  
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
//************************************************************************

/* 
 
 A servo is activated by creating an instance of the Servo class passing the desired pin to the attach() method.
 The servos are pulsed in the background using the value most recently written using the write() method
 
 Note that analogWrite of PWM on pins associated with the timer are disabled when the first servo is attached.
 Timers are seized as needed in groups of 8 servos - 16 servos use two timers, 32 servos will use four.
 
 The methods are:
 
 Servo - Class for manipulating servo motors connected to Arduino pins.
 
 attach(pin )  - Attaches a servo motor to an i/o pin.
 attach(pin, min, max  ) - Attaches to a pin setting min and max values in microseconds
 default min is 544, max is 2400  
 
 write()     - Sets the servo angle in degrees.  (invalid angle that is valid as pulse in microseconds is treated as microseconds)
 writeMicroseconds() - Sets the servo pulse width in microseconds 
 read()      - Gets the last written servo pulse width as an angle between 0 and 179. 
 readMicroseconds()   - Gets the last written servo pulse width in microseconds. 
 attached()  - Returns true if there is a servo attached. 
 detach()    - Stops an attached servos from pulsing its i/o pin. 
 
*/
//************************************************************************
//*	Edit History
//************************************************************************
//*	Aug 21,	2011	<GeneApperson> fixed floating point issue by changing to interger math
//*	Sep  1,	2011	<MLS> Cleaning up formatting
//*	Sep  1,	2011	<MLS> Cleaning up formatting
//*	Sep  1,	2011	<MLS> issue #112, changed assigment to compare in finISR
//************************************************************************

#include "Servo.h"

extern "C"{
	#include "int.h"
}

#define usToTicks(_us)	(((_us)*5)/4)					// converts microseconds to tick 
#define ticksToUs(_ticks) ((((unsigned)(_ticks))*4)/5)	// converts from ticks back to microseconds


#define TRIM_DURATION		2								// compensation ticks to trim adjust for digitalWrite delays // 12 August 200


static servo_t servos[MAX_SERVOS];						  // static array of servo structures
int	channel[3];											//channel for the current servo

uint8_t ServoCount	=	0;									 // the total number of attached servos


#define SERVO_MIN() (MIN_PULSE_WIDTH - this->min * 4)  // minimum value in uS for this servo
#define SERVO_MAX() (MAX_PULSE_WIDTH - this->max * 4)  // maximum value in uS for this servo 
#define SERVO_INDEX(_timer,_channel)  ((_timer*SERVOS_PER_TIMER) + _channel)	 // macro to access servo index by timer and channel
#define SERVO_INDEX_TO_TIMER(_servo_nbr) ((int)(_servo_nbr / SERVOS_PER_TIMER)) // returns the timer controlling this servo
#define SERVO(_timer,_channel)  (servos[SERVO_INDEX(_timer,_channel)])			// macro to access servo class by timer and channel
/************ static functions common to all instances ***********************/

//************************************************************************
void handle_interrupts(int timer, volatile unsigned int *TMRn, volatile unsigned int *PR)
{

 
	if ( channel[timer] < 0 )
	{
		*TMRn	=	0; // channel set to -1 indicated that refresh interval completed so reset the timer 
	}
	else
	{
		if ( SERVO_INDEX(timer,channel[timer]) < ServoCount && SERVO(timer,channel[timer]).Pin.isActive == true )
		{
			digitalWrite( SERVO(timer,channel[timer]).Pin.nbr,LOW); // pulse this channel low if activated
		}
	}

	channel[timer]++;	// increment to the next channel
	if ( SERVO_INDEX(timer,channel[timer]) < ServoCount && channel[timer] < SERVOS_PER_TIMER)
	{
		*PR	=	*TMRn + SERVO(timer,channel[timer]).ticks;
		if (SERVO(timer,channel[timer]).Pin.isActive == true)	 // check if activated
		{
			digitalWrite( SERVO(timer,channel[timer]).Pin.nbr,HIGH); // its an active channel so pulse it high
		}
	}
	else
	{ 
		*TMRn	=	channel[timer] * usToTicks(MAX_PULSE_WIDTH);
		// finished all channels so wait for the refresh period to expire before starting over 
		if ( (unsigned)*TMRn < (usToTicks(REFRESH_INTERVAL) + 4) )	// allow a few ticks to ensure the next OCR1A not missed
		{
			*PR	=	(unsigned int)usToTicks(REFRESH_INTERVAL);
		}
		else 
		{
			*PR	=	*TMRn + 4;  // at least REFRESH_INTERVAL has elapsed
		}
		channel[timer]	=	-1; // this will get incremented at the end of the refresh period to start again at the first channel
	}
}




//************************************************************************
static void finISR(int timer)
{
	//disable use of the given timer
	if (timer == TIMER3)
	{
		IEC0CLR = 0x1000;// disable T4 interrupt 
	}
	if (timer == TIMER4)
	{
		IEC0CLR = 0x10000;// disable T4 interrupt 
	}
	if (timer == TIMER5)
	{
		IEC0CLR = 0x100000;// disable T5 interrupt 
	}
}

//************************************************************************
static boolean isTimerActive(int timer)
{
	// returns true if any servo is active on this timer
	for (uint8_t channel=0; channel < SERVOS_PER_TIMER; channel++)
	{
		if (SERVO(timer,channel).Pin.isActive == true)
			return true;
	}
	return false;
}


/****************** end of static functions ******************************/

Servo::Servo()
{
	if ( ServoCount < MAX_SERVOS)
	{
		this->servoIndex = ServoCount++;									// assign a servo index to this instance
		servos[this->servoIndex].ticks = usToTicks(DEFAULT_PULSE_WIDTH);	// store default to neutral position
  	}
	else
		this->servoIndex = INVALID_SERVO ;  // too many servos	
}


//************************************************************************
uint8_t Servo::attach(int pin)
{
	return this->attach(pin, MIN_PULSE_WIDTH, MAX_PULSE_WIDTH);
}

//************************************************************************
uint8_t Servo::attach(int pin, int min, int max)
{
	if (this->servoIndex < MAX_SERVOS )
	{
		if (pin == 0 | pin == 1)
		{
			// disable UART
			U1MODE = 0x0;

		}

		pinMode( pin, OUTPUT) ;								// set servo pin to output
		servos[this->servoIndex].Pin.nbr = pin;
		this->min	=	(MIN_PULSE_WIDTH - min)/4;				//resolution of min/max is 4 uS
		this->max	=	(MAX_PULSE_WIDTH - max)/4; 
		// initialize the timer if it has not already been initialized 
		int timer = SERVO_INDEX_TO_TIMER(this->servoIndex);
		if (isTimerActive(timer) == false)
		{
			initISR(timer);	
		}
		servos[this->servoIndex].Pin.isActive = true;		// this must be set after the check for isTimerActive

		return this->servoIndex ;	 
	}
}



//************************************************************************
void Servo::detach()
{
	servos[this->servoIndex].Pin.isActive = false;
	int timer = SERVO_INDEX_TO_TIMER(servoIndex);
	if (isTimerActive(timer) == false)
	{
		finISR(timer);
	}
}

//************************************************************************
void Servo::write(int value)
{
	if (value < MIN_PULSE_WIDTH)
	{
		// treat values less than 544 as angles in degrees (valid values in microseconds are handled as microseconds)
		if (value < 0) value = 0;
		if (value > 179) value = 179;
		
		value = map(value, 0, 179, SERVO_MIN(), SERVO_MAX());
	}
	this->writeMicroseconds(value);
}

//************************************************************************
void Servo::writeMicroseconds(int value)
{
	// calculate and store the values for the given channel
	byte channel = this->servoIndex;
	if ( (channel >= 0) && (channel < MAX_SERVOS) )	// ensure channel is valid
	{
		if ( value < SERVO_MIN() )			// ensure pulse width is valid
			value = SERVO_MIN();
		else if ( value > SERVO_MAX() )
			value = SERVO_MAX();

		value = value - TRIM_DURATION;
		value = usToTicks(value);			// convert to ticks after compensating for interrupt overhead 



		unsigned int status;
		status = INTDisableInterrupts();
		servos[channel].ticks = value;

		INTRestoreInterrupts(status);
	} 
}

//************************************************************************
int Servo::read() // return the value as degrees
{
	return map( this->readMicroseconds()+1, SERVO_MIN(), SERVO_MAX(), 0, 180);
}

//************************************************************************
int Servo::readMicroseconds()
{
	unsigned int pulsewidth;
	if ( this->servoIndex != INVALID_SERVO )
		pulsewidth = ticksToUs(servos[this->servoIndex].ticks) + TRIM_DURATION ;	// 12 aug 2009
	else 
		pulsewidth	=	0;

	return pulsewidth;
}

//************************************************************************
bool Servo::attached()
{
	return servos[this->servoIndex].Pin.isActive ;
}
