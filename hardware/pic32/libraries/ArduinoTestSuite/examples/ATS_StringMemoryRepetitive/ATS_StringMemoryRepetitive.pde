#include <ArduinoTestSuite.h>

void setup() {
}

void run() {
  String webColor = "#";
  int red = 0xff;
  webColor += String(red, HEX);
  int green = 0x24;
  webColor += String(green, HEX);
  int blue = 0xc9;
  webColor += String(blue, HEX);
  char buf[16];
  webColor.toCharArray(buf, sizeof(buf));
  ATS_PrintTestStatus("webColor result", strcmp(buf, "#ff24c9") == 0);
}

void loop() {
  int startMemoryUsage = ATS_GetFreeMemory();
  ATS_begin("Arduino", "Tom's webColor, infinite repeat");
  run();
  ATS_ReportMemoryUsage(startMemoryUsage);
  ATS_end();
}
