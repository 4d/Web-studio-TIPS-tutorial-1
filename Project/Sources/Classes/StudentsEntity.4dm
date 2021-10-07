Class extends Entity


local exposed Function age
	var $0; $result : Integer
	
	If (This:C1470.birthDate#!00-00-00!)
		$result:=Year of:C25(Current date:C33)-Year of:C25(This:C1470.birthDate)
	Else 
		$result:=Null:C1517
	End if 
	$0:=$result
	
	
	//exposed Function attendedCourses
	//var $0 : cs.CoursesSelection
	
	//$0:=This.attends.course
	
exposed Function notAttendedCourses
	var $0; $studentCourses; $allCourses : cs:C1710.CoursesSelection
	
	$studentCourses:=This:C1470.attends.course
	$allCourses:=ds:C1482.Courses.all()
	$0:=$allCourses.minus($studentCourses)
	
exposed Function attendsTo
	var $0 : cs:C1710.StudentsEntity
	var $1; $courses : cs:C1710.CoursesSelection
	var $course : cs:C1710.CoursesEntity
	var $attending : cs:C1710.AttendingEntity
	var $status : Object
	
	$courses:=$1
	
	For each ($course; $courses)
		$attending:=ds:C1482.Attending.new()
		$attending.course:=$course
		$attending.student:=This:C1470
		$status:=$attending.save()
	End for each 
	This:C1470.reload()
	$0:=This:C1470
	
	
exposed Function cancelAtttendance
	var $1; $courses : cs:C1710.CoursesSelection
	var $attending; $notDropped : cs:C1710.AttendingSelection
	var $status : Object
	var $0 : cs:C1710.StudentsEntity
	var $queryString; $primaryKey : Text
	
	$courses:=$1
	
	$primaryKey:=$courses.getDataClass().getInfo().primaryKey
	
	$queryString:="course."+$primaryKey+" in :1"
	$attending:=This:C1470.attends.query($queryString; $courses.getPrimaryKeys())
	
	$notDropped:=$attending.drop()
	
	This:C1470.reload()
	$0:=This:C1470
	
	
exposed Function update
	var $status; $0 : Object
	
	$status:=checkStudent(This:C1470)
	
	If ($status.success)
		$status:=This:C1470.save()
	End if 
	
	$0:=$status
	
	
exposed Function quitSchool
	var $1; $school : cs:C1710.SchoolsSelection
	var $schoolsAttends; $studentAttends; $intersect; $notDropped : cs:C1710.AttendingSelection
	var $0 : cs:C1710.CoursesSelection
	
	$school:=$1
	
	$schoolsAttends:=$school.courses.attendedBy
	$studentAttends:=This:C1470.attends
	$intersect:=$schoolsAttends.and($studentAttends)
	
	If ($intersect#Null:C1517)
		$notDropped:=$intersect.drop()
	End if 
	
	$0:=This:C1470.attendedCourses()
	
exposed Function get fullname()->$result : Text
	$result:=This:C1470.firstname+" "+This:C1470.lastname
	
exposed Function get drivingLicenseAsString()->$result : Text
	$result:=Choose:C955(This:C1470.hasDrivingLicence=True:C214; "Yes", ; "No")
	