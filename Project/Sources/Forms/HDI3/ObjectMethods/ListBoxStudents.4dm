
var $label : Text

If (btnTrace)
	TRACE:C157
End if 


Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		OBJECT SET VISIBLE:C603(*; "creationOK"; False:C215)
		OBJECT SET VISIBLE:C603(*; "updateOK"; False:C215)
		OBJECT SET VISIBLE:C603(*; "CheckFailed"; False:C215)
		OBJECT SET ENABLED:C1123(*; "StudentEntry@"; False:C215)
		
		Form:C1466.student:=Form:C1466.selectedStudent
		
		initHobbies(Form:C1466.student)
		
		Form:C1466.day:=""
		Form:C1466.month:=""
		Form:C1466.year:=""
		
		If (Form:C1466.student#Null:C1517)
			OBJECT SET ENABLED:C1123(*; "StudentEntry@"; True:C214)
			OBJECT SET TITLE:C194(*; "SaveButton"; "Update")
			Form:C1466.action:="Update"
			
			Form:C1466.day:=String:C10(Day of:C23(Form:C1466.student.birthDate))
			Form:C1466.month:=String:C10(Month of:C24(Form:C1466.student.birthDate))
			Form:C1466.year:=String:C10(Year of:C25(Form:C1466.student.birthDate))
			
			enableSaveButton
		End if 
End case 