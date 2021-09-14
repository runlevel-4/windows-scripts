README (please)

**NOTE:** This script assumes you use 3 separate mount points for your SQL directories.

Be sure to **change line 147** to point to the location of your SQL Server **setup.exe** file

Line 147: **"\\LOCATION\OF\SQL\INSTALLER\setup.exe"**

What this script does:

The _SQL DIRETORY CONFIGURATION_ section will create the _DATA_, _SYSTEM_, and _TEMPDB_ directories used to mount the DATA, SYSTEM, and TEMPDB volumes provided by your system admin.  It will then create the remaining subdirectories needed for storing the data and log files for the intance after the mount process finishes.

The _MOUNT POINT CONFIGURATION_ section will mount the 3 volumes that your system admin created for DATA, SYSTEM, and TEMPDB.  These 3 mount points cannot have drive letters associated with them.  They must be formatted, but **NOT** assigned a drive letter.

Your volume structure may vary, but normally there are 4 total volumes:
1. Volume 1 - Drive Letter
2. Volume 2 - DB Data Volume
3. Volume 3 - DB System Volume
4. Volume 4 - DB TempDB Volume

Take note of the **Volume IDs** output from the diskpart commands.  You will need to enter these at the volume format step.
