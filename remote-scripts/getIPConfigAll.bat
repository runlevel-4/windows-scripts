@echo off

echo This will retrieve the MAC/Physical Hardware address of a computer...
echo.
SET /P computerName=Enter Computer Name:

psexec \\%computerName% ipconfig /all
echo.
pause