@echo off
set "_home=%~dp0"
cd /D "%_home%"
set "_theme=%~1"
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 "%_home%..\media\%_theme%\first.png"
