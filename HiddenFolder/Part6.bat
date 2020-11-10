@ECHO OFF
set DIRECTORY=
set STARTUP=
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\
del "%STARTUP%Continue3.bat"
cd ..
cd ..
cd 15_Spybot
ECHO Step 15: Spybot Portable (Program to remove spyware)
SpybotPortable.exe
pause
cd ..
ECHO Step 16: Antivirus Installs
ECHO At this step, you can choose to install Antivirus programs and run them if needed
pause
ECHO Part 3: Cleanup
cd ..
cd 07_Add-Remove
ECHO Step 17: Add-Remove programs
set /P INPUT=Would you like to use Windows Uninstaller or the iOBit Uninstaller? (W/I)
If "%INPUT%"=="W" goto winUni
If "%INPUT%"=="w" goto winUni
If "%INPUT%"=="I" goto ioBit
If "%INPUT%"=="i" goto ioBit
:winUni
appwiz.cpl
pause
goto skip1
:ioBit
call iOBit.bat
:skip1
cd ..
cd "18_Device Manager"
ECHO Step 18: Device Manager (Check to see if all the devices are properly connected)
devmgmt.msc
cd ..
cd "19_Windows Updates"
ECHO Step 19: Windows Updates (Confirm that Windows is completely up to date)
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
xcopy /s "%~dp0Continue3.bat" "%STARTUP%"
@ECHO %~dp0> cleanDir.txt
xcopy /s "%~dp0cleanDir.txt" "%STARTUP%"
SET INPUT=
SET /P INPUT=Are Windows Updates fully completed without a restart? (Y/N) %=%
If "%INPUT%"=="Y" goto yes
If "%INPUT%"=="y" goto yes
If "%INPUT%"=="N" goto no
If "%INPUT%"=="n" goto no
:yes
ECHO Continuing cleanup process..
Part7.bat
goto skip1
:no
ECHO Cleanup process will continue to run after Windows Updates are completed...
pause