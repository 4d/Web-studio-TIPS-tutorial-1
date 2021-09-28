//%attributes = {"invisible":true}


If (btnTrace)
	TRACE:C157
End if 

OBJECT SET ENABLED:C1123(*; "SaveButton"; False:C215)

If (Form:C1466.student#Null:C1517)
	If (__AND(Formula:C1597(Form:C1466.student.firstname#Null:C1517); \
		Formula:C1597(Form:C1466.student.lastname#Null:C1517); \
		Formula:C1597(Form:C1466.student.firstname#""); \
		Formula:C1597(Form:C1466.student.lastname#""); \
		Formula:C1597(Form:C1466.student.birthDate#Null:C1517); \
		Formula:C1597(Form:C1466.student.birthDate#!00-00-00!)\
		))
		OBJECT SET ENABLED:C1123(*; "SaveButton"; True:C214)
	End if 
End if 







