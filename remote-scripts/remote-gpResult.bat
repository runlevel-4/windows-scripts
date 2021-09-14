@echo off
echo.
echo This will force a Group Policy update on a remote machine
echo.
SET /P computerName=Enter Computer Name: 

psexec \\%computerName% gpresult -r

pause