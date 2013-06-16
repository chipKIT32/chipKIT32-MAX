
// WARNING: Teensy++ or Arduino Mega REQUIRED !!

// Arduino Duemilanove & Uno DO NOT HAVE ENOUGH RAM.

// These tests are available in 5 parts, for
// compatibility with chips that have only 2K RAM.

// It's NOT the string class which needs so much RAM.
// The many string constants, plus buffers used for the
// test suite consume over 4K of RAM, so this all-in-one
// test can only run on boards with 8k or more RAM.


//************************************************************************
//*	Arduino String Test
//*		(C) 2010 by Rick Anderson
//*		Open source as per standard Arduino code
//*
//************************************************************************
//*	Oct 16,	2010	<ROA> Started on String Test
//************************************************************************

#include	<ArduinoTestSuite.h>

//************************************************************************
void setup()
{
  
  int startMemoryUsage;

  ATS_begin("Arduino", "Test of String Library");

  /*
   * Test Variable Setup
   * Best practive set all your test variables prior to teseting.
   * This is required for Memory tests.
   */

  String stringOne = String("stringThree = ");
  String stringTwo = String("this string");
  String stringThree = String ();
  char charResult[100];



  /*
   * Run the tests
   */

  // adding a constant integer to a string:
  stringThree =  stringOne + 123;
  //strcpy(charResult,  "\0");
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("1.  Adding a constant integer to a string:", strcmp(charResult,"stringThree = 123" ) == 0);

  // adding a constant long interger to a string:
  stringThree = stringOne + 123456789;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("2.  Adding a constant long interger to a string", strcmp(charResult,"stringThree = 123456789" )  == 0);


  // adding a constant character to a string:
  stringThree =  stringOne + 'A';
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("3.  Adding a constant character to a string", strcmp(charResult,"stringThree = A" ) == 0);


  // adding a constant string to a string:
  stringThree =  stringOne +  "abc";
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("4.  Adding a constant string variable to a string", strcmp(charResult,"stringThree = abc" )  == 0);

  //"5. Adding a constant long interger to a string"
  stringThree = stringOne + stringTwo;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("5.  Adding a constant long interger to a string", strcmp(charResult,"stringThree = this string" )  == 0);


  /*
   * setup up String Comparison Operater Tests
   */

  stringOne = String("this");
  stringTwo = String("that");

  // two strings equal:
  ATS_PrintTestStatus("6.  Two strings equal",stringOne == "this");

  // two strings not equal:
  ATS_PrintTestStatus("7.  Two strings not equal",stringOne != stringTwo);

  // two strings not equal (case sensitivity matters):
  stringOne = "This";
  stringTwo = "this";
  ATS_PrintTestStatus("8.  Two strings not equal [case sensitivity matters]", stringOne != stringTwo);

  // you can also use equals() to see if two strings are the same:
  stringOne = "this";
  stringTwo = "this";
  ATS_PrintTestStatus("9.  Equals() method equals", stringOne.equals(stringTwo));


  // you can also use not equals() to see if two strings are not the same:
  stringOne = String("This");
  stringTwo = String("this");
  ATS_PrintTestStatus("10. Not equals() method equals", !stringOne.equals(stringTwo));

  // or perhaps you want to ignore case:
  ATS_PrintTestStatus("11. EqualsIgnoreCase() method equals", stringOne.equalsIgnoreCase(stringTwo));

#if ARDUINO < 100 || defined(CORE_TEENSY)
// David Mellis decided not to keep implicit string to number comparison operators
// in Arduino 1.0.  Only run this test on older version, or if using Teensy
  // a numeric string compared to the number it represents:
  stringOne = "1";
  int numberOne = 1;
  ATS_PrintTestStatus("12. A numeric string compared to the number it represents", stringOne == numberOne);
#endif

  // two numeric strings compared:
  stringOne = "2";
  stringTwo = "1";
  ATS_PrintTestStatus("13. Two numeric strings compared",stringOne >= stringTwo);


  // comparison operators can be used to compare strings for alphabetic sorting too:

  stringOne = String("Brown");
  ATS_PrintTestStatus("14. operator <",stringOne < "Charles");
  ATS_PrintTestStatus("15. operator >",stringOne > "Adams");
  ATS_PrintTestStatus("16. operator <=",stringOne <= "Browne");
  ATS_PrintTestStatus("17. operator >=",stringOne >= "Brow");


  // the compareTo() operator also allows you to compare strings
  stringOne = "Cucumber";
  stringTwo = "Cucuracha";

  ATS_PrintTestStatus("18. compareTo() compare strings", stringOne.compareTo(stringTwo) < 0);

/*
  // compareTo() String with numnber > String with number:
  stringOne = "Sensor: 50";
  stringTwo=  "Sensor: 150";
  ATS_PrintTestStatus("19.  The compareTo() String with integers", stringOne.compareTo(stringTwo) < 0);

  
// compareTo() String with numnber > String with number append integer, matches example code:
   stringOne = "Sensor: ";
   stringTwo=  "Sensor: ";
   stringOne += 50;
   stringTwo += 150;
   ATS_PrintTestStatus("20.  The compareTo()  compare strings with appended integers", stringOne.compareTo(stringTwo) < 0);
 */

  /*
   * setup up String Append Operation Tests
   */
  // Serious awful problem here
  stringOne = String("Sensor ");
  stringTwo = String("value");

  stringOne += stringTwo;
  ATS_PrintTestStatus("21. Adding string to string += ", stringOne.equals("Sensor value"));
  ATS_PrintTestStatus("22. The compareTo()  compare strings with appended integers", stringOne.compareTo(stringTwo) < 0);
  
  
  stringOne = "The quick brown fox";
  ATS_PrintTestStatus("23. Substring ", stringOne.substring(0, 1) == "T");
  ATS_PrintTestStatus("24. Substring ", stringOne.substring(0, 3) == "The");
  ATS_PrintTestStatus("25. Substring ", stringOne.substring(4, 9) == "quick");
  ATS_PrintTestStatus("26. Substring ", stringOne.substring(10, 15) == "brown");
  ATS_PrintTestStatus("27. Substring ", stringOne.substring(16, 19) == "fox");
  ATS_PrintTestStatus("28. Substring ", stringOne.substring(18, 19) == "x");
  ATS_PrintTestStatus("29. Substring ", stringOne.substring(0, 19) == stringOne);
  
  stringOne = "<p>Lorem ipsum dolor sit amet</p><p>Ipsem</p><p>Quod</p><p>";
  int i;
  i = stringOne.lastIndexOf("<p>");
  ATS_PrintTestStatus("30. lastIndexOf ", i == 56);
  i = stringOne.lastIndexOf("<p>", i);
  ATS_PrintTestStatus("31. lastIndexOf ", i == 56);
  i = stringOne.lastIndexOf("<p>", i - 1);
  ATS_PrintTestStatus("32. lastIndexOf ", i == 45);
  i = stringOne.lastIndexOf("<p>", i - 1);
  ATS_PrintTestStatus("33. lastIndexOf ", i == 33);
  i = stringOne.lastIndexOf("<p>", i - 1);
  ATS_PrintTestStatus("34. lastIndexOf ", i == 0);
  i = stringOne.lastIndexOf("ipsum", 8);
  ATS_PrintTestStatus("35. lastIndexOf ", i == -1);
  i = stringOne.lastIndexOf(stringOne);
  ATS_PrintTestStatus("36. lastIndexOf ", i == 0);

#if ARDUINO >= 100
  stringOne = "  test 123 \t ";
  stringOne.trim();
  ATS_PrintTestStatus("37. trim ", stringOne == "test 123");
  stringOne = "test 123";
  stringOne.trim();
  ATS_PrintTestStatus("38. trim ", stringOne == "test 123");
  stringOne = "test 123 \t ";
  stringOne.trim();
  ATS_PrintTestStatus("39. trim ", stringOne == "test 123");
  stringOne = "  test 123";
  stringOne.trim();
  ATS_PrintTestStatus("40. trim ", stringOne == "test 123");
  stringOne = (char *)NULL;
  stringOne.trim();
  ATS_PrintTestStatus("41. empty ", stringOne == "");
  stringOne = "";
  stringOne.trim();
  ATS_PrintTestStatus("42. empty ", stringOne == "");
#else
  stringOne = "  test 123 \t ";
  ATS_PrintTestStatus("37. trim ", stringOne.trim() == "test 123");
  stringOne = "test 123";
  ATS_PrintTestStatus("38. trim ", stringOne.trim() == "test 123");
  stringOne = "test 123 \t ";
  ATS_PrintTestStatus("39. trim ", stringOne.trim() == "test 123");
  stringOne = "  test 123";
  ATS_PrintTestStatus("40. trim ", stringOne.trim() == "test 123");
  stringOne = (char *)NULL;
  ATS_PrintTestStatus("41. empty ", stringOne.trim() == "");
  stringOne = "";
  ATS_PrintTestStatus("42. empty ", stringOne.trim() == "");
#endif
 
#if ARDUINO >= 100
  stringOne = "test one test";
  stringOne.replace("test", "1234");
  ATS_PrintTestStatus("43. replace", stringOne == "1234 one 1234");
  stringOne = "test one test two";
  stringOne.replace("test", "1234");
  ATS_PrintTestStatus("44. replace", stringOne == "1234 one 1234 two");
  stringOne = "zero test one test two";
  stringOne.replace("test", "12345");
  ATS_PrintTestStatus("45. replace", stringOne == "zero 12345 one 12345 two");
  stringOne = "zero test one test";
  stringOne.replace("test", "1234");
  ATS_PrintTestStatus("46. replace", stringOne == "zero 1234 one 1234");
  stringOne = "test one test";
  stringOne.replace("test", "123");
  ATS_PrintTestStatus("47. replace", stringOne == "123 one 123");
  stringOne = "test one test two";
  stringOne.replace("test", "123");
  ATS_PrintTestStatus("48. replace", stringOne == "123 one 123 two");
  stringOne = "zero test one test two";
  stringOne.replace("test", "12");
  ATS_PrintTestStatus("49. replace", stringOne == "zero 12 one 12 two");
  stringOne = "zero test one test";
  stringOne.replace("test", "1");
  ATS_PrintTestStatus("50. replace", stringOne == "zero 1 one 1");
  stringOne = "test one test";
  stringOne.replace("test", "12345");
  ATS_PrintTestStatus("51. replace", stringOne == "12345 one 12345");
  stringOne = "test one test two";
  stringOne.replace("test", "123456");
  ATS_PrintTestStatus("52. replace", stringOne == "123456 one 123456 two");
  stringOne = "zero test one test two";
  stringOne.replace("test", "1234567");
  ATS_PrintTestStatus("53. replace", stringOne == "zero 1234567 one 1234567 two");
  stringOne = "zero test one test";
  stringOne.replace("test", "12345678");
  ATS_PrintTestStatus("54. replace", stringOne == "zero 12345678 one 12345678");
  stringOne = "zero test one test";
  stringOne.replace('e', 'X');
  ATS_PrintTestStatus("55. replace char", stringOne == "zXro tXst onX tXst");
#else 
  stringOne = "test one test";
  ATS_PrintTestStatus("43. replace", stringOne.replace("test", "1234") == "1234 one 1234");
  stringOne = "test one test two";
  ATS_PrintTestStatus("44. replace", stringOne.replace("test", "1234") == "1234 one 1234 two");
  stringOne = "zero test one test two";
  ATS_PrintTestStatus("45. replace", stringOne.replace("test", "12345") == "zero 12345 one 12345 two");
  stringOne = "zero test one test";
  ATS_PrintTestStatus("46. replace", stringOne.replace("test", "1234") == "zero 1234 one 1234");
  stringOne = "test one test";
  ATS_PrintTestStatus("47. replace", stringOne.replace("test", "123") == "123 one 123");
  stringOne = "test one test two";
  ATS_PrintTestStatus("48. replace", stringOne.replace("test", "123") == "123 one 123 two");
  stringOne = "zero test one test two";
  ATS_PrintTestStatus("49. replace", stringOne.replace("test", "12") == "zero 12 one 12 two");
  stringOne = "zero test one test";
  ATS_PrintTestStatus("50. replace", stringOne.replace("test", "1") == "zero 1 one 1");
  stringOne = "test one test";
  ATS_PrintTestStatus("51. replace", stringOne.replace("test", "12345") == "12345 one 12345");
  stringOne = "test one test two";
  ATS_PrintTestStatus("52. replace", stringOne.replace("test", "123456") == "123456 one 123456 two");
  stringOne = "zero test one test two";
  ATS_PrintTestStatus("53. replace", stringOne.replace("test", "1234567") == "zero 1234567 one 1234567 two");
  stringOne = "zero test one test";
  ATS_PrintTestStatus("54. replace", stringOne.replace("test", "12345678") == "zero 12345678 one 12345678");
  stringOne = "zero test one test";
  ATS_PrintTestStatus("55. replace char", stringOne.replace('e', 'X') == "zXro tXst onX tXst");
#endif
  
  stringOne = "Zero";
  stringTwo = "oNe";
  ATS_PrintTestStatus("56. add", stringOne + "124" + stringTwo + 5678 == "Zero124oNe5678");
#if ARDUINO >= 100
  stringOne.toUpperCase();
  ATS_PrintTestStatus("57. toUpperCase", stringOne == "ZERO");
  stringTwo.toLowerCase();
  ATS_PrintTestStatus("58. toLowerCase", stringTwo == "one");
#else
  ATS_PrintTestStatus("57. toUpperCase", stringOne.toUpperCase() == "ZERO");
  ATS_PrintTestStatus("58. toLowerCase", stringTwo.toLowerCase() == "one");
#endif
  stringOne = "-1234567";
  ATS_PrintTestStatus("59. toInt", stringOne.toInt() == -1234567L);
  stringOne = "12345";
  ATS_PrintTestStatus("60. toInt", stringOne.toInt() == 12345);
  

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












