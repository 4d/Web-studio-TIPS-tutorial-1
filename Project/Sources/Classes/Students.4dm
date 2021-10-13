Class extends DataClass

exposed Function search($search : Text)->$result : cs:C1710.StudentsSelection
	
	$search:="@"+$search+"@"
	
	$result:=This:C1470.query("firstname = :1 or lastname = :1"; $search)
	
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	//
	
	
exposed Function registerNewStudent
	var $1; $student; $status; $0 : Object
	var $studentEntity : cs:C1710.StudentsEntity
	
	$student:=$1
	$status:=checkStudent($student)
	$0:=$status
	
	If ($status.success)
		$studentEntity:=This:C1470.new()
		$studentEntity.fromObject($student)
		$studentEntity.studentID:=This:C1470.computeStudentID()
		$status:=$studentEntity.save()
		If ($status.success)
			$0:=$studentEntity
		End if 
	End if 
	
	
	// This function not callable from a REST client
Function computeStudentID() : Integer
	//compute a new student Id
	Use (Storage:C1525.infos)
		Storage:C1525.infos.studentId:=Storage:C1525.infos.studentId+1
		$0:=Storage:C1525.infos.studentId
	End use 
	
	