@echo off

SET /P compName=Enter Computer Name: 

psexec \\%compName% wusa /uninstall /kb:3058515 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2533623 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2670838 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2729094 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2731771 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2786081 /quiet /norestart
psexec \\%compName% wusa /uninstall /kb:2834140 /quiet /forcerestart
pause
