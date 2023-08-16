@echo off
set "_home=%~1"
cd /D "%_home%"
shift
set "_theme=%~1"
powershell -NoP -ExecutionPolicy UnRestricted .\wallpaper.ps1 "%_home%..\media\%_theme%\first.webp"
