@echo off
fltmc >nul 2>&1 || (powershell start -verb runas '%~dpnx0' am_admin & exit /b)

cd /d %~dp0

cls

echo Select theme from below:
echo ------------------------
dir /b media
echo ------------------------
echo.
set /p "_theme=> "
echo.

cls
echo Selected theme: %_theme%
echo.
echo Creating scheduled tasks...
echo ===========================
SCHTASKS /CREATE /SC ONLOGON /TN "AUTOBLOOM"      /TR "wscript '%~dp0src\silent.vbs' 'conhost' 'cmd' '/c' '%~dp0src\run.bat'  '%_theme%'"
SCHTASKS /CREATE /SC ONSTART /TN "AUTOBLOOM PREP" /TR "wscript '%~dp0src\silent.vbs' 'conhost' 'cmd' '/c' '%~dp0src\prep.bat' '%_theme%'"
echo ===========================

echo.
echo [+] AutoBloom has been installed!
echo.
echo ----------------------------------------------------------------------------------
echo ^!^!^! Now, you should see a few lines below indicating that files will be unblocked.
echo ^!^!^! If these lines do not appear, open an issue on the GitHub repo.
echo ----------------------------------------------------------------------------------
echo.

:: test run for output
powershell -NoP -c "Unblock-File %~dp0src\*.* -WhatIf"
:: actual process
powershell -NoP -c "Unblock-File %~dp0src\*.*"

echo ----------------------------------------------------------------------------------
echo.
echo Bye!

pause