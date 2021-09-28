//%attributes = {"invisible":true}

If (btnTrace)
	TRACE:C157
End if 

OBJECT SET ENABLED:C1123(*; "QuitSchool"; False:C215)

If (__AND(Formula:C1597(Form:C1466.attendedSchools#Null:C1517); Formula:C1597(Form:C1466.selectedSchools#Null:C1517); Formula:C1597(Form:C1466.selectedSchools.length#0)))
	OBJECT SET ENABLED:C1123(*; "QuitSchool"; True:C214)
End if 


