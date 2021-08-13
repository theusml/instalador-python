@echo off
set ActualDiretory=%CD%
for /R "%ActualDiretory%" %%F in (*.py) do set FileName=%%~nF

cd %APPDATA%\robos_python\venv\Scripts

python.exe "%ActualDiretory%\%FileName%.py"
exit
