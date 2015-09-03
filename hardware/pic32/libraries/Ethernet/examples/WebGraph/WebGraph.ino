/*
 * Copyright (c) 2015, Majenko Technologies
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * * Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * 
 * * Neither the name of Majenko Technologies nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*  This small demo illustrates how you can build up graphics using
 *  SVG which is basically an XML file.  The analog inputs 0-5 are
 *  periodically read and stored in an array of historical readings.
 *  A web request to the root page ("/") then includes images pointing
 *  to 6 SVG urls (/graph*.svg) which then produce live graphical
 *  representations of the stored historical data.
 *  
 *  The page should refresh automatically every 5 seconds.
 */

// Ethernet requires SPI to be included as well.
#include <SPI.h>
#include <Ethernet.h>

// This is the MAC address you want to give the Ethernet shield.
// It should be unique within your network.
byte mac[] = {
	0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};

// Give the shield an IP address.  It should be unique within the subnet.
IPAddress ip(192, 168, 1, 177);

// We want a web server to run on port 80.
EthernetServer server(80);

// This is where we will store our ADC data.
int data[6][200];

void setup() {
    // Start the Ethernet subsystem up
	Ethernet.begin(mac, ip);
    // And kick off the server listening for requests.
	server.begin();
}

// This is a small class that will read the header of a web request
// and store the important information (target host name and page requested).

class WebRequest {
private:
	char *_host;
	char *_page;
	Client *_client;
	char _buffer[100];
	uint8_t _bufptr;
public:
	WebRequest(Client &c) : _host(NULL), _page(NULL), _client(&c), _bufptr(0) {}
	~WebRequest() {
		if (_host != NULL) { free(_host); }

		if (_page != NULL) { free(_page); }
	}
	bool process() {
		bool _finished = false;

		if (_client->available()) {
			int c = _client->read();

			switch (c) {
				case '\r':
					break;

				case '\n':
					if (strncasecmp("Host: ", _buffer, 6) == 0) {
						_host = strdup(_buffer + 6);
					} else if (strncasecmp("GET ", _buffer, 4) == 0) {
						char *end = strstr(_buffer + 4, " HTTP/");

						if (end != NULL) { *end = 0; }

						_page = strdup(_buffer + 4);
					} else if (strlen(_buffer) == 0) {
						_finished = true;
					}

					_bufptr = 0;
					_buffer[0] = 0;
					break;

				default:
					if (_bufptr < 99) {
						_buffer[_bufptr++] = c;
						_buffer[_bufptr] = 0;
					}

					break;
			}
		}

		return _finished;
	}
	char *getPage() {
		return _page;
	}
	char *getHost() {
		return _host;
	}
};

// This is the heart of the graphics portion.  Generate the XML to
// represent the graph data as SVG.
void sendGraph(Client &client, int graphno) {
    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: image/svg+xml");
    client.println("Connection: close");
    client.println();
    client.println("<svg xmlns=\"http:/" "/www.w3.org/2000/svg\" version=\"1.1\" width=\"200\" height=\"128\">");
    client.println("<g stroke=\"black\">");
    for (int i = 1; i < 200; i++) {
        client.print("<line x1=\"");
        client.print(i - 1);
        client.print("\" y1=\"");
        client.print(127 - (data[graphno][i-1] >> 3));
        client.print("\" x2=\"");
        client.print(i);
        client.print("\" y2=\"");
        client.print(127 - (data[graphno][i] >> 3));
        client.println("\" stroke-width=\"1\" />");        
    }
    client.println("</g>");
    client.println("</svg>");
}

// If you request a page that doesn't exist you should send back a 403
void sendNotFound(Client &client) {
    client.println("HTTP/1.1 403 NOT FOUND");
    client.println("Content-Type: text/html");
    client.println("Connection: close");
    client.println();
    client.println("<html><head><title>Not Found</title></head><body><h1>Not Found</h1></body></html>");
}

// Process the main index page - include the 6 graph images.
void sendIndex(Client &client) {
	client.println("HTTP/1.1 200 OK");
	client.println("Content-Type: text/html");
	client.println("Connection: close");
    client.println("Refresh: 5");
	client.println();
	client.println("<!DOCTYPE HTML>");
	client.println("<html>");
	client.println("<head><title>Sensor Readings</title></head>");
	client.println("<body><center><table border=1><tr>");

	for (int i = 0; i < 6; i++) {
		client.print("<th>");
		client.print(i);
		client.print("</th>");
	}

	client.println("</tr>");
	client.print("<tr>");

	for (int analogChannel = 0; analogChannel < 6; analogChannel++) {
		client.print("<td><img src='/graph");
		client.print(analogChannel);
		client.print(".svg'/></td>");
	}

	client.println("</tr>");
	client.println("</table>");
	client.println("</center></body></html>");
}

// Our main loop.  Read the ADC every 100ms and process any incoming requests.
void loop() {

    // A 100ms ticker.  Every 100ms shift the 6 array blocks down one
    // entry and read in a new value at the top of the array.
    static uint32_t tick = 0;
    if (millis() - tick >= 100) {
        tick = millis();
        for (int chan = 0; chan < 6; chan++) {
            for (int i = 0; i < 199; i++) {
                data[chan][i] = data[chan][i+1];
                data[chan][199] = analogRead(chan);
            }
        }
    }


    // Check to see if there are any pending connections
	EthernetClient client = server.available();

	if (client) {

        // Process the incoming request
		WebRequest req(client);
		while (client.connected() && !req.process());

        // Now look to see which page was requested and call the
        // right function accordingly.
		if (!strcmp(req.getPage(), "/")) {
            sendIndex(client);
		} else if (!strcmp(req.getPage(), "/index.html")) {
            sendIndex(client);
		} else if (!strcmp(req.getPage(), "/graph0.svg")) {
            sendGraph(client, 0);
        } else if (!strcmp(req.getPage(), "/graph1.svg")) {
            sendGraph(client, 1);
        } else if (!strcmp(req.getPage(), "/graph2.svg")) {
            sendGraph(client, 2);
        } else if (!strcmp(req.getPage(), "/graph3.svg")) {
            sendGraph(client, 3);
        } else if (!strcmp(req.getPage(), "/graph4.svg")) {
            sendGraph(client, 4);
        } else if (!strcmp(req.getPage(), "/graph5.svg")) {
            sendGraph(client, 5);
		} else {
            sendNotFound(client);
		}

        // We're done with this connection, so close it down.
		client.stop();
	}
}
