
If (btnTrace)
	TRACE:C157
End if 


Case of 
		
	: (Form event code:C388=On Selection Change:K2:29)
		OBJECT SET ENABLED:C1123(*; "CheckBoxViewAll"; Form:C1466.selectedSchool#Null:C1517)
		Form:C1466.viewAll:=False:C215
		
		If (Form:C1466.selectedSchool#Null:C1517)
			Form:C1466.schoolInfo:=Form:C1466.selectedSchool.info()
			Form:C1466.studentsAttending:=Form:C1466.selectedSchool.courses.first().students()
			CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.selectedSchool.courses.first(); Form:C1466.selectedSchool.courses; "LBCourses")
		Else 
			Form:C1466.schoolInfo:=Null:C1517
			Form:C1466.studentsAttending:=Null:C1517
		End if 
		
End case 
