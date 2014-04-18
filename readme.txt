The chipKIT project is based on Arduino which is an open-source physical computing platform based on a simple i/o
board and a development environment that implements the Processing/Wiring
language. The chipKIT project initiated with the pic32 chips from Microchip, and we have support for the MX line. Now we will 
adding support for the new MZ line.  Arduino can be used to develop stand-alone interactive objects or
can be connected to software on your computer (e.g. Flash, Processing, MaxMSP).
The boards can be assembled by hand or purchased preassembled; the open-source
IDE can be downloaded for free.

For more information, see the website at: http://www.arduino.cc/
or the forums at: http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl

This project is the MPIDE, Multi Platform IDE that supports AVR, and pic32 MCUs.

To report a bug or a make a suggestions, go to:
[hardware] https://github.com/chipKIT32/chipKIT32-MAX/issues
[software] https://github.com/chipKIT32/chipKIT32-MAX/issues

INSTALLATION
Detailed instructions are in reference/Guide_Windows.html and
reference/Guide_MacOSX.html.  For Linux, see the Chipkit Wiki:
http://chipkit.org/wiki

If you are using a USB Arduino, you will need to install the drivers for the
FTDI chip on the board. These can be found in the drivers/ directory.

* On Windows, plug in the Arduino board and point the Windows Add Hardware
  wizard to the drivers/FTDI USB Drivers sub-directory of the Arduino
  application directory.

* On the Mac, install the FTDIUSBSerialDriver_10_4_10_5_10_6.mpkg package.
  
* On Linux, drivers are included in kernel versions 2.4.20 or greater.

CREDITS
Arduino is an open source project, and so is MPIDE supported by many.

The Arduino team is composed of Massimo Banzi, David Cuartielles, Tom Igoe,
Gianluca Martino, and David A. Mellis.

Arduino uses the GNU avr-gcc toolchain, avrdude, avr-libc, and code from
Processing and Wiring.

MPIDE is a multiplatform enhancement that allows multiple toolchains, and different kinds of MCUs to work with the Arduino API.

Icon designed by ToDo: http://www.todo.to.it/
"About" image created by Thomas Glaser (envis precisely).
MPIDE Icon designed by Rick Anderson and the ChipKit forum members. http://chipkit.org
