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
  char charResult[60];


  /*
   * Run the tests
   */

  // adding a constant integer to a string:
  stringThree =  stringOne + 123;
  //strcpy(charResult,  "\0");
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("1. Add integer to string:", strcmp(charResult,"stringThree = 123" ) == 0);

  // adding a constant long interger to a string:
  stringThree = stringOne + 123456789;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("2. Add long to string", strcmp(charResult,"stringThree = 123456789" )  == 0);


  // adding a constant character to a string:
  stringThree =  stringOne + 'A';
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("3. Add char", strcmp(charResult,"stringThree = A" ) == 0);


  // adding a constant string to a string:
  stringThree =  stringOne +  "abc";
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("4. Add string to string", strcmp(charResult,"stringThree = abc" )  == 0);

  //"5. Adding a constant long interger to a string"
  stringThree = stringOne + stringTwo;
  stringThree.toCharArray(charResult, sizeof(charResult));

  ATS_PrintTestStatus("5. Add long", strcmp(charResult,"stringThree = this string" )  == 0);


  /*
   * setup up String Comparison Operater Tests
   */

  stringOne = String("this");
  stringTwo = String("that");

  // two strings equal:
  ATS_PrintTestStatus("6. equal",stringOne == "this");

  // two strings not equal:
  ATS_PrintTestStatus("7. not equal",stringOne != stringTwo);

  // two strings not equal (case sensitivity matters):
  stringOne = "This";
  stringTwo = "this";
  ATS_PrintTestStatus("8. not equal (case matters)", stringOne != stringTwo);

  // you can also use equals() to see if two strings are the same:
  stringOne = "this";
  stringTwo = "this";
  ATS_PrintTestStatus("9. Equals()", stringOne.equals(stringTwo));


  // you can also use not equals() to see if two strings are not the same:
  stringOne = String("This");
  stringTwo = String("this");
  ATS_PrintTestStatus("10. Not equals() method equals", !stringOne.equals(stringTwo));

  // or perhaps you want to ignore case:
  ATS_PrintTestStatus("11. EqualsIgnoreCase()", stringOne.equalsIgnoreCase(stringTwo));

#if ARDUINO < 100 || defined(CORE_TEENSY)
// David Mellis decided not to keep implicit string to number comparison operators
// in Arduino 1.0.  Only run this test on older version, or if using Teensy
  // a numeric string compared to the number it represents:
  stringOne = "1";
  int numberOne = 1;
  ATS_PrintTestStatus("12. A numeric string compared to number", stringOne == numberOne);
#endif

  // two numeric strings compared:
  stringOne = "2";
  stringTwo = "1";
  ATS_PrintTestStatus("13. Two numeric strings compared",stringOne >= stringTwo);


  // comparison operators can be used to compare strings for alphabetic sorting too:

   stringOne = String("Brown");
   ATS_PrintTestStatus("14. comparison <",stringOne < "Charles");
   ATS_PrintTestStatus("15. comparison >",stringOne > "Adams");
   ATS_PrintTestStatus("16. comparison <=",stringOne <= "Browne");
   ATS_PrintTestStatus("17. comparison >= ",stringOne >= "Brow");


  // the compareTo() operator also allows you to compare strings
  stringOne = "Cucumber";
  stringTwo = "Cucuracha";

  ATS_PrintTestStatus("18. compareTo()", stringOne.compareTo(stringTwo) < 0);

/*
  // These two tests are based on a misunderstanding of compareTo()
  // The compareTo documentation needs to be clearer about how number are compared

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

  stringOne = String("Sensor ");
  stringTwo = String("value");

  stringOne += stringTwo;
  ATS_PrintTestStatus("21. Adding string to string += ", stringOne.equals("Sensor value"));
  ATS_PrintTestStatus("22. The compareTo() appended int", stringOne.compareTo(stringTwo) < 0);
  
  /*
    * Test complete
   */

  ATS_end();
}


//************************************************************************
void loop()
{


}












