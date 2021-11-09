@echo off
echo.
echo Download and open the Windows 11 iso file.  Enter the path
echo.
pause.
echo.
set /P isofilename=Enter the path to the iso file: 
echo.
%Swindir%\system32\diskpart /s listdisk.txt
echo.
set /P diskNum=Enter the disk number (DO NOT USE DISK 0, this is your main hard drive!!): 
echo select %diskNum% > dpScript.txt
echo clean >> dpScript.txt
echo create partition primary >> dpScript.txt
echo select part 1 >> dpScript.txt
echo format fs=ntfs quick >> dpScript.txt
echo active >> dpScript.txt
echo assign >> dpScript.txt
%Swindir%\system32\diskpart /s dpScript.txt
echo.
echo Bootable media created
echo.
echo Mounting and copying iso file to media
echo.
%isofilename%
