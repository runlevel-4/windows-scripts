@echo off

:: Created - 10.20.20

echo.

echo ---------------------------------------------------------------------------------------
echo -             WELCOME TO THE SQL SERVER AUTOMATED INSTALLATION TOOL                   -
echo -                                                                                     -
echo - Simply provide the necessary info for configuration which includes:                 -
echo - 1. Drive Letter - This is the drive that will store your SQL data and log files     -
echo - 2. SQL Instance Name - This is what you want to name your new instance              -
echo - 3. SQL DB Engine Service Account - The AD account used to run the DB Engine Service - 
echo - 4. SQL Agent Service Account - The AD account used to run the SQL Agent Service     -
echo - 5. SQL SA Account - The SQL Server Administrator                                    -
echo ---------------------------------------------------------------------------------------

echo.

echo ---------------------------------------------------------------------------------------
echo - The SQL DIRETORY CONFIGURATION section will create the DATA, SYSTEM, and TEMPDB     -
echo - directories used to mount the DATA, SYSTEM, and TEMPDB volumes provided by the      -
echo - system admin.  It will then create the remaining subdirectories needed for storing  -
echo - the data and log files for the intance after the mount process finishes.            -
echo ---------------------------------------------------------------------------------------

echo.

echo ---------------------------------------------------------------------------------------
echo - The MOUNT POINT CONFIGURATION section will mount the 3 volumes that your system     -
echo - admin created for DATA, SYSTEM, and TEMPDB.  These cannot have drive letters        -
echo - associated with them.  They must be partioned, formatted, but NOT assigned a        -
echo - drive letter.                                                                       -
echo ---------------------------------------------------------------------------------------

echo.

pause

echo.

:::::::::::::::::::::::::: SQL DIRECTORY CONFIGURATION :::::::::::::::::::::::::::

set /P driveLetter=Enter Drive Letter: 
set /P instanceName=Enter Instance Name: 
set /P sqlsvcaccount=Enter the DB ENGINE service account NAME: 
set /P sqlsvcpassword=Enter the DB ENGINE service account PASSWORD: 
set /P agtsvcaccount=Enter the AGENT service account NAME: 
set /P agtsvcpassword=Enter the AGENT service account PASSWORD: 
set /P sapwd=Enter the SA account PASSWORD:
set /P domainUser=Enter a user with SA privileges:  

echo.

echo CREATING MOUNT POINT DIRETORIES...

echo.

echo Creating %instanceName% DATA folder
mkdir %driveLetter%:\%instanceName%
echo [DONE]

echo Creating TEMPDB folder
mkdir %driveLetter%:\TEMPDB
echo [DONE]

echo Creating SYSTEM folder
mkdir %driveLetter%:\SYSTEM
echo [DONE]

echo.

:::::::::::::::::::: MOUNT POINT CONFIG ::::::::::::::::::::::::

echo NOW ENTERING MOUNT POINT CONFIGURATION...

timeout 3 /nobreak

echo RETRIEVING VOLUME INFO...

echo.

echo > diskpart_volumes.txt LIST VOLUME
diskpart /s diskpart_volumes.txt

echo.

set /P volNumData=Enter the volume number for the DATA volume: 
set /P volNumSys=Enter the volume number for the SYSTEM volume: 
set /P volNumTempDB=Enter the volume number for the TEMPDB volume: 

echo.

echo > diskpart_volumes.txt SELECT VOLUME %volNumData%
diskpart /s diskpart_volumes.txt

echo.

::Mount DATA volume to directory
echo >> diskpart_volumes.txt ASSIGN mount=%driveLetter%:\%instanceName%\
diskpart /s diskpart_volumes.txt

echo.

echo > diskpart_volumes.txt SELECT VOLUME %volNumSys%
diskpart /s diskpart_volumes.txt

echo.

::Mount SYSTEM volume to directory
echo >> diskpart_volumes.txt ASSIGN mount=%driveLetter%:\SYSTEM\
diskpart /s diskpart_volumes.txt

echo.

echo > diskpart_volumes.txt SELECT VOLUME %volNumTempDB%
diskpart /s diskpart_volumes.txt

echo.

::Mount TEMPDB volume to directory
echo >> diskpart_volumes.txt ASSIGN mount=%driveLetter%:\TEMPDB\
diskpart /s diskpart_volumes.txt

echo.

::Create the rest of the directories
echo FINISHING DIRECTORY CREATIONS

echo.

mkdir %driveLetter%:\%instanceName%\MSSQL13.%instanceName%\MSSQL\DATA
mkdir %driveLetter%:\TEMPDB\MSSQL13.%instanceName%\MSSQL\DATA

timeout 3 /nobreak

echo.

echo RUNNING SQL INSTALLER

timeout 3 /nobreak

:: Run the installer with the input parameters entered by the user
:: Accepts all license agreements, fill in service account and directory info, and enable mixed-mode auth and sa account
:: Enables TCP/IP without having to go into SQL Configuration Manager

"\\LOCATION\OF\SQL\INSTALLER\setup.exe" /QS /IACCEPTSQLSERVERLICENSETERMS /SQLSVCINSTANTFILEINIT="True" /SUPPRESSPRIVACYSTATEMENTNOTICE /ACTION="install" /FEATURES=SQLENGINE,FULLTEXT,BC,Conn,SDK /INSTANCENAME=%instanceName% /AGTSVCACCOUNT=%agtsvcaccount% /AGTSVCPASSWORD=%agtsvcpassword% /AGTSVCSTARTUPTYPE="Automatic" /SQLSVCACCOUNT=%sqlsvcaccount% /SQLSVCPASSWORD=%sqlsvcpassword% /SQLSVCSTARTUPTYPE="Automatic" /SECURITYMODE="SQL" /SAPWD=%sapwd% /SQLSYSADMINACCOUNTS="%domainUser%" /INSTALLSQLDATADIR=%driveLetter%:\SYSTEM /SQLUSERDBDIR=%driveLetter%:\%instanceName%\MSSQL13.%instanceName%\MSSQL\DATA /SQLUSERDBLOGDIR=%driveLetter%:\%instanceName%\MSSQL13.%instanceName%\MSSQL\DATA /SQLBACKUPDIR=%driveLetter%:\%instanceName%\MSSQL13.%instanceName%\MSSQL\DATA /SQLTEMPDBDIR=%driveLetter%:\TEMPDB\MSSQL13.%instanceName%\MSSQL\DATA /SQLTEMPDBLOGDIR=%driveLetter%:\TEMPDB\MSSQL13.%instanceName%\MSSQL\DATA /TCPENABLED=1 /UpdateEnabled=0

pause
