

C_OBJECT:C1216($data)

If (btnTrace)
	TRACE:C157
End if 


If (Num:C11(codeWindow)#0)
	CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276; "CoursesSelection")
Else 
	codeWindow:=Open form window:C675("FunctionCode"; Plain form window:K39:10; On the right:K39:3; At the bottom:K39:6)
	SET WINDOW TITLE:C213("Function code"; codeWindow)
	DIALOG:C40("FunctionCode"; *)
	CALL FORM:C1391(codeWindow; "fillFunctionCode"; FORM Get current page:C276)
End if 