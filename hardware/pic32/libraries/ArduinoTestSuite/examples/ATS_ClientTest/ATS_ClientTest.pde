/*
* ATS Client test
 *
 *
 */
#include <ArduinoTestSuite.h>
#include <SPI.h>
#include <Ethernet.h>

byte mac[] =  {
  0xCE,0x63,0xEB,0xBC,0x7A,0x1C };
//  0xE1,0x3E,0x5A,0x49,0xEB,0xA9};

EthernetClient client;

void setup()
{
  int startMemoryUsage;
  Ethernet.begin(mac);
  startMemoryUsage = ATS_GetFreeMemory();
  ATS_begin("Arduino 1.0", "ATS_httpClient Tests");

  ATS_PrintTestStatus("1. DCHCP Address obtained", testDHCP());

  ATS_ReportMemoryUsage(startMemoryUsage);
  ATS_end();

}

//Test if IP DHCP address receieved
boolean testDHCP()
{
  Serial.println("testDHCP");
  
  int temp = 0;
  IPAddress ip = Ethernet.localIP();
  int length = Serial.println(ip);
  Serial.println(length);
  
  for (int nn = 0; nn < 4; nn++) 
  {
    temp = temp + ip[nn];
  }
  if (temp == 0)
  {
    return false;
  }
  return true;
}


void loop()
{


}


