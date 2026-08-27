@echo off
chcp 65001 >nul
title CyberSentinel - M1n1Jens
set "DefenderPath=%ProgramFiles%\Windows Defender"
:: Copyright © 2026 M1n1Jens
:: Please retain this attribution when redistributing or modifying this project.
:menu
cls
color 0B
echo  ██████╗██╗   ██╗██████╗ ███████╗██████╗ ███████╗███████╗███╗   ██╗████████╗██╗███╗   ██╗███████╗██╗     
echo ██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║████╗  ██║██╔════╝██║     
echo ██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝███████╗█████╗  ██╔██╗ ██║   ██║   ██║██╔██╗ ██║█████╗  ██║     
echo ██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║██║╚██╗██║██╔══╝  ██║     
echo ╚██████╗   ██║   ██████╔╝███████╗██║  ██║███████║███████╗██║ ╚████║   ██║   ██║██║ ╚████║███████╗███████╗
echo  ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝
echo =====================================
echo [1] Quick Scan (can take from 2-5 minutes)
echo [2] Full system scan (can take from 1-3^+ hours)
echo [3] Custom scan (can take 2-5 seconds)
echo.
echo [99] Exit
echo =====================================
echo Enter your choice:
set /p choice=
if "%choice%"=="1" goto :pcscan
if "%choice%"=="2" goto :systemscan
if "%choice%"=="3" goto :filescan
if "%choice%"=="99" goto :exit
cls
color 04
echo Invalid number
pause
goto :menu

:systemscan
color 0B
cls
echo Scanning system...
"%DefenderPath%\MpCmdRun.exe" -Scan -ScanType 2
pause
goto :menu

:pcscan
color 0B
cls
echo Scanning PC...
"%DefenderPath%\MpCmdRun.exe" -Scan -ScanType 1
pause
goto :menu

:filescan
color 0B
cls
echo Type X to go back...
echo Enter file or folder location:
set /p file=
if /i "%file%"=="x" goto :menu
if exist "%file%" (
echo Scanning...
"%DefenderPath%\MpCmdRun.exe" -Scan -ScanType 3 -File "%file%"
pause
goto :menu
) else (
cls
color 04
echo Invalid file or folder location
pause
goto :filescan )

:Exit
exit