/* Software serial mutliple  byte RX and TX test for chipKIT

USB serial, Serial0 (UART1) and SoftwareSerial are all connected
so that data from the PC goes out Serial1 TX and in Software RX,
also same data goes out Software TX and in Serial1 RX.
All data from Serial1 RX and Software RX goes up to PC via USB.

The circuit: 
 Fubarino Mini
 * Software TX (11) connect to Serial1 RX (25)
 * Software RX (10) connect to Serial1 TX (26)
 
 Fubarino SD:
 * Software TX (11) connect to Serial1 RX (31)
 * Software RX (10) connect to Serial1 TX (32)
 
 uC32/UNO32:
 * Software TX (11) connect to Serial1 RX (39)
 * Software RX (10) connect to Serial1 TX (40)

 Test instructions: Open the serial monitor. Every half second or
 so you will see a long line containing all of the HEX values from
 00 to FF. If any of them are missing or in the wrong order, then
 the SoftwareSerial receive routines are not working right.
 
 This demo shows that a SoftwareSerial object (on a CN pin) can
 receive 256 bytes, buffer them all properly, and then the sketch
 can read in the data later.
 
 This example code is in the public domain. */

#include <SoftwareSerial.h>

SoftwareSerial SoftSerial(10, 11); // RX, TX

void setup() {
  int32_t i;
  
  // Open serial communications and wait for port to open:
  Serial.begin(57600);
  while (!Serial) {
    ;
  }

  Serial.println("Beginning SoftwareSerial test.");
  // Open hardware UART port up
  Serial1.begin(115200);
  // Open software serial port up
  SoftSerial.begin(115200);
  
}

void loop() {
  uint16_t i;
  // Send buffer out Serial1 to be received by SoftSerial
  for (i=0; i < 256; i++)
  {
    Serial1.write(i);
  }
  
  // Now wait a bit for all bytes to be sent
  delay(500);
  
  // And see what's in the SoftSerial RX buffer
  while (SoftSerial.available()) {
    Serial.print(SoftSerial.read(), HEX);
    Serial.print(" ");
  }
  Serial.println();
}

