
If (btnTrace)
	TRACE:C157
End if 

Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.selectedStudent#Null:C1517)
			Form:C1466.studentCourses:=Form:C1466.selectedStudent.attendedCourses()
			Form:C1466.attendedSchools:=Form:C1466.studentCourses.school
			If (Form:C1466.attendedSchools.length#0)
				Form:C1466.attendedCourses:=Form:C1466.studentCourses.and(Form:C1466.attendedSchools.first().courses)
				CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.attendedSchools.first(); Form:C1466.attendedSchools; "LBAttendedSchools")
			Else 
				Form:C1466.attendedCourses:=Null:C1517
			End if 
		Else 
			Form:C1466.studentCourses:=Null:C1517
			Form:C1466.attendedSchools:=Null:C1517
			Form:C1466.attendedCourses:=Null:C1517
		End if 
		
		enableQuitSchoolButton
		
End case 