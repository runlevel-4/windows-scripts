@echo off

echo This will restart a machine remotely
echo.
SET /p compName=Enter Computer Name:
shutdown -m \\%compName% -r -f -t 05
echo Machine is restarting...
pause