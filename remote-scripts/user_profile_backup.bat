@echo off

::Create the user folder in backup folder and copy the users' files
set /P userName=Enter the user that you want to backup: 
echo.
echo Creating user directory in Tech Share...
echo.
mkdir "\\share\drive\backup\location\%userName%\Desktop"
mkdir "\\share\drive\backup\location\backup\%userName%\Documents"
mkdir "\\share\drive\backup\location\backup\%userName%\Downloads"
mkdir "\\share\drive\backup\location\backup\%userName%\Favorites"
mkdir "\\share\drive\backup\location\backup\%userName%\Music"
mkdir "\\share\drive\backup\location\backup\%userName%\Pictures"
echo.
echo Copying user files to newly created user folder on Tech Share...
echo.
xcopy "C:\Users\%userName%\Desktop\*" "\\share\drive\backup\location\backup\%userName%\Desktop" /Y
xcopy "C:\Users\%userName%\Documents\*" "\\share\drive\backup\location\backup\%userName%\Documents" /Y
xcopy "C:\Users\%userName%\Downloads\*" "\\share\drive\backup\location\backup\%userName%\Downloads" /Y
xcopy "C:\Users\%userName%\Favorites\*" "\\share\drive\backup\location\backup\%userName%\Favorites" /Y
xcopy "C:\Users\%userName%\Music\*" "\\share\drive\backup\location\backup\%userName%\Music" /Y
xcopy "C:\Users\%userName%\Pictures\*" "\\share\drive\backup\location\backup\%userName%\Pictures" /Y
echo.
pause