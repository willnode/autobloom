@echo off
if not [%1]==[ch] (start conhost cmd /c "" "%~dpnx0" ch & exit)
powershell -NoP -W hidden ; exit
set "_home=%~dp0"
cd /D "%_home%"

powershell -NoP .\wallpaper.ps1 "%_home%..\media\first.bmp"

timeout 1
start /B ..\mpv\mpv ..\media\bloom.mp4 --no-osc --no-input-default-bindings --no-taskbar-progress
cd ..\src
timeout 4
powershell -NoP .\wallpaper.ps1 "%_home%..\media\last.bmp"
