// Test the accuracy of pulseIn.  The implementation of pulseIn depends
// on constants which must be calibrated against analysis of the compiler
// generated code.  If the pulseIn source changes, or the compiler is
// updated and generates different output, or the analysis is flawed,
// pulseIn can be become wildly inaccurate.

// Written by Paul Stoffregen, October 2011, paul@pjrc.com
// This code is in the public domain.  You may use, copy, modify it.

#include <ArduinoTestSuite.h>
#include "pulse_hardware.h"

void setup() {
  pinMode(pulseout_pin, OUTPUT);
  pinMode(pulsein_pin, INPUT);
  int mem = ATS_GetFreeMemory();
  ATS_begin("Arduino", "PulseInTest");
  run(HIGH);
  run(LOW);
  ATS_ReportMemoryUsage(mem);
  Serial.print("info.diagnostic = Frequency on pin ");
  Serial.print((int)pulseout_pin);
  Serial.print(" should be ");
  Serial.print(freq);
  Serial.println(" Hz");
  ATS_end();
}


// run the pulseIn test on a variety of PWM signals.
//
void run(byte polarity) {
  static int count = 1;
  unsigned int errint;
  float measure, ideal, error;
  long measure_l, ideal_l;
  char buf[120];

  for (int n=20; n < 235; n += 10) {
    analogWrite(pulseout_pin, n);
    delay(5);
    measure = pulse_test(polarity);
    if (polarity == HIGH) {
      ideal = period * ((float)n / 255.0);
    } else {
      ideal = period * (1.0 - (float)n / 255.0);
    }
    error = (ideal - measure) / ideal;
    if (error < 0.0) error *= -1.0;
    errint = (unsigned int)(error * 1000.0 + 0.5);
    measure_l = (long)(measure * 10.0 + 0.5);
    ideal_l = (long)(ideal * 10.0 + 0.5);
    sprintf(buf, "PulseInTest.%02d (measure=%ld.%ld, ideal=%ld.%ld, err=%u.%u%%",
      count++, measure_l / 10, measure_l % 10,
      ideal_l / 10, ideal_l % 10,
      errint / 10, errint % 10);
    ATS_PrintTestStatus(buf, (error < 0.03));
  }
  analogWrite(pulseout_pin, 128);
}


// do pulseIn 500 times and return the average
// but if pulseIn ever returns 0, abort and return 0
//
float pulse_test(uint8_t polarity)
{
  unsigned long n, sum = 0;
  for (int i=0; i < 500; i++) {
    noInterrupts();
    n = pulseIn(pulsein_pin, polarity, 100000);
    interrupts();
    if (n == 0) return 0;
    sum = sum + n;
  } 
  return (float)sum * 0.002;
}


void loop() {
}


