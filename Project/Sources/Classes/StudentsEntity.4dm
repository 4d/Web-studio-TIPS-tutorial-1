Class extends Entity


local exposed Function age
	var $0; $result : Integer
	
	If (This.birthDate#!00-00-00!)
		$result:=Year of(Current date)-Year of(This.birthDate)
	Else 
		$result:=Null
	End if 
	$0:=$result
	
	
exposed Function attendedCourses
	var $0 : cs.CoursesSelection
	
	$0:=This.attends.course
	
exposed Function notAttendedCourses
	var $0; $studentCourses; $allCourses : cs.CoursesSelection
	
	$studentCourses:=This.attends.course
	$allCourses:=ds.Courses.all()
	$0:=$allCourses.minus($studentCourses)
	
exposed Function attendsTo
	var $0 : cs.StudentsEntity
	var $1; $courses : cs.CoursesSelection
	var $course : cs.CoursesEntity
	var $attending : cs.AttendingEntity
	var $status : Object
	
	$courses:=$1
	
	For each ($course; $courses)
		$attending:=ds.Attending.new()
		$attending.course:=$course
		$attending.student:=This
		$status:=$attending.save()
	End for each 
	This.reload()
	$0:=This
	
	
exposed Function cancelAtttendance
	var $1; $courses : cs.CoursesSelection
	var $attending; $notDropped : cs.AttendingSelection
	var $status : Object
	var $0 : cs.StudentsEntity
	var $queryString; $primaryKey : Text
	
	$courses:=$1
	
	$primaryKey:=$courses.getDataClass().getInfo().primaryKey
	
	$queryString:="course."+$primaryKey+" in :1"
	$attending:=This.attends.query($queryString; $courses.getPrimaryKeys())
	
	$notDropped:=$attending.drop()
	
	This.reload()
	$0:=This
	
	
exposed Function update
	var $status; $0 : Object
	
	$status:=checkStudent(This)
	
	If ($status.success)
		$status:=This.save()
	End if 
	
	$0:=$status
	
	
exposed Function quitSchool
	var $1; $school : cs.SchoolsSelection
	var $schoolsAttends; $studentAttends; $intersect; $notDropped : cs.AttendingSelection
	var $0 : cs.CoursesSelection
	
	$school:=$1
	
	$schoolsAttends:=$school.courses.attendedBy
	$studentAttends:=This.attends
	$intersect:=$schoolsAttends.and($studentAttends)
	
	If ($intersect#Null)
		$notDropped:=$intersect.drop()
	End if 
	
	$0:=This.attendedCourses()

exposed Function get fullname()->$result : Text
	$result:=This.firstname+" "+This.lastname