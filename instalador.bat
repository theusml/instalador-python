:beggin
@echo off

rem ------------------------
rem Autor: Matheus Lotufo
rem ------------------------

echo Para continuar, confirme abaixo
echo.
set /p confirma="Confirmo que li o manual em PDF antes de usar o programa [s/n]:  "

if /i "%confirma%" NEQ "s" goto :end
echo.

set ActualDiretory=%CD%
set SysPythonFolder=C:\Program Files (x86)\Python*
for /R "%ActualDiretory%\arquivos_instalacao" %%F in (*.py) do set FileName=%%~nF

if not exist "%SysPythonFolder%" goto :nopython
if not exist "%APPDATA%\robos_python\venv" goto :novenv
if not exist "%APPDATA%\robos_python\%FileName%" goto :noinstalation
goto :normal

:nopython
echo Python nao instalado...
echo.
echo Para continuarmos com a instalacao, por favor, siga os passos abaixo:
echo.
echo 1) Abra a central de software Itau;
echo 2) No campo de pesquisa, procure por "Python";
echo 3) Baixe a ultima versao disponivel;
echo 4) Apos instalacao, abra novamanete este programa;
echo.
echo Acredita que ha algo de errado? Favor enviar um email para "matheus.lotufo@itau-unibanco.com.br".
echo.
set /p Dummy=Aperte ENTER para FINALIZAR...
exit

:novenv
echo Instalando arquvos necessarios...
echo Por favor, aguarde e nao feche a janela.
echo Local de instalacao: %APPDATA%\robos_python
echo.

if not exist "%APPDATA%\pip" mkdir "%APPDATA%\pip"
if not exist "%APPDATA%\pip\pip.ini" xcopy "%ActualDiretory%\arquivos_instalacao\pip.ini" "%APPDATA%\pip" /q /y
if not exist "%APPDATA%\robos_python" mkdir "%APPDATA%\robos_python"

cd "%SysPythonFolder%"
python.exe -m venv "%APPDATA%\robos_python\venv"

mkdir "%APPDATA%\robos_python\%FileName%"
xcopy "%ActualDiretory%\arquivos_instalacao\*.*" "%APPDATA%\robos_python\%FileName%" /q /y
xcopy "%ActualDiretory%\arquivos_instalacao\%FileName%.py" "%APPDATA%\robos_python\%FileName%" /q /y

cd "%APPDATA%\robos_python\%FileName%"

start shortcut.vbs
start run.vbs

rem CUIDADO ABAIXO ------------------------
set contador=0
for %%A in ("%ActualDiretory%\*") do set /a contador+=1

rem TRAVA
if %contador%==2 rmdir "%ActualDiretory%" /s /q
rem FIM CUIDADO ---------------------------
exit

:noinstalation
echo Sem instalacao...

mkdir "%APPDATA%\robos_python\%FileName%"
xcopy "%ActualDiretory%\arquivos_instalacao\*.*" "%APPDATA%\robos_python\%FileName%" /q /y
xcopy "%ActualDiretory%\arquivos_instalacao\%FileName%.py" "%APPDATA%\robos_python\%FileName%" /q /y

cd "%APPDATA%\robos_python\%FileName%"
start shortcut.vbs
start run.vbs


rem CUIDADO ABAIXO ------------------------
set contador=0
for %%A in ("%ActualDiretory%\*") do set /a contador+=1

rem TRAVA
if %contador%==2 rmdir "%ActualDiretory%" /s /q
rem FIM CUIDADO ---------------------------
exit

:normal
echo Carregando...
cd "%APPDATA%\robos_python\%FileName%"
start shortcut.vbs
start run.vbs

rem CUIDADO ABAIXO ------------------------
set contador=0
for %%A in ("%ActualDiretory%\*") do set /a contador+=1

rem TRAVA
if %contador%==2 rmdir "%ActualDiretory%" /s /q
rem FIM CUIDADO ---------------------------
exit

:end
echo Nao autorizado
echo.
set /p Dummy=Aperte ENTER para FINALIZAR...
exit
