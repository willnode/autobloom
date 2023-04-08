@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
dism || exit
SCHTASKS /CREATE /SC ONLOGON /TN "AUTOBLOOM" /TR "%~dp0src\run.bat"
SCHTASKS /CREATE /SC ONSTART /TN "AUTOBLOOM PREP" /TR "%~dp0src\prep.bat"
cls

echo AutoBloom has been installed!
timeout 3 >nul
