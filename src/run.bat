@echo off
if not [%1]==[ch] (start conhost cmd /c "" "%~dpnx0" ch & exit)
powershell -NoP -W hidden ; exit
set "_home=%~dp0"
cd /D "%_home%"

powershell -NoP .\wallpaper.ps1 "%_home%..\media\first.bmp"

timeout 1
start ..\mpv\mpv ..\media\bloom.mp4 --no-osc --no-input-default-bindings --no-taskbar-progress --no-window-dragging ^
    --deband --hwdec=auto --no-border --cache=yes --demuxer-max-bytes=488281KiB --demuxer-readahead-secs=120 --autofit=100%% --player-operation-mode=pseudo-gui --input-ipc-server=\\.\pipe\mpvsocket --force-window=yes --volume=0
cd ..\src
timeout 2
powershell -NoP .\wallpaper.ps1 "%_home%..\media\last.bmp"
