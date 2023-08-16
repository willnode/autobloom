rem @echo off
if not [%1]==[ch] (start conhost cmd /c "" "%~dpnx0" ch & exit)
shift
set "_theme=%~2"
powershell -NoP -W hidden ; exit
set "_home=%~1"
cd /D "%_home%"

powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 "%_home%..\media\%_theme%\first.webp"

timeout 1
start /B ..\mpv\mpv ..\media\%_theme%\bloom.mp4 --volume=0 --geometry=-9999:0 --force-window=yes --no-window-dragging --cursor-autohide=no --stop-screensaver=no --input-default-bindings=no --keepaspect=no --no-osc  --hwdec=no --no-config
cd ..\src
timeout 2
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 "%_home%..\media\%_theme%\last.webp"
