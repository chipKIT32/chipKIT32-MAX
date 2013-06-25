/* -*- mode: jde; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
  AvrdudeUploader - uploader implementation using avrdude
  Part of the Arduino project - http://www.arduino.cc/

  Copyright (c) 2004-05
  Hernando Barragan

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  
  $Id$
*/

package processing.app.debug;

import processing.app.Base;
import processing.app.Preferences;
import processing.app.Serial;
import processing.app.SerialException;

import java.io.*;
import java.util.*;
import java.util.zip.*;
import javax.swing.*;
import gnu.io.*;

import java.util.regex.*;

import org.apache.log4j.Logger;


public class AvrdudeUploader extends Uploader  {
  static Logger logger = Logger.getLogger(Base.class.getName());

  public AvrdudeUploader() {
  }

  // XXX: add support for uploading sketches using a programmer
  public boolean uploadUsingPreferences(String buildPath, String className, boolean verbose)
  throws RunnerException, SerialException {
    this.verbose = verbose;
    Map<String, String> boardPreferences = Base.getBoardPreferences();
    String uploadUsing = boardPreferences.get("upload.using");
    if (uploadUsing == null) {
      // fall back on global preference
      uploadUsing = Preferences.get("upload.using");
    }
    logger.debug("*** UPLOAD USING: " + uploadUsing);
    if (uploadUsing.equals("bootloader")) {
      return uploadViaBootloader(buildPath, className);
    } else {
      Target t;

      if (uploadUsing.indexOf(':') == -1) {
        t = Base.getTarget(); // the current target (associated with the board)
      } else {
        String targetName = uploadUsing.substring(0, uploadUsing.indexOf(':'));
        t = Base.targetsTable.get(targetName);
        uploadUsing = uploadUsing.substring(uploadUsing.indexOf(':') + 1);
      }

      //* Look to see if there is an entry in bootloaders.txt that
      //* corresponds to the upload.using entry in the boards.txt
      //* If there is, then use the command from that entry with suitable
      //* token substitution:
      //*   %H = Filename of hex file (including path)
      //*   %P = Port name as selected in menu
      //*   %B = Baud rate
      //*   %V = Verbose flag if verbose turned on
      //*   %O = Protocol from boards.txt
      //*   %T = Location of tools directory
      //*   %M = CPU Specification
      //*   %A = vAriant directory

      Map<String, Map<String, String>> bootLoaders = t.getBootloaders();
      Map<String, String> bootloader = bootLoaders.get(uploadUsing);

      if (bootloader != null) {
        List parts = new ArrayList();

        String command = null;


        // Let's find the right command to use - starting from the most specific
        // (os and arch), then just the os, and finally the generic command.

        command = bootloader.get("command_" + Base.osName());
        if (command == null) {
            command = bootloader.get("command_" + Base.getPlatformName());
        }
        if (command == null) {
            command = bootloader.get("command");
        }
        if (command == null) {
            logger.debug("ERROR: No command found for bootloader!");
            return false;
        }

        logger.debug("================ UPLOAD =================");
        logger.debug("Bootloader selected: " + uploadUsing);
        logger.debug("Command: " + command);
        logger.debug("");


        ArrayList <String> spl = new ArrayList();
        Matcher m = Pattern.compile("([^\"]\\S*|\".+?\")\\s*").matcher(command);
        while (m.find())
            spl.add(m.group(1));

        String executable = spl.get(0);
        executable = executable.replace("\"", "");
        if (Base.isWindows()) {
            if (executable.indexOf(".exe") == -1) {
                executable = executable + ".exe";
            }
        }

        String variant = boardPreferences.get("build.variant");

        String variantPath = t.getVariantFolder(variant).getAbsolutePath() + "/tools/";
        String basePath = new String(Base.getHardwarePath() + "/tools/");
  
        String foundPath = null;
        File testFile = null;
  
        testFile = new File(variantPath, executable);
        logger.debug("Searching for " + variantPath + "/" + executable + "...");
        if (testFile.exists()) {
          logger.debug("... found");
          foundPath = variantPath;
        } else {
          logger.debug("Searching for " + basePath + "/" + executable + "...");
          testFile = new File(basePath, executable);
          if (testFile.exists()) {
            logger.debug("... found");
            foundPath = basePath;
          }
        }

        if (foundPath == null) {
            System.out.println("Command not found: " + executable);
            return false;
        }

        command = command.replace("%A", t.getVariantFolder(variant).getAbsolutePath());
        command = command.replace("%H",  
          buildPath + File.separator + className + ".hex");
        command = command.replace("%V", 
            (verbose ? bootloader.get("verbose") : 
                bootloader.get("quiet") != null ? bootloader.get("quiet") : ""));
        command = command.replace("%P", 
          (Base.isWindows() ? "\\\\.\\" : "") + 
          Preferences.get("serial.port")
        );
        command = command.replace("%B", 
            boardPreferences.get("upload.speed") != null ?
            boardPreferences.get("upload.speed"): ""
        );
        command = command.replace("%O", 
            boardPreferences.get("upload.protocol") != null ? 
            boardPreferences.get("upload.protocol") : ""
        );
        command = command.replace("%T", foundPath);
        command = command.replace("%M", 
            boardPreferences.get("build.mcu") != null ? 
            boardPreferences.get("build.mcu") : ""
        );
        command = command.trim();

        spl.clear();
        // Split the command into words
        m = Pattern.compile("([^\"]\\S*|\".+?\")\\s*").matcher(command);
        while (m.find())
            spl.add(m.group(1));

        // Parse each word, doing string replacement as needed, trimming it, and
        // generally getting it ready for executing.

        for (int i = 0; i < spl.size(); i++) {
          String tmp = spl.get(i);
          tmp = tmp.replace("\"", "");
          tmp = tmp.trim();
          spl.set(i, tmp);
          if (spl.get(i).length() > 0) {
            parts.add(spl.get(i));
          }
        }

        return executeToolsCommand(parts, foundPath);
      } else {
        Collection params = getProgrammerCommands(t, uploadUsing);
        params.add("-Uflash:w:" + buildPath + File.separator + className + ".hex:i");
        return avrdude(params);
      }
    }
  }
  
  private boolean uploadViaBootloader(String buildPath, String className)
  throws RunnerException, SerialException {
    Map<String, String> boardPreferences = Base.getBoardPreferences();
    List commandDownloader = new ArrayList();
    String protocol = boardPreferences.get("upload.protocol");
    
    // avrdude wants "stk500v1" to distinguish it from stk500v2
    if (protocol.equals("stk500"))
      protocol = "stk500v1";
    commandDownloader.add("-c" + protocol);
    commandDownloader.add(
      "-P" + (Base.isWindows() ? "\\\\.\\" : "") + Preferences.get("serial.port"));
    commandDownloader.add(
      "-b" + Integer.parseInt(boardPreferences.get("upload.speed")));
    commandDownloader.add("-D"); // don't erase
    commandDownloader.add("-Uflash:w:" + buildPath + File.separator + className + ".hex:i");

    if (boardPreferences.get("upload.disable_flushing") == null ||
        boardPreferences.get("upload.disable_flushing").toLowerCase().equals("false")) {
      flushSerialBuffer();
    }

    return avrdude(commandDownloader);
  }
  
  public boolean burnBootloader(String targetName, String programmer) throws RunnerException {
    return burnBootloader(getProgrammerCommands(Base.targetsTable.get(targetName), programmer));
  }
  
  private Collection getProgrammerCommands(Target target, String programmer) {
    Map<String, String> programmerPreferences = target.getProgrammers().get(programmer);
    List params = new ArrayList();
    params.add("-c" + programmerPreferences.get("protocol"));
    
    if ("usb".equals(programmerPreferences.get("communication"))) {
      params.add("-Pusb");
    } else if ("serial".equals(programmerPreferences.get("communication"))) {
      params.add("-P" + (Base.isWindows() ? "\\\\.\\" : "") + Preferences.get("serial.port"));
      if (programmerPreferences.get("speed") != null) {
	params.add("-b" + Integer.parseInt(programmerPreferences.get("speed")));
      }
    }
    // XXX: add support for specifying the port address for parallel
    // programmers, although avrdude has a default that works in most cases.
    
    if (programmerPreferences.get("force") != null &&
        programmerPreferences.get("force").toLowerCase().equals("true"))
      params.add("-F");
    
    if (programmerPreferences.get("delay") != null)
      params.add("-i" + programmerPreferences.get("delay"));
    
    return params;
  }
  
  protected boolean burnBootloader(Collection params)
  throws RunnerException {
    Map<String, String> boardPreferences = Base.getBoardPreferences();
    List fuses = new ArrayList();
    fuses.add("-e"); // erase the chip
    fuses.add("-Ulock:w:" + boardPreferences.get("bootloader.unlock_bits") + ":m");
    if (boardPreferences.get("bootloader.extended_fuses") != null)
      fuses.add("-Uefuse:w:" + boardPreferences.get("bootloader.extended_fuses") + ":m");
    fuses.add("-Uhfuse:w:" + boardPreferences.get("bootloader.high_fuses") + ":m");
    fuses.add("-Ulfuse:w:" + boardPreferences.get("bootloader.low_fuses") + ":m");

    if (!avrdude(params, fuses))
      return false;

    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {}
    
    Target t;
    String bootloaderPath = boardPreferences.get("bootloader.path");
    
    if (bootloaderPath.indexOf(':') == -1) {
      t = Base.getTarget(); // the current target (associated with the board)
    } else {
      String targetName = bootloaderPath.substring(0, bootloaderPath.indexOf(':'));
      t = Base.targetsTable.get(targetName);
      bootloaderPath = bootloaderPath.substring(bootloaderPath.indexOf(':') + 1);
    }
    
    File bootloadersFile = new File(t.getFolder(), "bootloaders");
    File bootloaderFile = new File(bootloadersFile, bootloaderPath);
    bootloaderPath = bootloaderFile.getAbsolutePath();
    
    List bootloader = new ArrayList();
    bootloader.add("-Uflash:w:" + bootloaderPath + File.separator +
                   boardPreferences.get("bootloader.file") + ":i");
    bootloader.add("-Ulock:w:" + boardPreferences.get("bootloader.lock_bits") + ":m");

    return avrdude(params, bootloader);
  }
  
  public boolean avrdude(Collection p1, Collection p2) throws RunnerException {
    ArrayList p = new ArrayList(p1);
    p.addAll(p2);
    return avrdude(p);
  }
  
  public boolean avrdude(Collection params) throws RunnerException {
    List commandDownloader = new ArrayList();
    commandDownloader.add("avrdude");

    // Point avrdude at its config file since it's in a non-standard location.
    if (Base.isLinux()) {
      // ???: is it better to have Linux users install avrdude themselves, in
      // a way that it can find its own configuration file?
      commandDownloader.add("-C" + Base.getHardwarePath() + "/tools/avrdude.conf");
    } else {
      commandDownloader.add("-C" + Base.getHardwarePath() + "/tools/avr/etc/avrdude.conf");
    }

    if (verbose || Preferences.getBoolean("upload.verbose")) {
      commandDownloader.add("-v");
      commandDownloader.add("-v");
      commandDownloader.add("-v");
      commandDownloader.add("-v");
    } else {
      commandDownloader.add("-q");
      commandDownloader.add("-q");
    }
    commandDownloader.add("-p" + Base.getBoardPreferences().get("build.mcu"));
    commandDownloader.addAll(params);

    return executeUploadCommand(commandDownloader);
  }
}
