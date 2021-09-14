@echo off
echo This will turn off digital driver signatures if you are having issues installing 3rd party drivers.
echo.
SET /P computerName=Enter Computer Name: 
echo Disabling digital driver signature...
echo.
bcdedit /set testsigning on
echo.
echo You will be required to reboot.
pause
