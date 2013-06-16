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

  String stringOne;
  String stringTwo;

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

  /*
    * Test complete
   */

  ATS_end();
}


//************************************************************************
void loop()
{


}












