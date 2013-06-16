Arduino Test Suite

Can be used with C or C++ libraries.

Documentation online here:
http://code.google.com/p/arduino/wiki/ArduinoTestSuite

Arduino Test Suite Library
This initial library was contributed by a collaboration between Mark Sproul, and Rick Anderson. The idea was to get a simple test suite going so that anyone can make tests and test cases for the Arduino software. Just as it should be easy to get going with programming an Arduino, we want it to be the same for testing the Arduino. Since this is the initial draft of documentation and code, we expect feedback, and are ready to address any issues, and add improvements. We monitor the Arduino developer mailing list regularly. Please send feed back there. And now onto the documentation:

Arduino Test Suite Library
This library allows you to create standard test suite for the Arduino software. The goal is to provide a simple and standard way to build tests and tests cases any way you need to as long as you use a few simple principles, and the results return the standard ArduinoTestResultFormat. That can then be parsed by a continuous integration and test system. Which this library provides built in support for. Your tests can then be associated with various issues, and features. These tests can be added to the official list of tests that are run automatically every time code is changed in the official repository. An additional benefit is that these are standard Arduino sketches that you can on your own Arduinos. You can test your work as you develop, or better yet create your tests first and as you could you should see the tests pass.

Functions
```C
ATS_begin()
ATS_end()
ATS_PrintTestStatus()
```

