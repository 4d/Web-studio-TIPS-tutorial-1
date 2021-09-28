
If (btnTrace)
	TRACE:C157
End if 

Form:C1466.day:=""
Form:C1466.month:=""
Form:C1466.year:=""

Form:C1466.student:=New object:C1471()
initHobbies(Form:C1466.student)

OBJECT SET VISIBLE:C603(*; "creationOK"; False:C215)
OBJECT SET VISIBLE:C603(*; "updateOK"; False:C215)
OBJECT SET VISIBLE:C603(*; "CheckFailed"; False:C215)
OBJECT SET ENABLED:C1123(*; "StudentEntry@"; True:C214)

LISTBOX SELECT ROWS:C1715(*; "ListBoxStudents"; Form:C1466.ds.Students.newSelection(); lk replace selection:K53:1)

OBJECT SET TITLE:C194(*; "SaveButton"; "Save")

GOTO OBJECT:C206(*; "StudentEntryLastname")

Form:C1466.action:="Save"

enableSaveButton