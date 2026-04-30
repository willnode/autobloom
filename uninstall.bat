@echo off
fltmc >nul 2>&1 || (powershell start -verb runas '%~dpnx0' am_admin & exit /b)

cd /d %~dp0

cls

echo Removing scheduled tasks...
echo ===========================

SCHTASKS /DELETE /TN "AUTOBLOOM"      /f >nul
SCHTASKS /DELETE /TN "AUTOBLOOM PREP" /f >nul

echo ===========================
echo.

echo AutoBloom has been uninstalled.
timeout 3 >nul
