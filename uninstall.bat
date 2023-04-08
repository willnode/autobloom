@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
dism || exit
SCHTASKS /DELETE /TN "AUTOBLOOM" /f
SCHTASKS /DELETE /TN "AUTOBLOOM PREP" /f
cls

echo AutoBloom has been removed.
timeout 3 >nul
