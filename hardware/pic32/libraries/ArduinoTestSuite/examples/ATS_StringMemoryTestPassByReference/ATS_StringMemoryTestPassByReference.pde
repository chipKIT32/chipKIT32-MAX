//************************************************************************
//*	Arduino String Memory test 
//*      Created, 3 strings, check memory status.
//*
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
  int		startMemoryUsage;
  /*
   * Create variable for the tests. 
   */
  String stringOne;
  
  //Assign stringOne to be equal to the longest string
  stringOne = "<p>Lorem ipsum dolor sit amet</p><p>Ipsem</p><p>Quod</p>";

  /*
   * initiate the test run
   */  


  startMemoryUsage	=	ATS_GetFreeMemory();
  ATS_begin("Arduino", "ATS_StringMemoryTestPassByReference");

  assignStringValues(&stringOne);

  ATS_ReportMemoryUsage(startMemoryUsage);
  
  /*
   * Test complete
   */
   
  ATS_end();
}

void assignStringValues(String *argString ) {
  *argString = "<HTML><HEAD><BODY>";
  *argString = "<UL><LI>item<LI>item<LI>item</UL>";
  *argString = "<p>Lorem ipsum dolor sit amet</p><p>Ipsem</p><p>Quod</p>";
}

//************************************************************************
void loop()
{

  
}






