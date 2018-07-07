@ECHO OFF
ECHO Part 2: Virus Removal
cd ..
cd ..
cd 11_HijackThis
ECHO Step 11: HijackThis (Used to remove trojans and other startup issues)
HijackThis.exe
pause
cd ..
cd 12_HitmanPro
ECHO Step 12: Hitman Pro (Universal online AV removal program)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit) else (goto 32bit)
:32bit
HitmanPro.exe
pause
goto skip1
:64bit
HitmanPro_x64.exe
pause
:skip1
cd ..
cd 13_MalwareBytes
ECHO Step 13: MalwareBytes Anti-Malware (Used to remove malware)
mbam-setup-2.1.8.1057.exe
ECHO Restart the PC after MalwareBytes finishes to continue the cleanup process...
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
xcopy /s "%~dp0Continue2.bat" "%STARTUP%"
@ECHO %~dp0> cleanDir.txt
xcopy /s "%~dp0cleanDir.txt" "%STARTUP%"
pause