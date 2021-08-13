' ------------------------
' Autor: Matheus Lotufo - matheus.lotufo@itau-unibanco.com
' ------------------------
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")  
Set folder = fso.GetFolder(sh.CurrentDirectory)  

For each file In folder.Files     
    If (Right(file, 2) = "py") Then
      
      Set shortcut = sh.CreateShortcut(sh.SpecialFolders("Desktop") & "\" & fso.GetFileName(file) & ".lnk")
      shortcut.IconLocation = sh.CurrentDirectory & "\icon.ico"
      shortcut.TargetPath = sh.CurrentDirectory & "\run.vbs"
      shortcut.WorkingDirectory = sh.CurrentDirectory
      shortcut.Save

        Exit For
    End If
Next
