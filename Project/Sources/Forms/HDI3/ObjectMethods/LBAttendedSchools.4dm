
If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedSchools#Null:C1517)
			Form:C1466.attendedCourses:=Form:C1466.studentCourses.and(Form:C1466.selectedSchools.courses)
		Else 
			Form:C1466.attendedCourses:=Null:C1517
		End if 
		enableQuitSchoolButton
End case 

