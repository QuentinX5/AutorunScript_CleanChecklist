@ECHO OFF
cls
ECHO Step 1: Clean System Internals (Dust out PC, clean components, make it look pretty inside)
ECHO Step 2: RAM Test (Diagnose if the RAM is working properly (Use MemTest+ v5.01)
ECHO Step 3: HDD Test (Test the sectors of the hard drive for issues (Recommend using HD Tune Pro))
pause
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
xcopy /s "%~dp0Start.bat" "%STARTUP%"
@ECHO %~dp0> startDir.txt
xcopy /s "%~dp0startDir.txt" "%STARTUP%"
ECHO These three steps must be completed outside of the OS
ECHO After completing these three, start the PC up again, and the process will auto-start
pause