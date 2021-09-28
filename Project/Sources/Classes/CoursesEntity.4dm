Class extends Entity


exposed Function get students
	
	var $0 : cs.StudentsSelection
	
	$0:=This.attendedBy.student


exposed Function get numberOfAttendees->$result : Integer
	$result:=This.attendedBy.length