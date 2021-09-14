@echo off

net stop wuauserv
net stop bits
net start wuauserv
net start bits
pause