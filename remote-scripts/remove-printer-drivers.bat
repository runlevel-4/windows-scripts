@echo off

SET /P computerName=Enter Computer Name: 

echo Powering down phasers
psexec \\%computerName% net stop spooler
echo.
echo Removing old crappy printer drivers
del \\%computerName%\C$\Windows\System32\spool\drivers\W32X86\*.*
del \\%computerName%\C$\Windows\System32\spool\drivers\x64\*.*
echo.
echo Bringing phasers back online
psexec \\%computerName% net start spooler
echo.
pause