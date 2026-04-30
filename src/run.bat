@echo off
set "_home=%~dp0"
cd /D "%_home%"
set "_theme=%~1"
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 \"%_home%..\media\%_theme%\first.png\"

timeout 1
if "%_theme%"=="dark" (set _keepasp=yes) else (set _keepasp=no)
start /min wscript silent.vbs ..\mpv\mpv ..\media\%_theme%\bloom.mp4 --volume=0 --wid=0 --force-window=yes --no-window-dragging --cursor-autohide=no --stop-screensaver=no --input-default-bindings=no --keepaspect=%_keepasp% --no-osc --hwdec=auto --gpu-api=d3d11 --profile=high-quality --deband=no --no-config
timeout 2
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 \"%_home%..\media\%_theme%\last.png\"
exit /b 0
