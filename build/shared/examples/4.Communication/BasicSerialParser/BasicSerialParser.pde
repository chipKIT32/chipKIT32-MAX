/*
 Basic Serial Parser
 Language: Wiring/chipKIT(TM)
 
 This program parses ASCII strings from the Serial port that are terminated with
 carriage return (byte of value 13).
 
   The circuit:
   No external circuit required

 Created July 18, 2014
 by Michael Skoczen

 This example code is in the public domain.
 */
char buff[0x20];//buffer to hold input
char ctr; //keeps track of position in buffer
char ch; //holds last character received
void setup() {               
  Serial.begin(115200);
}
void loop() {
  if (Serial.available() > 0)
  {
    ch = Serial.read();
    if( ctr < sizeof(buff)) { //don't over run the buffer
      buff[ctr++] = ch;
    }
    if (ch == '\r') // when I get a carriage return
    {
      buff[ctr-1] = 0; //replace the carriage return in the buffer with 0 which
                       //terminates strings
      ctr = 0; //reset the buffer pointer
      //send "command" followed by a carriage return
      if (strcmp(buff, "command") == 0) //compare two strings
      {
        Serial.println("You rang?");
      }
      //send "onenumber x" followed by a carriage return where x is a number with one or more digits
      else if (strncmp(buff, "onenumber ",10) == 0) //compare first 10 characters of two strings
      {
        char* point = buff + findSpaceOffset(buff);; //pointer start of first number
        unsigned int num = parseNumber(point); //convert string to int
        Serial.println(num,DEC);
      }
      //send "twonumnumbers x y" followed by a carriage return where x and y are numbers with one or more digits
      else if (strncmp(buff, "twonumbers ",11) == 0) //compare first 11 characters of two strings
      {
        char* point = buff + findSpaceOffset(buff);; //pointer start of first number
        unsigned int numone = parseNumber(point); //convert string to int
        point += findSpaceOffset(point); //find start of second number from current position add it to pointer
        unsigned int numtwo = parseNumber(point); //convert string to int
        Serial.print(numone,DEC);
        Serial.print(", ");
        Serial.println(numtwo,DEC);
      }
    } // end of if I get a carriage return
  } //end of serial available
}
//function that converts a null (0) or space terminated string of numbers to an unsigned int
unsigned int parseNumber(char* s)
{
  unsigned char i = 0;
  unsigned int out = 0;
  while(s[i] != 0 && s[i] != ' ')
    out = out * 10 + (s[i++]-'0');
  return out;
}
//function that finds next null or space from current position
//returns number of places to get there +1
unsigned char findSpaceOffset(char* s)
{
  unsigned char i = 0;
  while(s[i] != 0 && s[i] != ' ')
    i++;
  return i+1;
}
