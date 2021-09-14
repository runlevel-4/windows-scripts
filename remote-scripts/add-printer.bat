@echo off

echo Install a printer
echo.
SET /P compName=Enter Computer Name:
SET /P printerName=Enter Printer Name:
echo.
psexec \\%compName% printui.exe /ga /q /n"\\printserver\%printerName%"
echo.
pause
