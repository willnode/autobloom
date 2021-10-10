Imports System.Diagnostics

Public Module ChangeWallpaper
    Public Sub Main()
        Dim myProcess As New Process
        myProcess.StartInfo.WindowStyle = ProcessWindowStyle.Hidden
        myProcess.StartInfo.CreateNoWindow = True
        myProcess.StartInfo.FileName = (System.AppDomain.CurrentDomain.BaseDirectory() + "run.bat")
        myProcess.Start()
    End Sub
End Module
