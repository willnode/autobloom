@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

rem echo Select theme:
rem dir /b media
rem echo.
rem set /p "_theme=> "
set "_theme=light"

SCHTASKS /CREATE /SC ONLOGON /TN "AUTOBLOOM"      /TR "wscript '%~dp0src\silent.vbs' 'conhost cmd /c '%~dp0src\run.bat' ch '%~dp0src\ ' %_theme% '"
SCHTASKS /CREATE /SC ONSTART /TN "AUTOBLOOM PREP" /TR "wscript '%~dp0src\silent.vbs' 'conhost cmd /c '%~dp0src\prep.bat' '%~dp0src\ ' %_theme% '" /RU "SYSTEM"
cls

echo AutoBloom has been installed!

timeout 3 >nul