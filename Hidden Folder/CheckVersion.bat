@echo off

REM Windows 10                              (10.0)
REM Windows Server 2016 Technical Preview   (10.0)
REM Windows 8.1                             (6.3)
REM Windows Server 2012 R2                  (6.3)
REM Windows 8                               (6.2)
REM Windows Server 2012                     (6.2)
REM Windows 7                               (6.1)
REM Windows Server 2008 R2                  (6.1)
REM Windows Server 2008                     (6.0)
REM Windows Vista                           (6.0)
REM Windows Server 2003 R2                  (5.2)
REM Windows Server 2003                     (5.2)
REM Windows XP 64-Bit Edition               (5.2)
REM Windows XP                              (5.1)
REM Windows 2000                            (5.0)

SET osversion=
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" SET osversion=3
if "%version%" == "6.3" SET osversion=3
if "%version%" == "6.2" SET osversion=2
if "%version%" == "6.1" SET osversion=1
if "%version%" == "6.0" SET osversion=1
if "%version%" == "5.2" SET osversion=1
if "%version%" == "5.1" SET osversion=1
if "%version%" == "5.0" SET osversion=0

if "%osversion%" == "1" ECHO This PC is running either XP, Vista, or Windows 7
if "%osversion%" == "2" ECHO This PC is running Windows 8
if "%osversion%" == "3" ECHO This PC is running either Windows 8.1 or Windows 10
if "%osversion%" == "0" ECHO This PC is running Windows 2000 (We do not recommend using the cleanup tools on a PC running Windows 2000)
pause