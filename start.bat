@echo off
chcp 65001 >nul
echo ========================================
echo   Starting GunnyArena Servers
echo ========================================
echo.

REM
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Đang yêu cầu quyền Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Đang khởi động servers với quyền Admin...
echo.

REM Khởi động Center Server
echo [1/3] Starting Center Server...
start "Center Server" /D "%~dp0Server\output\center" "%~dp0Server\output\center\Center.Service.exe"
timeout /t 2 /nobreak >nul

REM Khởi động Fighting Server
echo [2/3] Starting Fighting Server...
start "Fighting Server" /D "%~dp0Server\output\fight" "%~dp0Server\output\fight\Fighting.Service.exe"
timeout /t 2 /nobreak >nul

REM Khởi động Road Server
echo [3/3] Starting Road Server...
start "Road Server" /D "%~dp0Server\output\road" "%~dp0Server\output\road\Road.Service.exe"
timeout /t 2 /nobreak >nul

echo.
echo ========================================
echo   Đã khởi động thành công 3 servers!
echo ========================================
echo   - Center Server
echo   - Fighting Server
echo   - Road Server
echo ========================================
echo.
echo Cửa sổ này sẽ tự động đóng sau 3 giây...
timeout /t 3 /nobreak >nul
exit

