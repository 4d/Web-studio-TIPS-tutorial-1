//%attributes = {}
C_OBJECT:C1216($template; $status; $student; $attending)
C_LONGINT:C283($yearOffset; $monthOffset; $dayOffset; $i)
C_LONGINT:C283($studentIndex; $rank1; $rank2)
C_LONGINT:C283($pkCourse1; $pkCourse2; $index)
C_OBJECT:C1216($course1; $course2; $school)

C_COLLECTION:C1488($hobbies)


TRUNCATE TABLE:C1051([Attending:5])
SET DATABASE PARAMETER:C642([Attending:5]; Table sequence number:K37:31; 0)

TRUNCATE TABLE:C1051([Students:2])
SET DATABASE PARAMETER:C642([Students:2]; Table sequence number:K37:31; 0)

$hobbies:=New collection:C1472("classic music"; "horse riding"; "singing"; "reading"; "cycling"; "fitness")

$femalePhotoFolder:=Folder:C1567("/RESOURCES/femalefaces/")
$malePhotoFolder:=Folder:C1567("/RESOURCES/malefaces/")

$femalePhotoFiles:=$femalePhotoFolder.files()
$malePhotoFiles:=$malePhotoFolder.files()

$fcount:=$femalePhotoFiles.length
$mcount:=$malePhotoFiles.length

FakeData_ArraysInit

$template:=New object:C1471()
$template.firstname:="firstname"
$template.lastname:="lastname"
$template.state:="state"
$template.city:="city"
$template.zipCode:="zipCode"
$template.country:="country"
$template.address:="address"
$template.phone:="phone"
$template.email:="email"
$template.suffix:="suffix"
$template.tempGender:="gender"

For ($i; 1; 1000)
	$student:=ds:C1482.Students.new()
	
	FakeData_FillObjectTemplate($template; $student)
	
	If (Length:C16($student.zipCode)<=4)
		$student.zipCode:="0"+$student.zipCode
	End if 
	
	$maxAge:=30
	$minAge:=17
	
	$min:=Year of:C25(Current date:C33)-$maxAge
	$max:=Year of:C25(Current date:C33)-$minAge
	$year:=(Random:C100%($max-$min+1))+$min
	
	$month:=(Random:C100%(12))+1
	$day:=(Random:C100%(28))+1
	
	$s:=String:C10($year; "0000")+"-"+String:C10($month; "00")+"-"+String:C10($day; "00")+"T00:00:00"
	$date:=Date:C102($s)
	$student.birthDate:=$date
	$student.studentID:=$i
	
	If (Mod:C98($i; 5)=0)
		initHobbies_TO_DELETE($student; $hobbies)
	End if 
	
	$student.gender:=Choose:C955($student.tempGender=True:C214; "Female"; "Male")
	
	If ($student.gender="Female")
		$pos:=Random:C100%$fcount
		$file:=$femalePhotoFiles[$pos]
	Else 
		$pos:=Random:C100%$mcount
		$file:=$malePhotoFiles[$pos]
	End if 
	$student.photo:=$file.path
	
	If (Mod:C98($i; 3)=0)
		$student.hasDrivingLicence:=True:C214
	End if 
	
	If (Mod:C98($i; 4)=0)
		$student.hasDrivingLicence:=False:C215
	End if 
	
	$status:=$student.save()
End for 


// Attending
$studentIndex:=0
$pkCourse1:=1
$pkCourse2:=16
$course1:=ds:C1482.Courses.get($pkCourse1)
$course2:=ds:C1482.Courses.get($pkCourse2)

For each ($student; ds:C1482.Students.all())
	//course 1
	$attending:=ds:C1482.Attending.new()
	$attending.student:=$student
	$attending.course:=$course1
	$status:=$attending.save()
	
	//course 2
	$attending:=ds:C1482.Attending.new()
	$attending.student:=$student
	$attending.course:=$course2
	$status:=$attending.save()
	
	$studentIndex:=$studentIndex+1
	
	If ($studentIndex=4)
		$studentIndex:=0
		$pkCourse1:=$pkCourse1+1
		$pkCourse2:=$pkCourse2-1
		$course1:=ds:C1482.Courses.get($pkCourse1)
		$course2:=ds:C1482.Courses.get($pkCourse2)
	End if 
End for each 

FakeData_ArraysDeinit


