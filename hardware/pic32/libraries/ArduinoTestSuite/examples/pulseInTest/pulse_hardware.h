// Teensy++ 2.0
#if defined(__AVR_AT90USB1286__) && defined(CORE_TEENSY)
const float freq = ((float)F_CPU / 8.0 / 255.0 / 2.0);
const float period = (float)1000000.0 / freq;
const int pulseout_pin = 16;
const int pulsein_pin = 17;
#endif

// Teensy 2.0
#if defined(__AVR_ATmega32U4__) && defined(CORE_TEENSY)
const float freq = ((float)F_CPU / 8.0 / 255.0 / 2.0);
const float period = (float)1000000.0 / freq;
const int pulseout_pin = 9;
const int pulsein_pin = 8;
#endif

// Arduino Uno
#if defined(__AVR_ATmega328P__)
const float freq = ((float)F_CPU / 64.0 / 255.0 / 2.0);
const float period = (float)1000000.0 / freq;
const int pulseout_pin = 3;
const int pulsein_pin = 2;
#endif

