@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
SCHTASKS /CREATE /SC ONLOGON /TN "AUTOBLOOM" /TR "wscript '%~dp0src\silent.vbs' 'conhost cmd /c '%~dp0src\run.bat' ch'"
SCHTASKS /CREATE /SC ONSTART /TN "AUTOBLOOM PREP" /TR "wscript '%~dp0src\silent.vbs' 'conhost cmd /c '%~dp0src\prep.bat''"
cls

echo AutoBloom has been installed!

timeout 3 >nul
