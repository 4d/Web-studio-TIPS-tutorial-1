Class extends DataStoreImplementation


exposed Function getName
	var $0 : Text
	
	$0:="Schools and their students"
	
	
exposed Function getStatistics
	
	var $0; $result : Collection
	var $obj : Object
	var $school : cs:C1710.SchoolsEntity
	
	$result:=New collection:C1472()
	
	For each ($school; This:C1470.Schools.all())
		$obj:=New object:C1471
		$obj.name:=$school.name
		$obj.city:=$school.city
		$obj.numberOfStudents:=$school.courses.attendedBy.student.length
		$result.push($obj)
	End for each 
	
	$0:=$result
	
	