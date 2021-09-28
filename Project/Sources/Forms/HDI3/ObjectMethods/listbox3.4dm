

Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		OBJECT SET ENABLED:C1123(*; "CheckBoxViewAll"; Form:C1466.selectedSchool#Null:C1517)
		Form:C1466.viewAll:=False:C215
		LISTBOX SELECT ROWS:C1715(*; "LBCourses"; Form:C1466.ds.Courses.newSelection(); lk replace selection:K53:1)
		If (Form:C1466.selectedSchool#Null:C1517)
			Form:C1466.schoolInfo:=Form:C1466.selectedSchool.info()
		Else 
			Form:C1466.schoolInfo:=Null:C1517
		End if 
		
		Form:C1466.studentsAttending:=Null:C1517
End case 
