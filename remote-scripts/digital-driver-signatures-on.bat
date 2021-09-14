@echo off
echo This will turn on digital driver signatures.
echo.
SET /P computerName=Enter Computer Name: 
echo Enabling digital driver signature...
echo.
bcdedit /set testsigning off
echo.
echo You will be required to reboot.
pause
