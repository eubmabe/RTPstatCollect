@echo off

REM Set global variables
set TPscriptConf=TPscriptConf.txt
set trace_time=60
set version=0.12

echo Running following script file: %0

REM Find path to tshark.exe since it is typically not included in PATH variable
if exist %TPscriptConf% (
    echo %TPscriptConf% file found
) else (
    echo %TPscriptConf% not found a new file created
    dir /s /b \tshark.exe > %TPscriptConf%
)

REM Make sure only one path listed to avoid issues with multiple installations etc..
set cnf_count=0
for /f %%a in (%TPscriptConf%) do set /a cnf_count+=1

if not %cnf_count% == 1 (
    echo %noFiles% rows found in %TPscriptConf%
    echo More than one path to tshark is listed in %TPscriptConf%!!!
    echo Edit %TPscriptConf% and keep only one valid path and remove any CR/LF 
    pause 
    goto exit)

set /p TSHARKcommand=<%TPscriptConf%

REM Make a time stamp
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set time_stamp=%date%_%hour%%min%%secs%

REM Create result directory
mkdir %time_stamp%

REM Store version information
echo %version% > .\%time_stamp%\version.txt
dir %0 >> .\%time_stamp%\version.txt
"%TSHARKcommand%" -v >> .\%time_stamp%\version.txt

REM Start one command window for each interface
echo Trace started using %TSHARKcommand% on all available interfaces!!!
FOR /f "tokens=1 delims=." %%G IN ('"%TSHARKcommand%" -D') DO (
 echo Starting Tshark on interface %%G for %trace_time% seconds
 start TSHARK.bat "%TSHARKcommand%" .\%time_stamp%\RTPstat_%%G.txt %trace_time% %%G
)

echo Collecting information on available interfaces
ipconfig > .\%time_stamp%\ipconf.txt
"%TSHARKcommand%" -D >> .\%time_stamp%\ipconf.txt

echo Collecting computer statistics
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '.\getInfo.ps1'" > .\%time_stamp%\psStat.txt

echo Script done!!! Tracing executed in separate process.
timeout %trace_time%

:exit