#include	<ArduinoTestSuite.h>


const char html_data[] PROGMEM = {
	"<html><head>\r\n"
	"<title>test</title>\r\n"
	"</head>\r\n"
	"<body><h1>Title</h1>\r\n"
	"This isn't a very interesting page, is it?\r\n"
	"</body></html>\r\n"
};


unsigned int crcFile(void) {
  unsigned int crc=0;
  String result = "";
  //result.reserve(100);   // better coding practice...
  myFile_open("index.htm");
    while (myFile_available()) {
      byte thisChar = (char) myFile_read();
      if (result.endsWith("<body>")) {
        //Serial.println("replacing");
        String bodyTag = "<body bgcolor=#";
        int red = 0xFF;
        bodyTag += String(red, HEX);
        int green = 0xAB;
        bodyTag += String(green, HEX);
        int blue = 0xCD;

        bodyTag += String(blue, HEX);
	#if ARDUINO >= 100
        result.replace("<body", bodyTag);
	#else
        result = result.replace("<body", bodyTag);
	#endif
      }
      switch (thisChar) {
      case '\r':
        break;
      case '\n':
        // return the line
        //Serial.println(result);
        for (int i=0; i<result.length(); i++) {
          crc = crc16(crc, result[i]);
        }
        //Serial.println(crc);
        result = "";
        break;
      default:
        result += thisChar;
      }
    }
  return crc;
}



void setup()
{
  int startMemoryUsage;
  startMemoryUsage = ATS_GetFreeMemory();
  ATS_begin("Arduino", "Strings from Tom's DaylightWebServer");
  ATS_PrintTestStatus("1. DaylightWebServer HTML parse/replace", crcFile() == 39170);
  ATS_ReportMemoryUsage(startMemoryUsage);
  ATS_end();
}


//************************************************************************
void loop()
{
}




unsigned int html_offset;
unsigned char myFile_open(const char *name) {
	html_offset = 0;
}
char myFile_read(void) {
	return pgm_read_byte(html_data + html_offset++);
}
unsigned char myFile_available(void) {
	return pgm_read_byte(html_data + html_offset);
}

unsigned int crc16(unsigned int crc, byte b) {
  crc ^= b;
  for (byte i=0; i<8; i++) {
    if (crc & 1) {
      crc >>= 1;
      crc ^= 0xA001;
    } else {
      crc >>= 1;
    }
  }
  return crc;
}







