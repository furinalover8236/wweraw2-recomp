@echo off
rem wweraw2: the project CLI (wweraw2.py). Python 3.9 or newer.
where py >nul 2>nul
if %errorlevel%==0 (
    py -3 "%~dp0wweraw2.py" %*
) else (
    python "%~dp0wweraw2.py" %*
)
exit /b %errorlevel%
