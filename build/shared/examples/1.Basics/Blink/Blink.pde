/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output.
  // Pin PIN_LED1 has an LED connected on most Arduino and compatible boards:
  pinMode(PIN_LED1, OUTPUT);     
}

void loop() {
  digitalWrite(PIN_LED1, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  digitalWrite(PIN_LED1, LOW);    // set the LED off
  delay(1000);              // wait for a second
}
