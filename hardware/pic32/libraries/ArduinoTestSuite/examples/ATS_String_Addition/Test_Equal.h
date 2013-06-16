#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#if ARDUINO >= 100 || defined(CORE_TEENSY)
void Test_Equal(char *testString, char *expected, const String &actual);
#else
// the old string code does not define toCharArray() as const
// this simple but ugly workaround is for Arduino 0022 and
// should someday be removed.  For more info, see
// http://code.google.com/p/arduino/issues/detail?id=552
void Test_Equal(char *testString, char *expected, String actual);
#endif

