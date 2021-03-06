@ECHO OFF
set DIRECTORY=
set STARTUP=
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\
del "%STARTUP%Continue4.bat"
del "%STARTUP%cleanDir.txt"
cd ..
cd ..
ECHO Step 20: Clean Browsers (Test browsers, remove cookies, cleanup browser toolbars, etc.)
cd 21_ATF
ECHO Step 21: ATF-Cleaner (Used to cleanup temporary files)
call ATF.bat
pause
cd ..
cd 22_CCleaner
ECHO Step 22: CCleaner (Deep clean for temporary files and registry)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit1) else (goto 32bit1)
:32bit1
call CCleaner.bat
goto skip1
:64bit1
call CCleaner64.bat
:skip1
pause
cd ..
cd 23_Autoruns
ECHO Step 23: Autoruns (Used to clean up start menu items)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit2) else (goto 32bit2)
:32bit2
autoruns.exe
goto skip2
:64bit2
autoruns64.exe
:skip2
pause
cd ..
cd 24_Defrag
ECHO Step 24: Defrag PC (Helps to organize data on the hard drive)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit3) else (goto 32bit3)
:32bit3
cd "MyDefrag-v4.3.1"
cd x32
start MyDefrag.exe
cd ..
cd ..
goto skip3
:64bit3
cd "MyDefrag-v4.3.1"
cd x64
start MyDefrag.exe
cd ..
cd ..
:skip3
pause
ECHO Step 25: Open MSConfig (For Windows 8 and up, located in Task Manager) (msconfig)
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
:7andlow
msconfig
goto skip4
:8andup
taskmgr
:skip4
pause
ECHO Step 26: Remove Tools (Uninstall any programs, delete files, etc)
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
del cleanDir.txt
del startDir.txt
pause
ECHO Step 27: Turn On System Restore (sysdm.cpl)
set DIRECTORY=%~dp0
cd C:\Windows\System32
sysdm.cpl
pause
cd %DIRECTORY%
cls
ECHO Step 28: The PC is finished!
ECHO Congratulations and thank you for using this script!
ECHO Created by QuentinX5 (Copyright 2016)
ECHO (For any other issues, use the Last Resort Tools)
pause