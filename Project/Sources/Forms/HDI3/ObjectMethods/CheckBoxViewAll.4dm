

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Form:C1466.viewAll=True:C214)
			LISTBOX SELECT ROWS:C1715(*; "LBCourses"; Form:C1466.selectedSchool.courses; lk replace selection:K53:1)
			Form:C1466.studentsAttending:=Form:C1466.selectedCourses.students()
		Else 
			LISTBOX SELECT ROWS:C1715(*; "LBCourses"; Form:C1466.ds.Courses.newSelection(); lk replace selection:K53:1)
			Form:C1466.studentsAttending:=Null:C1517
		End if 
End case 