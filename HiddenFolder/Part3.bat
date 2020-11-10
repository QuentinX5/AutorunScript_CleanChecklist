@ECHO OFF
set DIRECTORY=%~dp0
set STARTUP=%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup\
del "%STARTUP%Continue1.bat"
cd %DIRECTORY%
cd ..
cd ..
cd 07_Add-Remove
set INPUT=
set /p INPUT=Would you like to use Windows Uninstaller or the iOBit Uninstaller? (W/I)
If "%INPUT%"=="W" goto winUni
If "%INPUT%"=="w" goto winUni
If "%INPUT%"=="I" goto ioBit
If "%INPUT%"=="i" goto ioBit
:winUni
appwiz.cpl
goto skip1
:ioBit
call iOBit.bat
:skip1
pause
ECHO %~dp0
cd ..
cd 08_ATF
ECHO Step 8: ATF-Cleaner (Used to cleanup temporary files)
ATF-Cleaner.exe
pause
cd ..
cd 09_CCleaner
ECHO Step 9: CCleaner (Deep clean for temporary files and registry)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit) else (goto 32bit)
:32bit
CCleaner.exe
pause
goto skip2
:64bit
CCleaner64.exe
pause
:skip2
cd ..
cd 10_Autoruns
ECHO Step 10: Autoruns (Used to clean up start menu items)
IF EXIST "%PROGRAMFILES(X86)%" (goto 64bit2) else (goto 32bit2)
:32bit2
autoruns.exe
pause
goto skip3
:64bit2
autoruns64.exe
pause
:skip3
cd ..
cd "000_Autorun-Script"
cd "Hidden Folder"
Part4.bat