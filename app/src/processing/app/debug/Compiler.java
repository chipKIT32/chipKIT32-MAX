/* -*- mode: java; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
 Part of the Processing project - http://processing.org

 Copyright (c) 2004-08 Ben Fry and Casey Reas
 Copyright (c) 2001-04 Massachusetts Institute of Technology

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
 */

package processing.app.debug;

import processing.app.Base;
import processing.app.Preferences;
import processing.app.Sketch;
import processing.app.SketchCode;
import processing.core.*;

import java.io.*;
import java.util.*;
import java.util.zip.*;
import java.text.MessageFormat;

import org.apache.log4j.BasicConfigurator;
//import org.apache.log4j.PropertyConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.Level;


public class Compiler implements MessageConsumer {
	
	 static Logger logger = Logger.getLogger(Base.class.getName());

	static final String BUGS_URL = "http://code.google.com/p/arduino/issues/list";
	static final String SUPER_BADNESS = "Compiler error, please submit this code to "
			+ BUGS_URL;

	Sketch sketch;
	String buildPath;
	String primaryClassName;
	String platform;

	boolean verbose;
	String board;
	//CommandRunner runner;

	RunnerException exception;

	HashMap<String, String> configPreferences;
	HashMap<String, String> boardPreferences;
	HashMap<String, String> platformPreferences;

	String avrBasePath;
	String corePath;
	
	List<File> objectFiles;
	ArrayList<String> includePaths;

	public Compiler() {
    	logger.debug("DEBUG: Compiler(): Start no arguments");
		
	}

	/**
	 * Compile with avr-gcc.
	 * 
	 * @param sketch
	 *            Sketch object to be compiled.
	 * @param buildPath
	 *            Where the temporary files live and will be built from.
	 * @param primaryClassName
	 *            the name of the combined sketch file w/ extension
	 * @return true if successful.
	 * @throws RunnerException
	 *             Only if there's a problem. Only then.
	 */
	public boolean compile(Sketch sketch, String buildPath,String primaryClassName, boolean verbose) throws RunnerException {
		 logger.debug("DEBUG: Compiler.java: Start Compile(...).");

		this.sketch = sketch;
		this.buildPath = buildPath;
		this.primaryClassName = primaryClassName;
		this.verbose = verbose;

		// the pms object isn't used for anything but storage
		MessageStream pms = new MessageStream(this);

		boardPreferences = new HashMap(Base.getBoardPreferences());
		//Check for null platform, and use system default if not found
		platform = boardPreferences.get("platform");
		if (platform == null)
		{
		      platformPreferences = new HashMap(Base.getPlatformPreferences());
		}
		else
		{
			platformPreferences = new HashMap(Base.getPlatformPreferences(platform));
		}

		//Put all the global preference configuration into one Master configpreferences
	    configPreferences = mergePreferences( Preferences.getMap(), platformPreferences, boardPreferences);


		avrBasePath = configPreferences.get("compiler.path");
		
		logger.debug("avrBasePath: " + avrBasePath);
		if (avrBasePath == null) 
		{
			avrBasePath = Base.getAvrBasePath();
		}
		else
		{
			//Put in the system path in the compiler path if available
			MessageFormat compileFormat = new MessageFormat(avrBasePath);	
			String basePath = System.getProperty("user.dir");
			if (Base.isMacOS()) {
				logger.debug("basePath: " + basePath);
				basePath += "/mpide.app/Contents/Resources/Java";
			}
			Object[] Args = {basePath};
			avrBasePath = compileFormat.format(  Args );
	
		}
		this.board = configPreferences.get("board");
		if (this.board == "")
		{
			this.board = "_UNKNOWN";
		}

		String core = configPreferences.get("build.core");
		if (core == null) 
		{
			RunnerException re = new RunnerException(
					"No board selected; please choose a board from the Tools > Board menu.");
			re.hideStackTrace();
			throw re;
		}
		//String corePath;

		if (core.indexOf(':') == -1) 
		{
			Target t = Base.getTarget();
			File coreFolder = new File(new File(t.getFolder(), "cores"), core);
			this.corePath = coreFolder.getAbsolutePath();
		} else {
			Target t = Base.targetsTable.get(core.substring(0, core.indexOf(':')));
			File coresFolder = new File(t.getFolder(), "cores");
			File coreFolder = new File(coresFolder, core.substring(core.indexOf(':') + 1));
			this.corePath = coreFolder.getAbsolutePath();
		}

		/*
		* Debug corePath
		*/
			logger.debug("corePaths: " + this.corePath);

		
		this.objectFiles = new ArrayList<File>();
				
		// 0. include paths for core + all libraries
		logger.debug("0. getIncludes");
		this.includePaths =	getIncludes(this.corePath);
		
		// 1. compile the sketch (already in the buildPath)
		logger.debug("1. compileSketch");
		compileSketch(avrBasePath, buildPath, includePaths, configPreferences);

		// 2. compile the libraries, outputting .o files to:
		// <buildPath>/<library>/
		//Doesn't really use configPreferences
		logger.debug("2. compileLibraries");
		compileLibraries(avrBasePath, buildPath, includePaths, configPreferences);

		// 3. compile the core, outputting .o files to <buildPath> and then
		// collecting them into the core.a library file.
	    logger.debug("3. compileCore");
 		compileCore(avrBasePath, buildPath, this.corePath, configPreferences);
		
		// 4. link it all together into the .elf file
	    logger.debug("4. compileLink");
		compileLink(avrBasePath, buildPath, this.corePath, includePaths, configPreferences);

		// 5. extract EEPROM data (from EEMEM directive) to .eep file.			
	    logger.debug("5. compileEep");
		compileEep(avrBasePath, buildPath, includePaths, configPreferences);
		
		// 6. build the .hex file
	    logger.debug("6. compileHex");
		compileHex(avrBasePath, buildPath, includePaths, configPreferences);
		
		//done
	    logger.debug("7. compile done");
		return true;
	}

	private List<File> compileFiles(String avrBasePath, 
			String buildPath,
			ArrayList<String> includePaths, 
			List<File> sSources, List<File> 
			cSources,
			List<File> cppSources, 
			HashMap<String, String> configPreferences) throws RunnerException {

		List<File> objectPaths = new ArrayList<File>();

		for (File file : sSources) {
			String objectPath = buildPath + File.separator + file.getName()
					+ ".o";
			objectPaths.add(new File(objectPath));
			execAsynchronously(getCommandCompilerS(avrBasePath, includePaths,
					file.getAbsolutePath(), objectPath, configPreferences));
		}

		for (File file : cSources) {
			String objectPath = buildPath + File.separator + file.getName()
					+ ".o";
			objectPaths.add(new File(objectPath));
			execAsynchronously(getCommandCompilerC(avrBasePath, includePaths,
					file.getAbsolutePath(), objectPath, configPreferences));
		}

		for (File file : cppSources) {
			String objectPath = buildPath + File.separator + file.getName()
					+ ".o";
			objectPaths.add(new File(objectPath));
			execAsynchronously(getCommandCompilerCPP(avrBasePath, includePaths,
					file.getAbsolutePath(), objectPath, configPreferences));
		}

		return objectPaths;
	}

	boolean firstErrorFound;
	boolean secondErrorFound;

/***
* Exec as String instead of Array
*
*/

	private void execAsynchronously(String command) throws RunnerException 
	{
		{
	logger.debug("execAsynchronously: start");
    String[] commandArray = command.split("::");	
  
    List<String> stringList = new ArrayList<String>();

    for(String string : commandArray) {
  	 string = string.trim();
     if(string != null && string.length() > 0) {
       stringList.add(string);
    }
   }
   commandArray = stringList.toArray(new String[stringList.size()]);

    
    int result = 0;
    
    if (verbose || Preferences.getBoolean("build.verbose")) 
	{
      System.out.print(command.replace(":"," "));
      System.out.println();
      /*if(logger.isDebugEnabled()) {     
 		for (int i = 0; i < commandArray.length; i++) {
                        logger.debug("commandArray[" + i + "]: " + commandArray[i]);
              }
         logger.debug("Command: " + command.replace(":"," "));
       
      }*/
    }

    firstErrorFound = false;  // haven't found any errors yet
    secondErrorFound = false;

    Process process;
    
    try {
      process = Runtime.getRuntime().exec(commandArray);
    } catch (IOException e) {
      RunnerException re = new RunnerException(e.getMessage());
      re.hideStackTrace();
      throw re;
    }

    MessageSiphon in = new MessageSiphon(process.getInputStream(), this);
    MessageSiphon err = new MessageSiphon(process.getErrorStream(), this);

    // wait for the process to finish.  if interrupted
    // before waitFor returns, continue waiting
    boolean running = true;
    while (running) {
      try {
        if (in.thread != null)
          in.thread.join();
        if (err.thread != null)
          err.thread.join();
        result = process.waitFor();
        //System.out.println("result is " + result);
        running = false;
      } catch (InterruptedException ignored) { }
    }

    // an error was queued up by message(), barf this back to compile(),
    // which will barf it back to Editor. if you're having trouble
    // discerning the imagery, consider how cows regurgitate their food
    // to digest it, and the fact that they have five stomaches.
    //
    //System.out.println("throwing up " + exception);
    if (exception != null) { throw exception; }

    if (result > 1) {
      // a failure in the tool (e.g. unable to locate a sub-executable)
      System.err.println(command + " returned " + result);
    }

    if (result != 0) {
      RunnerException re = new RunnerException("Error running.");
      re.hideStackTrace();
      throw re;
    }
		}
	}
	
	/**
	 * Part of the MessageConsumer interface, this is called whenever a piece
	 * (usually a line) of error message is spewed out from the compiler. The
	 * errors are parsed for their contents and line number, which is then
	 * reported back to Editor.
	 */
	public void message(String s) {
		int i;

		// remove the build path so people only see the filename
		// can't use replaceAll() because the path may have characters in it
		// which
		// have meaning in a regular expression.
		if (!verbose) {
			while ((i = s.indexOf(buildPath + File.separator)) != -1) {
				s = s.substring(0, i)
						+ s.substring(i + (buildPath + File.separator).length());
			}
		}

		// look for error line, which contains file name, line number,
		// and at least the first line of the error message
		String errorFormat = "([\\w\\d_]+.\\w+):(\\d+):\\s*error:\\s*(.*)\\s*";
		String[] pieces = PApplet.match(s, errorFormat);

		// if (pieces != null && exception == null) {
		// exception = sketch.placeException(pieces[3], pieces[1],
		// PApplet.parseInt(pieces[2]) - 1);
		// if (exception != null) exception.hideStackTrace();
		// }

		if (pieces != null) {
			RunnerException e = sketch.placeException(pieces[3], pieces[1],
					PApplet.parseInt(pieces[2]) - 1);

			// replace full file path with the name of the sketch tab (unless
			// we're
			// in verbose mode, in which case don't modify the compiler output)
			if (e != null && !verbose) {
				SketchCode code = sketch.getCode(e.getCodeIndex());
				String fileName = code
						.isExtension(sketch.getDefaultExtension()) ? code
						.getPrettyName() : code.getFileName();
				s = fileName + ":" + e.getCodeLine() + ": error: "
						+ e.getMessage();
			}

			if (pieces[3].trim().equals("SPI.h: No such file or directory")) {
				e = new RunnerException(
						"Please import the SPI library from the Sketch > Import Library menu.");
				s += "\nAs of Arduino 0019, the Ethernet library depends on the SPI library."
						+ "\nYou appear to be using it or another library that depends on the SPI library.";
			}

			if (exception == null && e != null) {
				exception = e;
				exception.hideStackTrace();
			}
		}

		System.err.print(s);
	}

	// ///////////////////////////////////////////////////////////////////////////
	//What conditions is getCommandCompilerS invoke from?
	static private String getCommandCompilerS(String avrBasePath,
			ArrayList<String> includePaths, String sourceName, String objectName,
			HashMap<String, String> configPreferences) 
			{
		logger.debug("getCommandCompilerS: start");	
		String baseCommandString = configPreferences.get("recipe.cpp.o.pattern");
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		//getIncludes to String
		
		String includes = preparePaths(includePaths);
		
		Object[] Args = {
				avrBasePath,
				configPreferences.get("compiler.cpp.cmd"),
				configPreferences.get("compiler.S.flags"),
				configPreferences.get("compiler.cpudef"),
				configPreferences.get("build.mcu"),				
				configPreferences.get("build.f_cpu"),
				configPreferences.get("board"),
				Base.REVISION,
				includes,
				sourceName,
				objectName
		};
						
		return compileFormat.format(  Args );
	}
	
	//removed static
	private String getCommandCompilerC(String avrBasePath,
			ArrayList<String> includePaths, String sourceName, String objectName,
			HashMap<String, String> configPreferences) 
			{
		logger.debug("getCommandCompilerC: start");	
		String baseCommandString = configPreferences.get("recipe.c.o.pattern");
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		//getIncludes to String
		String includes = preparePaths(includePaths);

		Object[] Args = {
				avrBasePath,
				configPreferences.get("compiler.c.cmd"),
				configPreferences.get("compiler.c.flags"),
				configPreferences.get("compiler.cpudef"),
				configPreferences.get("build.mcu"),				
				configPreferences.get("build.f_cpu"),
				configPreferences.get("board"),
				Base.REVISION,
				includes,
				sourceName,
				objectName
		};
						
		return compileFormat.format(  Args );	
	}

	static private String getCommandCompilerCPP(String avrBasePath,
			ArrayList<String> includePaths, String sourceName, String objectName,
			HashMap<String, String> configPreferences) 
			{
		logger.debug("getCommandCompilerCPP: start");	
		String baseCommandString = configPreferences.get("recipe.cpp.o.pattern");
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		//getIncludes to String
		String includes = preparePaths(includePaths);

		Object[] Args = {
				avrBasePath,
				configPreferences.get("compiler.cpp.cmd"),
				configPreferences.get("compiler.cpp.flags"),
				configPreferences.get("compiler.cpudef"),
				configPreferences.get("build.mcu"),				
				configPreferences.get("build.f_cpu"),
				configPreferences.get("board"),
				Base.REVISION,
				includes,
				sourceName,
				objectName
		};
						
		return compileFormat.format(  Args );			
	}

	// ///////////////////////////////////////////////////////////////////////////

	static private void createFolder(File folder) throws RunnerException {
		if (folder.isDirectory())
			return;
		if (!folder.mkdir())
			throw new RunnerException("Couldn't create: " + folder);
	}

	/**
	 * Given a folder, return a list of the header files in that folder (but not
	 * the header files in its sub-folders, as those should be included from
	 * within the header files at the top-level).
	 */
	static public String[] headerListFromIncludePath(String path) {
		FilenameFilter onlyHFiles = new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith(".h");
			}
		};

		return (new File(path)).list(onlyHFiles);
	}

	static public ArrayList<File> findFilesInPath(String path,
			String extension, boolean recurse) {
		return findFilesInFolder(new File(path), extension, recurse);
	}

	static public ArrayList<File> findFilesInFolder(File folder,
			String extension, boolean recurse) {
		ArrayList<File> files = new ArrayList<File>();

		if (folder.listFiles() == null)
			return files;

		for (File file : folder.listFiles()) {
			if (file.getName().startsWith("."))
				continue; // skip hidden files

			if (file.getName().endsWith("." + extension))
				files.add(file);

			if (recurse && file.isDirectory()) {
				files.addAll(findFilesInFolder(file, extension, true));
			}
		}

		return files;
	}
	// 0. include paths for core + all libraries
	ArrayList<String> getIncludes(String corePath) 
	{
		logger.debug("corePath: " + corePath);
		ArrayList<String> includePaths = new ArrayList();
		includePaths.add(corePath);
		for (File file : sketch.getImportedLibraries()) 
		{
			logger.debug("getImportedLibraries: " + file.getPath());
			includePaths.add(file.getPath());
		}
		return includePaths;
	}
	// 1. compile the sketch (already in the buildPath)
	void compileSketch(String avrBasePath, String buildPath, ArrayList<String> includePaths, HashMap<String, String> configPreferences)
	throws RunnerException 
	{
		logger.debug("compileSketch: start");	
		this.objectFiles.addAll(compileFiles(avrBasePath, buildPath, includePaths,
				findFilesInPath(buildPath, "S", false),
				findFilesInPath(buildPath, "c", false),
				findFilesInPath(buildPath, "cpp", false), 
				configPreferences));
	}
	
	// 2. compile the libraries, outputting .o files to:
	// <buildPath>/<library>/
	void compileLibraries (String avrBasePath, String buildPath, ArrayList<String> includePaths, HashMap<String, String> configPreferences) 
		throws RunnerException 
	{
		logger.debug("compileLibraries: start");
		for (File libraryFolder : sketch.getImportedLibraries()) 
		{
			File outputFolder = new File(buildPath, libraryFolder.getName());
			File utilityFolder = new File(libraryFolder, "utility");
			createFolder(outputFolder);
			// this library can use includes in its utility/ folder
			this.includePaths.add(utilityFolder.getAbsolutePath());
			this.objectFiles.addAll(compileFiles(avrBasePath,
					outputFolder.getAbsolutePath(), includePaths,
					findFilesInFolder(libraryFolder, "S", false),
					findFilesInFolder(libraryFolder, "c", false),
					findFilesInFolder(libraryFolder, "cpp", false),
					configPreferences));
			outputFolder = new File(outputFolder, "utility");
			createFolder(outputFolder);
			this.objectFiles.addAll(compileFiles(avrBasePath,
					outputFolder.getAbsolutePath(), includePaths,
					findFilesInFolder(utilityFolder, "S", false),
					findFilesInFolder(utilityFolder, "c", false),
					findFilesInFolder(utilityFolder, "cpp", false),
					configPreferences));
			// other libraries should not see this library's utility/ folder
			this.includePaths.remove(includePaths.size() - 1);
		}
	}
	
	// 3. compile the core, outputting .o files to <buildPath> and then
	// collecting them into the core.a library file.
	void compileCore (String avrBasePath, String buildPath, String corePath, HashMap<String, String> configPreferences) 
		throws RunnerException 
	{
		logger.debug("compileCore(...) start");

		ArrayList<String>  includePaths =  new ArrayList();
	    includePaths.add(corePath); //include core path only
		String baseCommandString = configPreferences.get("recipe.ar.pattern");
		String commandString = "";
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		
		List<File> coreObjectFiles	 = compileFiles(
				avrBasePath, 
				buildPath,
				includePaths, 
				findFilesInPath(corePath, "S", true),
				findFilesInPath(corePath, "c", true),
				findFilesInPath(corePath, "cpp", true), 
				configPreferences);
		
		for (File file : coreObjectFiles) {
			//List commandAR = new ArrayList(baseCommandAR);
			//commandAR = commandAR +  file.getAbsolutePath();
		
			Object[] Args = {
				avrBasePath,
				configPreferences.get("compiler.ar.cmd"),
				configPreferences.get("compiler.ar.flags"),
				//corePath,
				buildPath + File.separator,
				"core.a",
				//objectName
				file.getAbsolutePath()
			};
			commandString = compileFormat.format(  Args );
			execAsynchronously(commandString);
		}
	}
			
	// 4. link it all together into the .elf file
	void compileLink(String avrBasePath, String buildPath, String corePath, ArrayList<String> includePaths, HashMap<String, String> configPreferences) 
		throws RunnerException 
	{	
		logger.debug("compileLink: start");
		String baseCommandString = configPreferences.get("recipe.c.combine.pattern");
		String commandString = "";
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		String objectFileList = "";
		
		for (File file : objectFiles) {
			objectFileList = objectFileList + file.getAbsolutePath() + "::";
		}

			Object[] Args = {
				avrBasePath,
				configPreferences.get("compiler.c.elf.cmd"),
				configPreferences.get("compiler.c.elf.flags"),
				configPreferences.get("compiler.cpudef"),
				configPreferences.get("build.mcu"),				
				buildPath + File.separator,
				primaryClassName,
				objectFileList,
				buildPath + File.separator + "core.a",
				buildPath,
				corePath,	
				configPreferences.get("ldscript"),	
			};
			commandString = compileFormat.format(  Args );
			execAsynchronously(commandString);
	}

	// 5. extract EEPROM data (from EEMEM directive) to .eep file.
	void compileEep (String avrBasePath, String buildPath, ArrayList<String> includePaths, HashMap<String, String> configPreferences) 
		throws RunnerException 
	{
		logger.debug("compileEep: start");
		String baseCommandString = configPreferences.get("recipe.objcopy.eep.pattern");
		String commandString = "";
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		String objectFileList = "";
		
		Object[] Args = {
			avrBasePath,
			configPreferences.get("compiler.objcopy.cmd"),
			configPreferences.get("compiler.objcopy.eep.flags"),
			buildPath + File.separator + primaryClassName,
			buildPath + File.separator + primaryClassName
			};
		commandString = compileFormat.format(  Args );		
				
		execAsynchronously(commandString);	
	}
	
	// 6. build the .hex file
	void compileHex (String avrBasePath, String buildPath, ArrayList<String> includePaths, HashMap<String, String> configPreferences) 
		throws RunnerException 
	{
		logger.debug("compileHex: start");
		String baseCommandString = configPreferences.get("recipe.objcopy.hex.pattern");
		String commandString = "";
		MessageFormat compileFormat = new MessageFormat(baseCommandString);	
		String objectFileList = "";
	
		Object[] Args = {
			avrBasePath,
			configPreferences.get("compiler.elf2hex.cmd"),
			configPreferences.get("compiler.elf2hex.flags"),
			buildPath + File.separator + primaryClassName,
			buildPath + File.separator + primaryClassName
			};
		commandString = compileFormat.format(  Args );		
				
		execAsynchronously(commandString);	
		
	}
	//merge all the preferences file in the correct order of precedence
	HashMap mergePreferences(Map Preferences,  Map platformPreferences, Map boardPreferences)
	{
		HashMap _map = new HashMap();
		
	    Iterator iterator = Preferences.entrySet().iterator();
       
        while(iterator.hasNext())
  	    {
  	    	Map.Entry pair = (Map.Entry)iterator.next();
  	    	if (pair.getValue() == null)
  	    	{
  	    		_map.put(pair.getKey(), "");
  	    	}
  	    	else
  	    	{
  	    		_map.put(pair.getKey(), pair.getValue());
  	    	}
	    }
	    
		//logger.debug("Done: Preferences");
		
		iterator = platformPreferences.entrySet().iterator();
       
       while(iterator.hasNext())
  	    {
  	    	Map.Entry pair = (Map.Entry)iterator.next();
  	    	
  	    	if (pair.getValue() == null)
  	    	{
  	    		_map.put(pair.getKey(), "");
  	    	}
  	    	else
  	    	{
  	    		_map.put(pair.getKey(), pair.getValue());
  	    	}
            //System.out.println(pair.getKey() + " = " + pair.getValue());
	    }

		//System.out.println("Done: platformPreferences");
		iterator = boardPreferences.entrySet().iterator();

        while(iterator.hasNext())
  	    {
  	    	Map.Entry pair = (Map.Entry)iterator.next();
  	    	
  	    	if (pair.getValue() == null)
  	    	{
  	    		_map.put(pair.getKey(), "");
  	    	}
  	    	else
  	    	{
  	    		_map.put(pair.getKey(), pair.getValue());
  	    	}
            //System.out.println(pair.getKey() + " = " + pair.getValue());
	    }
		//System.out.println("Done: boardPreferences");
        

	return _map;
	}
	
	private static String preparePaths(ArrayList<String> includePaths) {
	//getIncludes to String
		//logger.debug("Start: Prepare paths");
		String includes = "";
		for (int i = 0; i < includePaths.size(); i++) 
		{
			includes = includes + (" -I" + (String) includePaths.get(i)) + "::";
		}
		//logger.debug("Paths prepared: " + includes);
		return includes;
	}
	
}
