

If (btnTrace)
	TRACE:C157
End if 

var $updatedStudent : Object

$updatedStudent:=Form:C1466.selectedStudent.attendsTo(Form:C1466.toAdd)
Form:C1466.availableCourses:=$updatedStudent.notAttendedCourses()
Form:C1466.registeredCourses:=$updatedStudent.attendedCourses()

Form:C1466.toAdd:=Null:C1517
enableAddRemoveButtons
