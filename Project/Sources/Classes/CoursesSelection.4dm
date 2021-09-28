Class extends EntitySelection



exposed Function students
	
	var $0 : cs:C1710.StudentsSelection
	
	$0:=This:C1470.attendedBy.student
	
	
Function getPrimaryKeys
	
	var $0 : Collection
	
	$0:=This:C1470.ID
	