@echo off

SET /P computerName=Enter Computer Name: 

echo Restarting Print Spooler Service
psexec \\%computerName% net stop spooler
pause
psexec \\%computerName% net start spooler
pause