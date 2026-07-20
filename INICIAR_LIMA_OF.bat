@echo off
title LIMA - OF
cd /d "%~dp0"

if not exist "index.html" (
  echo ERROR: no encuentro index.html en esta carpeta.
  echo Este .bat debe estar en la MISMA carpeta que index.html
  pause
  exit /b
)

echo Iniciando LIMA - OF...
echo.

start "" cmd /c "timeout /t 2 >nul & start http://localhost:5500/index.html"

python -m http.server 5500 2>nul
if %errorlevel% neq 0 (
  echo.
  echo "python" no funciono, probando con py...
  py -m http.server 5500 2>nul
)
if %errorlevel% neq 0 (
  echo.
  echo Ni python ni py funcionaron. Probando con Node...
  npx --yes serve -l 5500 .
)

pause
