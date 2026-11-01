@echo off
setlocal
set "HOST=0.0.0.0"
set "PORT=8767"
set "APP=http://127.0.0.1:8767/mobilni-zakazkar.html"
set "NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if not exist "%NODE%" (
  set "NODE="
  for /f "delims=" %%N in ('where node 2^>nul') do if not defined NODE set "NODE=%%N"
)
if not defined NODE (
  echo CHYBI NODE.JS. Nainstalujte Node.js nebo spustte balicek v pocitaci se Zakazkarem.
  pause
  exit /b 1
)
echo Spoustim mobilni Zakazkar. Toto okno nechte otevrene.
start "" "%APP%"
"%NODE%" "%~dp0zakazkar-server.js"
echo Server byl ukoncen.
pause
