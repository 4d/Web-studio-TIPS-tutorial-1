

C_OBJECT:C1216($data)

If (btnTrace)
	TRACE:C157
End if 


If (Num:C11(codeWindow)#0)
	CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276)
Else 
	codeWindow:=Open form window:C675("FunctionCode"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE:C213("Function code"; codeWindow)
	
	//$data:=New object()
	//$data.title:="StudentsEntity class"
	//$data.content:=_TabLineCode{15}
	DIALOG:C40("FunctionCode"; *)
	CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276)
End if 