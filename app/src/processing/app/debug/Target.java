
/* -*- mode: jde; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
  Target - represents a hardware platform
  Part of the Arduino project - http://www.arduino.cc/

  Copyright (c) 2009 David A. Mellis

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

import java.io.*;
import java.util.*;

import processing.app.Preferences;
import processing.app.Base;



import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.PropertyConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.Level;


public class Target {
  private String name;
  private File folder;
  private Map boards;
  private Map programmers;
  private Map platforms;
  private Map bootloaders;

  static Logger logger = Logger.getLogger(Base.class.getName());
  
  public Target(String name, File folder) {
  	logger.debug("Target: initiated: name = " + name + " folder= " + folder.getName());

  
    this.name = name;
    this.folder = folder;
    this.boards = new LinkedHashMap();
    this.programmers = new LinkedHashMap();
    this.platforms = new LinkedHashMap();
    this.bootloaders = new LinkedHashMap();
    
    File boardsFile = new File(folder, "boards.txt");
    try {
      if (boardsFile.exists()) {
        Map boardPreferences = new LinkedHashMap();
        Preferences.load(new FileInputStream(boardsFile), boardPreferences);
        for (Object k : boardPreferences.keySet()) {
          String key = (String) k;
          String board = key.substring(0, key.indexOf('.'));
          if (!boards.containsKey(board)) boards.put(board, new HashMap());
          ((Map) boards.get(board)).put(
            key.substring(key.indexOf('.') + 1),
            boardPreferences.get(key));
        }
      }
    } catch (Exception e) {
      System.err.println("Error loading boards from " + boardsFile + ": " + e);
    }

   File platformsFile = new File(folder,"platforms.txt");
   try
   {
    if(platformsFile.exists()){
       Map platformPreferences = new LinkedHashMap();
       Preferences.load(new FileInputStream(platformsFile), platformPreferences);
       for(Object k : platformPreferences.keySet())
	{
               String key=(String) k;
               String platform=key.substring(0,key.indexOf('.'));
               if (!platforms.containsKey(platform)) platforms.put(platform, new HashMap());
          ((Map) platforms.get(platform)).put(key.substring(key.indexOf('.') + 1),platformPreferences.get(key));
        }
      }
    } catch (Exception e) {
      System.err.println("Error loading platforms from " + 
                         platformsFile + ": " + e);                        
     // System.exit(0);	
    
    }    


    File programmersFile = new File(folder, "programmers.txt");
    try {
      if (programmersFile.exists()) {
        Map programmerPreferences = new LinkedHashMap();
        Preferences.load(new FileInputStream(programmersFile), programmerPreferences);
        for (Object k : programmerPreferences.keySet()) {
          String key = (String) k;
          String programmer = key.substring(0, key.indexOf('.'));
          if (!programmers.containsKey(programmer)) programmers.put(programmer, new HashMap());
          ((Map) programmers.get(programmer)).put(
            key.substring(key.indexOf('.') + 1),
            programmerPreferences.get(key));
        }
      }
    } catch (Exception e) {
      System.err.println("Error loading programmers from " + 
                         programmersFile + ": " + e);
    }    
  
  
    File bootloadersFile = new File(folder, "bootloaders.txt");
    try {
      if (bootloadersFile.exists()) {
        Map bootloaderPreferences = new LinkedHashMap();
        Preferences.load(new FileInputStream(bootloadersFile), bootloaderPreferences);
        for (Object k : bootloaderPreferences.keySet()) {
          String key = (String) k;
          String bootloader = key.substring(0, key.indexOf('.'));
          if (!bootloaders.containsKey(bootloader)) bootloaders.put(bootloader, new HashMap());
          ((Map) bootloaders.get(bootloader)).put(
            key.substring(key.indexOf('.') + 1),
            bootloaderPreferences.get(key));
        }
      }
    } catch (Exception e) {
      System.err.println("Error loading bootloaders from " + 
                         bootloadersFile + ": " + e);
    }    

    File variantsDir = new File(folder, "variants");
    if (variantsDir.exists()) {
        if (variantsDir.isDirectory()) {
            logger.debug("Ok, variants is a directory");
            for (File child : variantsDir.listFiles()) {
                if (child.isDirectory()) {

                    File variantBoardsFile = new File(child, "boards.txt");
                    try {
                      if (variantBoardsFile.exists()) {
                        Map boardPreferences = new LinkedHashMap();
                        Preferences.load(new FileInputStream(variantBoardsFile), boardPreferences);
                        for (Object k : boardPreferences.keySet()) {
                          String key = (String) k;
                          String board = key.substring(0, key.indexOf('.'));
                          if (!boards.containsKey(board)) boards.put(board, new HashMap());
                          ((Map) boards.get(board)).put(
                            key.substring(key.indexOf('.') + 1),
                            boardPreferences.get(key));
                        }
                      }
                    } catch (Exception e) {
                      System.err.println("Error loading boards from " + variantBoardsFile + ": " + e);
                    }
                    File variantBootloadersFile = new File(child, "bootloaders.txt");
                    try {
                      if (variantBootloadersFile.exists()) {
                        Map bootloaderPreferences = new LinkedHashMap();
                        Preferences.load(new FileInputStream(variantBootloadersFile), bootloaderPreferences);
                        for (Object k : bootloaderPreferences.keySet()) {
                          String key = (String) k;
                          String bootloader = key.substring(0, key.indexOf('.'));
                          if (!bootloaders.containsKey(bootloader)) bootloaders.put(bootloader, new HashMap());
                          ((Map) bootloaders.get(bootloader)).put(
                            key.substring(key.indexOf('.') + 1),
                            bootloaderPreferences.get(key));
                        }
                      }
                    } catch (Exception e) {
                      System.err.println("Error loading bootloaders from " + 
                         variantBootloadersFile + ": " + e);
                    }    
                }
            }
        }
    }

    File sbhw = Base.getSketchbookHardwareFolder();
    File sbhwFolder = new File(sbhw, folder.getName());
    if (sbhwFolder.exists()) {
        logger.debug("SBHW OK");
        variantsDir = new File(sbhwFolder, "variants");
        if (variantsDir.exists()) {
            if (variantsDir.isDirectory()) {
                logger.debug("Scanning extra dir " +
                    sbhw.getName() + "/" + sbhwFolder.getName() + "/" +
                    variantsDir.getName());
                for (File child : variantsDir.listFiles()) {
                    if (child.isDirectory()) {

                        File variantBoardsFile = new File(child, "boards.txt");
                        try {
                          if (variantBoardsFile.exists()) {
                            Map boardPreferences = new LinkedHashMap();
                            Preferences.load(new FileInputStream(variantBoardsFile), boardPreferences);
                            for (Object k : boardPreferences.keySet()) {
                              String key = (String) k;
                              String board = key.substring(0, key.indexOf('.'));
                              if (!boards.containsKey(board)) boards.put(board, new HashMap());
                              ((Map) boards.get(board)).put(
                                key.substring(key.indexOf('.') + 1),
                                boardPreferences.get(key));
                            }
                          }
                        } catch (Exception e) {
                          System.err.println("Error loading boards from " + variantBoardsFile + ": " + e);
                        }
                        File variantBootloadersFile = new File(child, "bootloaders.txt");
                        try {
                          if (variantBootloadersFile.exists()) {
                            Map bootloaderPreferences = new LinkedHashMap();
                            Preferences.load(new FileInputStream(variantBootloadersFile), bootloaderPreferences);
                            for (Object k : bootloaderPreferences.keySet()) {
                              String key = (String) k;
                              String bootloader = key.substring(0, key.indexOf('.'));
                              if (!bootloaders.containsKey(bootloader)) bootloaders.put(bootloader, new HashMap());
                              ((Map) bootloaders.get(bootloader)).put(
                                key.substring(key.indexOf('.') + 1),
                                bootloaderPreferences.get(key));
                            }
                          }
                        } catch (Exception e) {
                          System.err.println("Error loading bootloaders from " + 
                             variantBootloadersFile + ": " + e);
                        }    
                    }
                }
            }
        }
    }
  }

  public File getVariantFolder(String variant) {
        File variantFolder = null;
        if (variant != null) {
            if (variant.indexOf(':') == -1) {
                File sketchHardwareFolder = Base.getSketchbookHardwareFolder();
                if (sketchHardwareFolder.exists() && sketchHardwareFolder.isDirectory()) {
                    File sketchTargetFolder = new File(sketchHardwareFolder, name);
                    if (sketchTargetFolder.exists() && sketchTargetFolder.isDirectory()) {
                        File sketchVariantsFolder = new File(sketchTargetFolder, "variants");
                        if (sketchVariantsFolder.exists() && sketchVariantsFolder.isDirectory()) {
                            variantFolder = new File(sketchVariantsFolder, variant);
                        }
                    }
                }

                if (variantFolder == null) {
                    variantFolder = new File(
                        new File(folder, "variants"), variant);
                }
            } else {
                Target t = Base.targetsTable.get(variant.substring(0, variant.indexOf(':')));

                File sketchHardwareFolder = Base.getSketchbookHardwareFolder();
                if (sketchHardwareFolder.exists() && sketchHardwareFolder.isDirectory()) {
                    File sketchTargetFolder = new File(sketchHardwareFolder, name);
                    if (sketchTargetFolder.exists() && sketchTargetFolder.isDirectory()) {
                        File sketchVariantsFolder = new File(sketchTargetFolder, "variants");
                        if (sketchVariantsFolder.exists() && sketchVariantsFolder.isDirectory()) {
                            variantFolder = new File(sketchVariantsFolder, variant.substring(variant.indexOf(':') + 1));
                        }
                    }
                }

                if (variantFolder == null) {
                    variantFolder = new File(
                        new File(folder, "variants"), variant.substring(variant.indexOf(':') + 1));
                }
            }
        }
        return variantFolder;
  }
  
  public String getName() { return name; }
  public File getFolder() { return folder; }
  public Map<String, Map<String, String>> getBoards() {
  	logger.debug("Target: getBoards(): " + this.name);
    return boards;
  }
  public Map<String, Map<String, String>> getProgrammers() {
  	logger.debug("Target: getProgrammers() for: " + this.name);
    return programmers;
  }
  public Map<String, Map<String, String>> getPlatforms() {
  	logger.debug("Target: getPlatforms(): " + this.name);
    return platforms;
  }
  public Map<String, Map<String, String>> getBootloaders() {
  	logger.debug("Target: getBootloaders(): " + this.name);
    return bootloaders;
  }

  public Map<String, String> getSketchPreferences(File folder) {
     Map sketchprefs;
     sketchprefs = new LinkedHashMap();

     //In this case folder needs to be placed in the sketches folder
    File sketchprefsFile = new File(folder,"preferences.txt");
    try
    {
       if(sketchprefsFile.exists()){
          Map sketchPreferences = new LinkedHashMap();
          Preferences.load(new FileInputStream(sketchprefsFile), sketchPreferences);
          for(Object k : sketchPreferences.keySet()) {
               String key=(String) k;
               String sketchpref=key.substring(0,key.indexOf('.'));
               if (!sketchprefs.containsKey(sketchprefs)) sketchprefs.put(sketchprefs, new HashMap());
                  ((Map) sketchprefs.get(sketchpref)).put(key.substring(key.indexOf('.') + 1),sketchPreferences.get(key));
           }     
         }
     } catch (Exception e) {
        System.err.println("Error loading sketchprefs from " +
                      sketchprefsFile + ": " + e);
        // System.exit(0);
    }  
    logger.debug("Target: getSketchPreferences() for: " + this.name);
    return sketchprefs;
  }


}
