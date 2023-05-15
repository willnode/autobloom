rem @echo off
if not [%1]==[ch] (start conhost cmd /c "" "%~dpnx0" ch & exit)
shift
set "_theme=%~2"
powershell -NoP -W hidden ; exit
set "_home=%~1"
cd /D "%_home%"

powershell -NoP .\wallpaper.ps1 "%_home%..\media\%_theme%\first.webp"

timeout 1
start /B ..\mpv\mpv ..\media\%_theme%\bloom.mp4 --no-osc --no-input-default-bindings --no-input-builtin-bindings --no-taskbar-progress --no-window-dragging ^
    --deband --hwdec=auto --no-border --cache=yes --demuxer-max-bytes=488281KiB --demuxer-readahead-secs=120 --autofit=100%% --player-operation-mode=pseudo-gui --input-ipc-server=\\.\pipe\mpvsocket --force-window=yes --volume=0
cd ..\src
timeout 2
powershell -NoP .\wallpaper.ps1 "%_home%..\media\%_theme%\last.webp"
