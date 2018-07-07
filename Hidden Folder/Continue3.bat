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

@ECHO OFF
SET INPUT=
SET /P INPUT=Are Windows updates fully finished? %=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no
:yes
SET output=cleanDir.txt
FOR /F "tokens=*" %%L IN (%output%) DO (
    SET DIRECTORY=%%L
)
cd /d %DIRECTORY%
call Part7.bat
exit
:no
ECHO Continuing to run Windows Updates...
wuapp
exit