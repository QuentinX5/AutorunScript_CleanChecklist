@ECHO OFF
set DIRECTORY=
set STARTUP=
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\
del "%STARTUP%Continue2.bat"
cd ..
cd ..
cd 14_A2
ECHO Step 14: Emsisosft Emergency Kit (Another powerful AV and Malware removal program)
call A2.bat
pause
cd ..
cd 15_Spybot
ECHO Step 15: Spybot Portable (Program to remove spyware)
SpybotPortable.exe
pause
cd ..
ECHO Step 16: Antivirus Installs
ECHO At this step, you can choose to install Antivirus if needed
pause
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
SET output=cleanDir.txt
FOR /F "tokens=*" %%L IN (%output%) DO (
    SET DIRECTORY=%%L
)
cd /d %DIRECTORY%
call Part6.bat