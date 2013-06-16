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

  stringOne = F("flash string");
  ATS_PrintTestStatus("61. assign flash string", stringOne == "flash string");
  stringOne += F(" test");
  ATS_PrintTestStatus("62. append flash string", stringOne == "flash string test");
  ATS_PrintTestStatus("63. append flash string", stringOne == F("flash string test"));
  ATS_PrintTestStatus("64. add flash string", F("1234 ") + stringOne == "1234 flash string test");

  stringOne = F("tst");
  char *ptr = NULL;
  stringOne.concat(ptr);
  ATS_PrintTestStatus("65. append", stringOne == "tst");
  ATS_PrintTestStatus("66. concat", stringOne + "123" + ptr + "hi" == "tst123hi");
  ATS_PrintTestStatus("67. append", stringOne == "tst");

  stringOne = F("TST");
  stringOne.concat("");
  ATS_PrintTestStatus("68. append", stringOne == "TST");
  ATS_PrintTestStatus("69. concat", stringOne + "" == "TST");
  ATS_PrintTestStatus("70. append", stringOne == "TST");

  stringOne = F("ZXDY");
  stringOne.concat("123");
  ATS_PrintTestStatus("71. append", stringOne == "ZXDY123");
  ATS_PrintTestStatus("72. concat", stringOne + "567" == "ZXDY123567");
  ATS_PrintTestStatus("73. append", stringOne == "ZXDY123");

  stringOne = F("ra");
  stringOne.concat(F("573"));
  ATS_PrintTestStatus("74. append", stringOne == "ra573");
  ATS_PrintTestStatus("75. concat", stringOne + F("4543") == "ra5734543");
  ATS_PrintTestStatus("76. append", stringOne == "ra573");

  /*
    * Test complete
   */

  ATS_end();
}


//************************************************************************
void loop()
{

}


