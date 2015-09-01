SoftwareSerial - chipKIT version
Re-written July 2015 by Brian Schmalz of Schmalz Haus : brian@schmalzhaus.com

CURRENT STATUS : Version 1.0 : August 31st, 2015
    Work in progress. All example sketches compmile for all chipKIT boards, and run properly 
    at 115200 and 300 baud. But there is functionality that is not yet implemented, and many
    optomizations left to be coded and tested (see top of .cpp file for TODO list). Main
    problem is that even at lower baud rates, we always turn off all interrupts for the whole
    system any time we transmit or receive a byte. This really messes with anything that needs
    interrupts to run. Also it's not possible currently to transmit and recieve at the same time
    on any software serial objects. So, as far as software serial objects are concerned, everything
    must be kept half duplex.

Change Notification:

The PIC32 processors have a feature called Change Notification. This feature can genrate an interrupt when an edge is seen on a particular pin. In the SoftwareSerial library, we use this Change Nofication feature whenever possible on the RX pin. This allows for an interrupt based receive mechanism so that .available() can work properly and so that the mainline code doesn't need to sit and poll for a received byte.

The PIC32MX1/2 and the PIC32MZ family hve Change Notification available on every pin.

The PIC32MX3/4/5/6/7 families have Change Notification aviailable only on some pins. They are listed here:
CN0  - RC14
CN1  - RC13
CN2  - RB0
CN3  - RB1
CN4  - RB2
CN5  - RB3
CN6  - RB4
CN7  - RB5
CN8  - RG6
CN9  - RG7
CN10 - RG8
CN11 - RG9
CN12 - RB15
CN13 - RD4
CN14 - RD5
CN15 - RD6
CN16 - RD7
CN17 - RF4
CN18 - RF5
CN19 - RD13
CN20 - RD14
CN21 - RD15
Since each chipKIT board has these pins mapped to different digial pin numbers, this table can only reference the PIC32 port and bit of the Change Notification pins.



Notes: Even if the RX pin of a Software Serial object is on a Change Notification pin, sending any data out any Software Serial objects during the reception of any Software Serial data on any Software Serial objects may cause received data corruption. This is because any transmitting from any Software Serial objects disable interrupts for the entire byte time, thus preventing the proper reception of any RX data. Transmitting from any Software Serial object also disables Change Notification detction to prevent firing of the CN interrupt after the data is transmitted if there was a change on a CN input during the transmission. This means that all Software Serial transactions must be half duplex. This rule can be broken if the transmitting baud rate is significantly higher than the receiving baud rate, so that the chance of disabling interrupts during a received edge is very small, thus changing the received timing of the RX byte edges only slightly.

Sometimes .avilable() will be true, but there will no bytes in the buffer. Not sure why this happens, but it's easy to test again for .available() (the second time will always be correct).

Reception of higher baud rates (can't know exactly - depends on what else is running) will be unreliable. This is because some other interrupt can fire, and prevent the Change Noficiation ISR from gettin control before the start bit is complete. If this happens, the CN ISR checks to see if there still a start bit, and can find that the RX pin is high (i.e. start bit complete) and it then has no idea where the byte started in time. This will generate incorrect byte values every now and then.

Baud Rates: Baud rates at 230,400 and beyond have been tested for transmission, and do work, although that speed is right on the edge of what a 48MHz chipKIT can handle. As the baud rate gets higher, the chance of missing the start bit increases. As the baud rate goes lower, the interrupts are disabled for longer and longer (during every send and receive operation), so that's a trade off as well. For RX, baud rates of 115,200 is about as high as you can go on a 48Mhz chipKIT. Faster speeds work fine on fater boards.