@echo off
echo Starting Beat Saber
start "" "steam://rungameid/620980"
echo Beat Saber started
TIMEOUT /T 10 /NOBREAK
Powershell.exe -executionpolicy remotesigned -File  "%~dp0BSPA.ps1"
echo Processor affinity and priority class set
pause