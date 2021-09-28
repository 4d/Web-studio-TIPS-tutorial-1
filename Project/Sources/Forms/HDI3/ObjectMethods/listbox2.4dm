
If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedStudent#Null:C1517)
			Form:C1466.attendedCourses:=Form:C1466.selectedStudent.attendedCourses()
		Else 
			Form:C1466.attendedCourses:=Null:C1517
		End if 
End case 