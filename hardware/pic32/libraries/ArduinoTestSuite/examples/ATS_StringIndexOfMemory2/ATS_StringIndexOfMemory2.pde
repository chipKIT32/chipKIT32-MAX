//************************************************************************
//*	Arduino Test Example Skeleton
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
  char testName[64];
  int		startMemoryUsage;
  /*
    * Create variable for the tests. 
   */


  String stringOne;
  int firstClosingBracket;
  int firstOpeningBracket;
  int secondOpeningBracket;
  int secondClosingBracket;
  int bodyTag;
  int firstListItem;
  int secondListItem;
  int lastOpeningBracket;
  int lastListItem;
  int lastParagraph;
  int secondLastGraf;
  
  //Assign String one longest string.
  stringOne = "<p>Lorem ipsum dolor sit amet</p><p>Ipsem</p><p>Quod</p>";

  /*;
   * initiate the test run
   */
  startMemoryUsage	=	ATS_GetFreeMemory();
  ATS_begin("Arduino", "String Memory Test");
  // indexOf() returns the position (i.e. index) of a particular character
  // in a string. For example, if you were parsing HTML tags, you could use it:
  stringOne = "<HTML><HEAD><BODY>";
  firstClosingBracket = stringOne.indexOf('>');

  stringOne = "<HTML><HEAD><BODY>";
  secondOpeningBracket = firstClosingBracket + 1;
  secondClosingBracket = stringOne.indexOf('>', secondOpeningBracket );

  // you can also use indexOf() to search for Strings:
  stringOne = "<HTML><HEAD><BODY>";
  bodyTag = stringOne.indexOf("<BODY>");

  stringOne = "<UL><LI>item<LI>item<LI>item</UL>";
  firstListItem = stringOne.indexOf("<LI>");
  secondListItem = stringOne.indexOf("item", firstListItem + 1 );

  // lastIndexOf() gives you the last occurrence of a character or string:
  lastOpeningBracket = stringOne.lastIndexOf('<');

  lastListItem  = stringOne.lastIndexOf("<LI>");


  // lastIndexOf() can also search for a string:
  stringOne = "<p>Lorem ipsum dolor sit amet</p><p>Ipsem</p><p>Quod</p>";
  lastParagraph = stringOne.lastIndexOf("<p");
  secondLastGraf = stringOne.lastIndexOf("<p", lastParagraph - 1);


  ATS_ReportMemoryUsage(startMemoryUsage);
  


  /*
   * Test complete
   */

  ATS_end();

}


//************************************************************************
void loop()
{


}






