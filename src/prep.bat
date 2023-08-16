@echo off
set "_home=%~1"
cd /D "%_home%"
shift
set "_theme=%~1"
powershell -NoP .\wallpaper.ps1 "%_home%..\media\%_theme%\first.webp"
