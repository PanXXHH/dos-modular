@echo off
set RunnerName=runner_temp
set EnterSige=.\header\entersige
echo ::%RunnerName%>.\%RunnerName%.bat
::header
type .\header\statement.dosblock.bat>>%RunnerName%.bat
type %EnterSige%>>%RunnerName%.bat
type .\header\define.dosblock.bat>>%RunnerName%.bat
type %EnterSige%>>%RunnerName%.bat

for /f "delims= " %%a in (.\public\links.conf) do (
type .\public\%%a>>%RunnerName%.bat
)
start /wait/b cmd /c %RunnerName%.bat
del %RunnerName%.bat