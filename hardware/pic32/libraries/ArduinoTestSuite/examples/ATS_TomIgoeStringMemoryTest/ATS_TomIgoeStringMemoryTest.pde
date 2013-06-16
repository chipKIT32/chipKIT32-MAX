//************************************************************************
//*	Arduino Tom Igoe Memory Test
//*		(C) 2010 by Rick Anderson
//*		Open source as per standard Arduino code
//*
//************************************************************************
//*	Jan 4,	2011	<ROA> Started on Tom Igoe Memory Test
//************************************************************************

#include	<ArduinoTestSuite.h>

//************************************************************************
void setup()
{
  int		startMemoryUsage;
  /*
    * Create variable for the tests. 
   */

  String webColor = "#000000";

  int red = 1023/4;
  int blue = 512/4;
  int green = 128/4;

  /*
  * initiate the test run
   */
  //Record starting memory amount
  startMemoryUsage	=	ATS_GetFreeMemory();
  //Begin test run
  ATS_begin("Arduino", "Tom Igoe Memory Test");

  webColor = "#";
  webColor += String(red, HEX);
  webColor += String(green, HEX);
  webColor += String(blue, HEX);

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


