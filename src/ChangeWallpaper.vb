Imports System.Runtime.InteropServices

Public Module ChangeWallpaper
    Public Declare Unicode Function SystemParametersInfoW Lib "user32" (ByVal uAction As Integer, ByVal uParam As Integer, ByVal lpvParam As String, ByVal fuWinIni As Integer) As Integer
    Public Const SPI_SETDESKWALLPAPER = 20
    Public Const SPIF_SENDWININICHANGE = &H2
    Public Const SPIF_UPDATEINIFILE = &H1

Public Sub Main()
    Dim Ret as Integer
    Dim FName As String
    'Fname = "C:\Windows\Web\Wallpaper\Theme1\img1.jpg"
    'This below line which is commented out takes a filename on the command line
    FName = Replace(Command(), """", "")

    Ret = SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, FName, SPIF_SENDWININICHANGE + SPIF_UPDATEINIFILE)
    If Ret = 0 Then Msgbox(err.lastdllerror)
End Sub

End Module