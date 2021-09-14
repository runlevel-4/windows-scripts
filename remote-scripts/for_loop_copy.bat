@echo off

:: FOR loop that copies a file to multiple directories at once
:: You can edit it to fit your needs.  In my case I needed to copy a file to all user AppData directories (50+ user profiles) at once.
:: Replace the "\path\to\filename" with the path to the actual file that you want to copy

for /D %%U in ("C:\Users\*") Do xcopy "path\to\filename" "%%U\AppData\Local" /Y
