@echo off
chcp 65001 >nul
echo ========================================
echo   Starting GunnyArena Dev Servers
echo ========================================
echo.

REM
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Đang yêu cầu quyền Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Đang khởi động dev servers với quyền Admin...
echo.

REM Khởi động Center Server từ GameSrc
echo [1/3] Starting Center Server (Dev)...
start "Center Server Dev" /D "%~dp0Server\GameSrc\Center.Service\bin\Debug" "%~dp0Server\GameSrc\Center.Service\bin\Debug\Center.Service.exe"
timeout /t 2 /nobreak >nul

REM Khởi động Fighting Server từ GameSrc
echo [2/3] Starting Fighting Server (Dev)...
start "Fighting Server Dev" /D "%~dp0Server\GameSrc\Fighting.Service\bin\Debug" "%~dp0Server\GameSrc\Fighting.Service\bin\Debug\Fighting.Service.exe"
timeout /t 2 /nobreak >nul

REM Khởi động Road Server từ GameSrc
echo [3/3] Starting Road Server (Dev)...
start "Road Server Dev" /D "%~dp0Server\GameSrc\Road.Service\bin\Debug" "%~dp0Server\GameSrc\Road.Service\bin\Debug\Road.Service.exe"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   Đã khởi động thành công 3 dev servers!
echo ========================================
echo   - Center Server (Dev)
echo   - Fighting Server (Dev)
echo   - Road Server (Dev)
echo ========================================
echo.
echo Cửa sổ này sẽ tự động đóng sau 3 giây...
timeout /t 3 /nobreak >nul
exit
