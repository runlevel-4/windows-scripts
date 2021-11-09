@echo off
echo.
diskpart /s listdisk.txt
echo.
set /P diskNum=Enter the disk number (DO NOT USE DISK 0, this is your main hard drive!!): 
echo select %diskNum% > dpScript.txt
echo clean >> dpScript.txt
echo create partition primary >> dpScript.txt
echo select part 1 >> dpScript.txt
echo format fs=ntfs quick >> dpScript.txt
echo active >> dpScript.txt
echo assign >> dpScript.txt
diskpart /s dpScript.txt
echo.
pause
