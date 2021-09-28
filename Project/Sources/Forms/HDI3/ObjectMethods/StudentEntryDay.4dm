


If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On After Keystroke:K2:26)
		
		Form:C1466.day:=Get edited text:C655
		
		If (Length:C16(Form:C1466.day)>=2)
			GOTO OBJECT:C206(*;"StudentEntryMonth")
		End if 
		
		Form:C1466.student.birthDate:=Date:C102(Form:C1466.day+"/"+Form:C1466.month+"/"+Form:C1466.year)
		enableSaveButton
		
End case 