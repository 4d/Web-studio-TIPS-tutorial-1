Class extends Entity


local exposed Function age
	var $0; $result : Integer
	
	If (This.birthDate#!00-00-00!)
		$result:=Year of(Current date)-Year of(This.birthDate)
	Else 
		$result:=Null
	End if 
	$0:=$result
	
	
//exposed Function attendedCourses()->$result : cs.CoursesSelection
//	$result:=This.attends.course
	
exposed Alias attendedCourses attends.course
	
exposed Function notAttendedCourses()->$result : cs.CoursesSelection
	
	$studentCourses:=This.attends.course
	$allCourses:=ds.Courses.all()
	$result:=$allCourses.minus($studentCourses)
	
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
	
exposed Function get drivingLicenseAsString()->$result : Text
	$result:=Choose(This.hasDrivingLicence=True; "Yes", ; "No")
	
	
exposed Function attendsToCourse($course : cs.CoursesEntity)->$result : cs.CoursesSelection
	
	var $currentCourses; $ordered; $attendedCourses : cs.CoursesSelection
	var $aCourse : cs.CoursesEntity
	
	$currentCourses:=This.attendedCourses()
	
	$result:=Null
	
	$ordered:=ds.Courses.newSelection(dk keep ordered)
	For each ($aCourse; $currentCourses)
		$ordered.add($aCourse)
	End for each 
	$ordered.add($course)
	
	$attending:=ds.Attending.new()
	$attending.course:=$course
	$attending.student:=This
	$status:=$attending.save()
	
	This.reload()
	$attendedCourses:=This.attendedCourses()
	
	If ($attendedCourses.length=$ordered.length)
		$result:=$ordered
	End if 
	
	
exposed Function cancelAllAttendance()->$result : cs.CoursesSelection
	
	var notDropped : cs.AttendingSelection
	
	$notDropped:=This.attends.drop()
	
	$result:=This.attendedCourses()
	
	
exposed Function hobbiesAsColl()->$result : Collection
	
	If (This.hobbies#Null)
		$result:=OB Entries(This.hobbies)
	Else 
		$result:=New collection()
	End if 