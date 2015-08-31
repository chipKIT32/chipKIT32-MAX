SoftwareSerial - chipKIT version
Re-written July 2015 by Brian Schmalz of Schmalz Haus : brian@schmalzhaus.com


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