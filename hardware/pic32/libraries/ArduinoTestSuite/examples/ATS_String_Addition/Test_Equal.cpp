#include "Test_Equal.h"
#include <ArduinoTestSuite.h>

// This needs to be in a .cpp file to avoid Arduino's preprocessor
// extracting both function declarations, which creates an
// ambigious overload error.

#if ARDUINO >= 100 || defined(CORE_TEENSY)
void Test_Equal(char *testString, char *expected, const String &actual)
#else
// the old string code does not define toCharArray() as const
// this simple but ugly workaround is for Arduino 0022 and
// should someday be removed.  For more info, see
// http://code.google.com/p/arduino/issues/detail?id=552
void Test_Equal(char *testString, char *expected, String actual)
#endif
{
  char buf[100]; actual.toCharArray(buf, 100);
  boolean b = (strcmp(buf, expected) == 0);
  ATS_PrintTestStatus(testString, b);
  if (!b) {
    Serial.print("expected '");
    Serial.print(expected);
    Serial.print("', actual '");
    Serial.print(actual);
    Serial.println("'");
  }
}

