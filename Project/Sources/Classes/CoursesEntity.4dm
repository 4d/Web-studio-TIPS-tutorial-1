Class extends Entity


exposed Function attendees()->$result : cs:C1710.StudentsSelection
	$result:=This:C1470.attendedBy.student
	
	
exposed Function get numberOfAttendees()->$result : Integer
	
	//$result:=New object("numberOfAttendees"; )
	
	$result:=This:C1470.attendees().length