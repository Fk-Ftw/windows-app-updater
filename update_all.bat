@echo off
setlocal enabledelayedexpansion

:: Set the Command Prompt text color to green (0A)
color 0A

:: Set log file path
set "LOGFILE=%~dp0update_log.txt"

:: Start logging
echo =============================================== >> "%LOGFILE%"
echo Update started on %DATE% at %TIME% >> "%LOGFILE%"
echo =============================================== >> "%LOGFILE%"

:: Check if winget is installed
where winget >nul 2>&1
if errorlevel 1 (
    echo [ERROR] winget is not installed or not in PATH >> "%LOGFILE%"
    echo ERROR: winget is not installed or not available in your system PATH. >> "%LOGFILE%"
    goto StoreUpdate
) else (
    echo Running: winget upgrade --all --include-unknown >> "%LOGFILE%"
    winget upgrade --all --include-unknown >> "%LOGFILE%" 2>&1
    if errorlevel 1 (
        echo [ERROR] Winget upgrade failed >> "%LOGFILE%"
    ) else (
        echo [SUCCESS] Winget apps updated successfully >> "%LOGFILE%"
    )
)

echo.
echo =======================================
echo All apps updated, now checking Microsoft apps...
echo =======================================
echo.

:StoreUpdate
powershell -command "Start-Process 'ms-windows-store://updates'" >> "%LOGFILE%" 2>&1
if errorlevel 1 (
    echo [ERROR] Failed to open Microsoft Store updates page >> "%LOGFILE%"
) else (
    echo [SUCCESS] Store updates page opened >> "%LOGFILE%"
)

echo.
echo Update complete. Log saved to: %LOGFILE% >> "%LOGFILE%"

:: Prompt for exit
echo.
echo Press any key to exit...
pause >nul

endlocal
exit
