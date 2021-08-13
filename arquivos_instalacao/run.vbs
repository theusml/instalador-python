' ------------------------
' Autor: Matheus Lotufo
' ------------------------
Set sh = WScript.CreateObject("WScript.Shell")
sh.Popup "Iniciando. Por favor, aguarde...", 5
sh.Run "cmd /c cd %cd% & run.bat", 0, True
