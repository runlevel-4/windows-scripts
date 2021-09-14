@echo off

echo.
echo This will loop through each user directory and backup their folders into the path that you specify
echo.

for /D %%U in (C:\Users\*) Do xcopy "%%U\*" "\\backup\location"

echo.

pause
