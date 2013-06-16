/*
* ATS Client test
 *
 *
 */
#include <ArduinoTestSuite.h>
#include <SPI.h>
#include <HttpClient.h>
#include <b64.h>
#include <Ethernet.h>
#include <EthernetClient.h>

const char* kHostname = "172.31.99.54";
const uint16_t kPort = 8080;
const char kPath[] = "/";

byte mac[] =  {
  0xCE,0x63,0xEB,0xBC,0x7A,0x1C };
//  0xE1,0x3E,0x5A,0x49,0xEB,0xA9};

// Number of milliseconds to wait without receiving any data before we give up
const int kNetworkTimeout = 30*1000;
// Number of milliseconds to wait if no data is available before trying again
const int kNetworkDelay = 1000;


EthernetClient client;

void setup()
{
  int startMemoryUsage;
  Ethernet.begin(mac);
  startMemoryUsage = ATS_GetFreeMemory();
  ATS_begin("Arduino 1.0", "ATS_HttpClient Tests");

  ATS_PrintTestStatus("1. DHCP Address obtained", testDHCP());
  ATS_PrintTestStatus("2. HTTPClient single run", testHTTPClient(client));

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

boolean  testHTTPClient(EthernetClient cc)
{

  int err =0;
  HttpClient http(cc);

  err = http.get(kHostname, kPort, kPath);
  if (err == 0)
  {
    Serial.println("startedRequest ok");

    err = http.responseStatusCode();
    if (err >= 0)
    {
      Serial.print("Got status code: ");
      Serial.println(err);

      // Usually you'd check that the response code is 200 or a
      // similar "success" code (200-299) before carrying on,
      // but we'll print out whatever response we get

      err = http.skipResponseHeaders();
      if (err >= 0)
      {
        int bodyLen = http.contentLength();
        Serial.print("Content length is: ");
        Serial.println(bodyLen);
        Serial.println();
        Serial.println("Body returned follows:");

        // Now we've got to the body, so we can print it out
        unsigned long timeoutStart = millis();
        char c;
        // Whilst we haven't timed out & haven't reached the end of the body
        while ( (http.connected() || http.available()) &&
          ((millis() - timeoutStart) < kNetworkTimeout) )
        {
          if (http.available())
          {
            c = http.read();
            // Print out this character
            Serial.print(c);

            bodyLen--;
            // We read something, reset the timeout counter
            timeoutStart = millis();
          }
          else
          {
            // We haven't got any data, so let's pause to allow some to
            // arrive
            delay(kNetworkDelay);
          }
        }
      }
      else
      {
        Serial.print("Failed to skip response headers: ");
        Serial.println(err);
      }
    }
    else
    {    
      Serial.print("Getting response failed: ");
      Serial.println(err);
    }
  }
  else
  {
    Serial.print("Connect failed: ");
    Serial.println(err);
  }
  http.stop();

  return false;
}


void loop()
{


}



