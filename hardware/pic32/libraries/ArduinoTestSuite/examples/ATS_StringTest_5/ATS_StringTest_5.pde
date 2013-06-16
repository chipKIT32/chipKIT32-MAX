#include	<ArduinoTestSuite.h>

#ifndef F
#define F(s) (s)
#endif

void setup()
{
  int startMemoryUsage;
  ATS_begin("Arduino", "Test of String Library");

  /*
   * Test Variable Setup
   * Best practive set all your test variables prior to teseting.
   * This is required for Memory tests.
   */

  String stringOne;
  String stringTwo;
  String stringThree;
  char charResult[100];
  int i;

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

  stringOne = "123";
  stringTwo = "456";  // TODO: repeat this test for all overload permutations
  stringThree = "789";
  stringOne = (stringTwo += stringThree);
  ATS_PrintTestStatus("102. append result", stringOne == F("456789"));
  ATS_PrintTestStatus("103. append", stringTwo == F("456789"));
  ATS_PrintTestStatus("104. append const in", stringThree == F("789"));

  stringOne = "abc";
  stringTwo = "def";
  stringThree = "ghi";
  stringOne = stringTwo = stringThree;
  ATS_PrintTestStatus("105. assign", stringOne == F("ghi"));
  ATS_PrintTestStatus("106. assign", stringTwo == F("ghi"));

             //            111111111122222222223333333333
             //  0123456789012345678901234567890123456789
  stringOne = F("Now is the time for all good men");
  stringOne.toCharArray(charResult, 6);
  ATS_PrintTestStatus("107. toCharArray", strcmp_P(charResult, PSTR("Now i")) == 0);

#if ARDUINO >= 100 || defined(CORE_TEENSY)
// these tests check toCharArray's handling of offsets, which was added
// in Teensyduino and contributed to Arduino 1.0.  Arduino 0022 does
// not have this feature, so do not run these tests on older Arduino
// unless using Teensy.
  stringOne.toCharArray(charResult, 10, 8);
  ATS_PrintTestStatus("108. toCharArray", strcmp_P(charResult, PSTR("he time f")) == 0);

  stringOne.toCharArray(charResult, sizeof(charResult), 25);
  ATS_PrintTestStatus("109. toCharArray", strcmp_P(charResult, PSTR("ood men")) == 0);

  stringOne.getBytes((unsigned char *)charResult, 6);
  ATS_PrintTestStatus("110. getBytes", strcmp_P(charResult, PSTR("Now i")) == 0);

  stringOne.getBytes((unsigned char *)charResult, 10, 8);
  ATS_PrintTestStatus("111. getBytes", strcmp_P(charResult, PSTR("he time f")) == 0);

  stringOne.getBytes((unsigned char *)charResult, sizeof(charResult), 25);
  ATS_PrintTestStatus("112. getBytes", strcmp_P(charResult, PSTR("ood men")) == 0);

  stringOne.toCharArray(charResult, sizeof(charResult), 100);
  ATS_PrintTestStatus("113. toCharArray", strcmp_P(charResult, PSTR("")) == 0);
#endif

  ATS_PrintTestStatus("114. operator [] read", stringOne[0] == 'N');
  ATS_PrintTestStatus("115. operator [] read", stringOne[20] == 'a');
  ATS_PrintTestStatus("116. operator [] read", stringOne[30] == 'e');
  ATS_PrintTestStatus("117. operator [] read", stringOne[32] == 0);
  ATS_PrintTestStatus("118. operator [] read", stringOne[40] == 0);

  stringOne[0] = 'n';  // should write to the string
  stringOne[11] = 'S';
  stringOne[28] = '_';

  ATS_PrintTestStatus("119. operator [] write", stringOne == F("now is the Sime for all good_men"));
  stringOne.toCharArray(charResult, sizeof(charResult));
  ATS_PrintTestStatus("120. operator [] write", strcmp_P(charResult, PSTR("now is the Sime for all good_men")) == 0);

  stringOne[32] = '.';  // should not write over null term

  ATS_PrintTestStatus("121. operator [] write", stringOne == F("now is the Sime for all good_men"));
  stringOne.toCharArray(charResult, sizeof(charResult));
  ATS_PrintTestStatus("122. operator [] write", strcmp_P(charResult, PSTR("now is the Sime for all good_men")) == 0);

  for (i=33; i<10000; i++) {
    stringOne[i] = '.'; // should not buffer overflow (test will crash if it does)
  }

  ATS_PrintTestStatus("123. operator [] write", stringOne == F("now is the Sime for all good_men"));
  stringOne.toCharArray(charResult, sizeof(charResult));
  ATS_PrintTestStatus("124. operator [] write", strcmp_P(charResult, PSTR("now is the Sime for all good_men")) == 0);

  /*
    * Test complete
   */

  ATS_end();
}


//************************************************************************
void loop()
{


}












