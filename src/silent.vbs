' cannot use Join() on Wscript.Arguments,
'   so we create an array
ReDim arr(WScript.Arguments.Count - 1)
For i = 0 To Wscript.Arguments.Count - 1
	arr(i) = """" + Wscript.Arguments(i) + """"
Next
Set objShell = WScript.CreateObject("WScript.Shell")
' new method that does not require quoting the entire commandline
'   like: wscript silent.vbs "cmd /c echo hello"
'   (the old method can still be used)
call objShell.Run(Join(arr), 0, false)
