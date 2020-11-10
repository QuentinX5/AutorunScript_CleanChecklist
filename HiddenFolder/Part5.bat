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
"Start Emergency Kit Scanner.exe"
ECHO Restart the PC after Emsisoft Emergency Kit finishes to continue the cleanup process...
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup
xcopy /s "%~dp0Continue3.bat" "%STARTUP%"
@ECHO %~dp0> cleanDir.txt
xcopy /s "%~dp0cleanDir.txt" "%STARTUP%"
pause