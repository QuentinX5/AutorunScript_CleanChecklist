@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

ECHO OFF
ECHO Welcome to the Autorun Script for PC Cleaning!
set INPUT=
set /P INPUT=Would you like to begin cleaning the PC now? (Y/N) %=%
If /I "%INPUT%"=="y" goto yes1 
If /I "%INPUT%"=="n" goto quit
:yes1
ECHO Running script...
set INPUT=
set /P INPUT=Have you completed the hardware diagnostics? (Y/N) %=%
If /I "%INPUT%"=="y" goto yes2
If /I "%INPUT%"=="n" goto no2
:yes2
cd "Hidden Folder"
Part2.bat
exit
:no2
cd "Hidden Folder"
Part1.bat
:quit
ECHO Exiting program...
pause