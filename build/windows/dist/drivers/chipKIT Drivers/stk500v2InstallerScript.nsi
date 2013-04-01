; installscript.nsi
;
; An NSIS document for creating a windows installer.
; Place this document in a directory with all of the 
; items that should be installed into the end user's
; extensions directory, including the 'serial' folder.
;
;--------------------------------

; The name of the installer
Name "chipKIT USB Serial Driver Installer"

; The file to write
OutFile "chipKITDriverInstaller_v10.exe"

; The default installation directory
InstallDir "$EXEDIR"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

; Directory dialog text header::
DirText "This appliation installs the chipKIT USB \
serial drivers into the same direocty that the application \
is run from."

;--------------------------------

; Pages

Page directory
Page instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "USBDriverInstaller.exe"
  File "DIFxAPI_x64.dll"
  File "DIFxAPI_x86.dll"
  File "stk500v2.cat"
  File "Stk500v2.inf"
  File "ReadMe.txt"
  ExecWait '"$INSTDIR\USBDriverINstaller.exe" -auto'
  
SectionEnd ; end the section
