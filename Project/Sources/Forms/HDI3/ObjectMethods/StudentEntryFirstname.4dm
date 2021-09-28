

If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		Form:C1466.student.firstname:=Get edited text:C655
		enableSaveButton
End case 