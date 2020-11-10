@ECHO OFF
ECHO Beginning the cleanup process...
ECHO Part 1: Basic Fixes and File Cleanup
set DIRECTORY=
set STARTUP=
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\
del "%STARTUP%Start.bat"
del "%STARTUP%StartDir.txt"
cd ..
cd ..
cd 04_ComboFix
ECHO Skipping Steps 1, 2, and 3...
ECHO Step 4: Run ComboFix
SET osversion=
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" SET osversion=3
if "%version%" == "6.3" SET osversion=3
if "%version%" == "6.2" SET osversion=2
if "%version%" == "6.1" SET osversion=1
if "%version%" == "6.0" SET osversion=1
if "%version%" == "5.2" SET osversion=1
if "%version%" == "5.1" SET osversion=1
if "%osversion%" == "1" goto yes1
if "%osversion%" == "2" goto yes1
if "%osversion%" == "3" goto no1
:yes1
ComboFix.exe
pause
goto skip1
:no1
ECHO ComboFix cannot be run on a PC running Windows 8.1 or 10.
ECHO Continuing with the cleanup process...
:skip1
cd ..
ECHO Step 5: Turn off System Restore (sysdm.cpl)
set DIRECTORY=%~dp0
cd C:\Windows\System32
sysdm.cpl
pause
cd %DIRECTORY%
ECHO Step 6: Open MSConfig (For Windows 8 and up, located in Task Manager)
if "%osversion%" == "1" goto 7andlow
if "%osversion%" == "2" goto 8andup
if "%osversion%" == "3" goto 8andup
:7andlow
msconfig
goto skip2
:8andup
taskmgr
:skip2
pause
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
xcopy /s "%~dp0Continue1.bat" "%STARTUP%"
@ECHO %~dp0> cleanDir.txt
xcopy /s "%~dp0cleanDir.txt" "%STARTUP%"
ECHO Step 7: Add-Remove programs
ECHO Opening up ADWCleaner...
cd ..
cd ..
cd 07_Add-Remove
adwcleaner.exe
ECHO Cleanup will continue after PC restarts...
set INPUT=
set /p INPUT=Do you want to restart the PC now? (Y/N)
If "%INPUT%"=="Y" goto restartPC
If "%INPUT%"=="y" goto restartPC
If "%INPUT%"=="N" goto notYet
If "%INPUT%"=="n" goto notYet
:restartPC
shutdown -r -t 0
pause
:notYet
pause