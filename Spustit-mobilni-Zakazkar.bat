@echo off
setlocal
set "NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
set "SERVER=%~dp0server.js"
if not exist "%SERVER%" (
  echo Soubor server.js nebyl nalezen.
  pause
  exit /b 1
)
if not exist "%NODE%" (
  for /f "delims=" %%N in ('where node 2^>nul') do if not defined NODE_FOUND set "NODE_FOUND=%%N"
  if defined NODE_FOUND set "NODE=%NODE_FOUND%"
)
if not exist "%NODE%" (
  echo Nepodarilo se najit Node.js.
  pause
  exit /b 1
)
set "PORT=8766"
echo Spoustim mobilniho Zakazkare na http://127.0.0.1:8766/
start "" /b "%NODE%" "%SERVER%"
timeout /t 3 /nobreak >nul
start "" "http://127.0.0.1:8766/"
echo Serverove okno nechte otevrene. Aplikace se otevre v prohlizeci.
pause
