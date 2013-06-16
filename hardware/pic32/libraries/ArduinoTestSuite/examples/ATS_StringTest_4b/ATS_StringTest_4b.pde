//************************************************************************
//*	Arduino String Test
//*		(C) 2010 by Rick Anderson
//*		Open source as per standard Arduino code
//*
//************************************************************************
//*	Oct 16,	2010	<ROA> Started on String Test
//************************************************************************

#include	<ArduinoTestSuite.h>

// known issue: if F() is not implemented (eg, Arduino 0022), this
// sketch will use too much memory for Arduino Uno or Duemilanove
#ifndef F
#define F(s) (s)
#endif

//************************************************************************
void setup()
{
  int startMemoryUsage;

  ATS_begin("Arduino", "Test of String Library");

  String stringOne;
  String stringTwo;
  int i=0;

#if !defined(F) || (ARDUINO >= 100 && !defined(CORE_TEENSY))
// Arduino 1.0, does not support for using F("cstring") with
// String objects... it only works with Serial.print().
// Arduino 0022 does not support F() at all.  However, all
// Teensyduino has F() usable with String in all versions.
// If F() someday works with String on Arduino, this should
// updated.  For all platforms where F() does not work with
// String, we need to undefine F(), so ordinary RAM-hogging
// string constants are used.
#undef F
#define F(s) (s)
#endif

  char c = '7';
  unsigned char uc = '9';
  stringOne = F("tywe");
  stringOne.concat(c);
  stringOne.concat(uc);
  ATS_PrintTestStatus("77. append", stringOne == F("tywe79"));
  stringOne += uc;
  stringOne += c;
  ATS_PrintTestStatus("78. append", stringOne == F("tywe7997"));
  c = '.';
  ATS_PrintTestStatus("79. concat", stringOne + c == F("tywe7997."));
  uc = 'R';
  ATS_PrintTestStatus("80. concat", stringOne + uc == F("tywe7997R"));
  ATS_PrintTestStatus("81. append", stringOne == F("tywe7997"));

  i = -32768;
  stringOne = F("u572h");
  stringOne.concat(i);
  ATS_PrintTestStatus("82. append", stringOne == F("u572h-32768"));
  stringOne += i;
  ATS_PrintTestStatus("83. append", stringOne == F("u572h-32768-32768"));
  i = -25000;
  ATS_PrintTestStatus("84. concat", stringOne + i == F("u572h-32768-32768-25000"));
  ATS_PrintTestStatus("85. append", stringOne == F("u572h-32768-32768"));

  i = 24173;
  stringOne = F("5u1klj");
  stringOne.concat(i);
  ATS_PrintTestStatus("86. append", stringOne == F("5u1klj24173"));
  stringOne += i;
  ATS_PrintTestStatus("87. append", stringOne == F("5u1klj2417324173"));
  ATS_PrintTestStatus("88. concat", stringOne + i == F("5u1klj241732417324173"));
  ATS_PrintTestStatus("89. append", stringOne == F("5u1klj2417324173"));

  unsigned int u = 65190;
  stringOne = F("i8skjm");
  stringOne.concat(u);
  ATS_PrintTestStatus("90. append", stringOne == F("i8skjm65190"));
  stringOne += u;
  ATS_PrintTestStatus("91. append", stringOne == F("i8skjm6519065190"));
  ATS_PrintTestStatus("92. concat", stringOne + u == F("i8skjm651906519065190"));
  ATS_PrintTestStatus("93. append", stringOne == F("i8skjm6519065190"));

  long n = -91093847;
  stringOne = F("ywh");
  stringOne.concat(n);
  ATS_PrintTestStatus("94. append", stringOne == F("ywh-91093847"));
  stringOne += n;
  ATS_PrintTestStatus("95. append", stringOne == F("ywh-91093847-91093847"));
  ATS_PrintTestStatus("96. concat", stringOne + n == F("ywh-91093847-91093847-91093847"));
  ATS_PrintTestStatus("97. append", stringOne == F("ywh-91093847-91093847"));

  unsigned long un = 4294961479;
  stringOne = F("iu");
  stringOne.concat(un);
  ATS_PrintTestStatus("98. append", stringOne == F("iu4294961479"));
  un -= 4;
  stringOne += un;
  ATS_PrintTestStatus("99. append", stringOne == F("iu42949614794294961475"));
  ATS_PrintTestStatus("100. concat", stringOne + un == F("iu429496147942949614754294961475"));
  ATS_PrintTestStatus("101. append", stringOne == F("iu42949614794294961475"));

  /*
    * Test complete
   */

  ATS_end();
}


//************************************************************************
void loop()
{

}


