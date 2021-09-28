Class extends Entity


exposed Function info
	
	var $0; $result : Object
	var $course : cs:C1710.CoursesEntity
	var $student : cs:C1710.StudentsEntity
	
	
	$result:=New object:C1471
	$result.ageAverage:=This:C1470.courses.attendedBy.student.ageAverage()
	
	$student:=This:C1470.courses.attendedBy.student.orderBy("birthDate").first()
	$result.oldestStudent:=$student.firstname+" "+$student.lastname+" ("+String:C10($student.age())+")"
	
	$student:=This:C1470.courses.attendedBy.student.orderBy("birthDate desc").first()
	$result.youngestStudent:=$student.firstname+" "+$student.lastname+" ("+String:C10($student.age())+")"
	
	//Hobbies
	$result.hobbies:=This:C1470.courses.attendedBy.student.hobbiesList().distinct()
	
	$0:=$result
	
	
exposed Function attentedCourses
	
	var $1; $student : cs:C1710.StudentsEntity
	var $0 : Object
	var $studentAttending; $schoolAttending : cs:C1710.AttendingSelection
	
	$student:=$1
	
	$studentAttending:=$student.attends
	$schoolAttending:=This:C1470.courses.attendedBy
	
	$0:=$studentAttending.and($schoolAttending).course
	
	