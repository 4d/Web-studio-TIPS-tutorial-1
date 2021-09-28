
If (btnTrace)
	TRACE:C157
End if 

Form:C1466.studentCourses:=Form:C1466.selectedStudent.quitSchool(Form:C1466.selectedSchools)
Form:C1466.attendedSchools:=Form:C1466.studentCourses.school

If (Form:C1466.attendedSchools.length#0)
	Form:C1466.attendedCourses:=Form:C1466.studentCourses.and(Form:C1466.attendedSchools.first().courses)
	CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.attendedSchools.first(); Form:C1466.attendedSchools; "LBAttendedSchools")
Else 
	Form:C1466.attendedCourses:=Null:C1517
End if 

enableQuitSchoolButton