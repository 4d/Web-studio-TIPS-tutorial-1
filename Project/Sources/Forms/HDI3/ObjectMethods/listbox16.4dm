




Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedStudent#Null:C1517)
			Form:C1466.attendedCourses:=Form:C1466.selectedStudent.attendedCourses()
			Form:C1466.notAttendedCourses:=Form:C1466.selectedStudent.notAttendedCourses()
		Else 
			Form:C1466.attendedCourses:=Null:C1517
			Form:C1466.notAttendedCourses:=Null:C1517
		End if 
		
		OBJECT SET VISIBLE:C603(*;"CoursesTitle@";Form:C1466.selectedStudent#Null:C1517)
		
		enableAddRemoveButtons
End case 