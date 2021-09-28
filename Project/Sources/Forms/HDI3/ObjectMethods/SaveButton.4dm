

var $status : Object
var $label : Text

If (btnTrace)
	TRACE:C157
End if 

OBJECT SET VISIBLE:C603(*; "creationOK"; False:C215)
OBJECT SET VISIBLE:C603(*; "updateOK"; False:C215)
OBJECT SET VISIBLE:C603(*; "CheckFailed"; False:C215)

initHobbies(Form:C1466.student)

If (Form:C1466.action="Save")
	Form:C1466.result:=Form:C1466.ds.Students.registerNewStudent(Form:C1466.student)
	
	If (OB Class:C1730(Form:C1466.result).name="StudentsEntity")
		Form:C1466.students:=Form:C1466.ds.Students.all()
		Form:C1466.student:=Form:C1466.result
		OBJECT SET ENABLED:C1123(*; "SaveButton"; False:C215)
		OBJECT SET VISIBLE:C603(*; "creationOK"; True:C214)
		OBJECT SET ENABLED:C1123(*; "StudentEntry@"; False:C215)
		CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.student; Form:C1466.students; "ListBoxStudents")
	Else 
		OBJECT SET TITLE:C194(*; "CheckFailed"; Form:C1466.result.statusText)
		OBJECT SET VISIBLE:C603(*; "CheckFailed"; True:C214)
	End if 
	
Else 
	Form:C1466.result:=Form:C1466.student.update()
	
	If (Form:C1466.result.success)
		Form:C1466.students:=Form:C1466.students
		OBJECT SET ENABLED:C1123(*; "SaveButton"; False:C215)
		OBJECT SET VISIBLE:C603(*; "updateOK"; True:C214)
		CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.student; Form:C1466.students; "ListBoxStudents")
	Else 
		OBJECT SET TITLE:C194(*; "CheckFailed"; Form:C1466.result.statusText)
		OBJECT SET VISIBLE:C603(*; "CheckFailed"; True:C214)
	End if 
	
End if 
