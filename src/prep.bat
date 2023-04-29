@echo off
set "_home=%~dp0"
cd /D "%_home%"
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 "%_home%..\media\first.bmp"
