/* Software serial simple single byte RX and TX test for chipKIT

USB serial, Serial1 (UART1) and SoftwareSerial are all connected
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
  // Any bytes that come in on the software serial port, send to USB
  if (SoftSerial.available()) {
    Serial.print("S:");
    Serial.write(SoftSerial.read());
    Serial.println();
  }
  // Any bytes that come in on Serial1, send to USB
  if (Serial1.available()) {
    Serial.print("H:");
    Serial.write(Serial1.read());
    Serial.println();
  }
  // Any bytes that come in on the USB port, send to both Serial1 and SoftwareSerial
  if (Serial.available()) {
    char c = Serial.read();
    Serial1.write(c);
    // Since we can't send and receive on SoftSerial at the same time, delay this send a bit
    delay(20);
    SoftSerial.write(c);
  }
}

