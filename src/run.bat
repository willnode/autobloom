@echo off
set home=%~dp0
cd /D "%~dp0"
cd ..\mpv
%home%ChangeWallpaper.exe %home%..\media\first.bmp
timeout 1
start /B mpv %home%..\media\bloom.mp4 --no-osc
cd ..\src
timeout 5
%home%ChangeWallpaper.exe %home%..\media\last.bmp
