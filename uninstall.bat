@echo off
fltmc >nul 2>&1 || (powershell start -verb runas '%~dpnx0' am_admin & exit /b)

cd /d %~dp0

cls

echo Removing scheduled tasks...
echo ===========================

SCHTASKS /DELETE /TN "AUTOBLOOM"      /f
SCHTASKS /DELETE /TN "AUTOBLOOM PREP" /f

echo ===========================
echo.

echo AutoBloom has been uninstalled.
echo Bye!
pause
