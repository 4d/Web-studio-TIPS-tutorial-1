

If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedStudent#Null:C1517)
			Form:C1466.registeredCourses:=Form:C1466.selectedStudent.attendedCourses()
			Form:C1466.availableCourses:=Form:C1466.selectedStudent.notAttendedCourses()
		Else 
			Form:C1466.registeredCourses:=Null:C1517
			Form:C1466.availableCourses:=Null:C1517
		End if 
		
		OBJECT SET VISIBLE:C603(*; "CoursesTitle@"; Form:C1466.selectedStudent#Null:C1517)
		
		enableAddRemoveButtons
End case 