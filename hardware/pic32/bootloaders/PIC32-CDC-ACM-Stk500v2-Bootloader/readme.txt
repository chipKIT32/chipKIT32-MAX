This project builds a simple Stk500v2 bootloader that is compatible with
avrdude and MPIDE (used on the chipKIT boards) for any PIC32 MX4, 5, 6, or 7
MCU.  The bootloader lives wholly in bootflash, leaving all primary flash
(0x9d000000 and higher) for use by applications.

When running the bootloader, the MCU exposes a CDC/ACM serial port function
out the USB, and you can configure avrdude or MPIDE to talk to it.  You
install the bootloader on your MCU using a Pickit3 or equivalent.

You need to install the Stk500v2.inf file to talk to the CDC/ACM port on
Windows (using the Microsoft driver usbser.sys -- the inf file just binds
a human-readable name "Stk500v2" to the VID/PID used by the CDC/ACM port).
Just right-click on Stk500v2.inf and select Install.

You can then use MPIDE to talk to the CDC/ACM port -- reset the board before
uploading your sketch (you have 10 seconds to get to the upload or else the
bootloader will transfer control to the previous sketch on the MCU).

If your board has a PRG switch (like CUI32 and UBW32), there is no 10 second
timeout.  Instead, the procedure is:

0. assume MCU is powered and connected to the USB
1. press the PRG button and reset the MCU (MCU will enter bootloader mode and
   enumerate CDC/ACM device and OS will create device file)
2. start MPIDE
3. Upload
4. when your code works, go to step 7
5. press the PRG button and reset the MCU (MCU will enter bootloader mode again)
6. go to step 3.
7. done!

To build bits in MPLAB X that can be loaded to the bootloader, you must use a
bootloader-compatible .ld file :chipKIT-MAX32-application-32MX795F512L.ld or
chipKIT-UNO32-application-32MX320F128L.ld.

You can see an example of how to do this in the StickOS skeleton project:
http://www.cpustick.com/downloads.htm

-- Rich Testardi (rich@testardi.com)

// These files originated from the cpustick.com skeleton project from
// http://www.cpustick.com/downloads.htm and were originally written
// by Rich Testardi; please preserve this reference and share bug
// fixes with rich@testardi.com.
