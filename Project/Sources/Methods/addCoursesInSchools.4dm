//%attributes = {"invisible":true}

C_COLLECTION:C1488($oldSchool; $historyInstitute; $4DUniversity; $mathSchool)
C_OBJECT:C1216($school; $status; $course)
C_TEXT:C284($courseName)


//$schoolNames:=New collection("Old school"; "History Institute"; "4D University"; "Math school")

$oldSchool:=New collection:C1472("Sewing"; "Ballroom dance"; "Latin"; "Greek")
$historyInstitute:=New collection:C1472("Art history"; "Geology"; "Prehistory"; "Ancient history")
$4DUniversity:=New collection:C1472("Classic 4D"; "ORDA"; "View Pro"; "Write Pro")
$mathSchool:=New collection:C1472("Trigonometry"; "Geometry"; "Physics"; "Arithmetic")

TRUNCATE TABLE:C1051([Courses:4])
SET DATABASE PARAMETER:C642([Courses:4]; Table sequence number:K37:31; 0)

For each ($school; ds:C1482.Schools.all())
	
	//$school:=ds.Schools.query("name=:1"; $name).first()
	
	Case of 
		: ($school.name="Old school")
			For each ($courseName; $oldSchool)
				$course:=ds:C1482.Courses.new()
				$course.name:=$courseName
				$course.school:=$school
				$status:=$course.save()
			End for each 
			
		: ($school.name="History Institute")
			For each ($courseName; $historyInstitute)
				$course:=ds:C1482.Courses.new()
				$course.name:=$courseName
				$course.school:=$school
				$status:=$course.save()
			End for each 
			
		: ($school.name="4D University")
			For each ($courseName; $4DUniversity)
				$course:=ds:C1482.Courses.new()
				$course.name:=$courseName
				$course.school:=$school
				$status:=$course.save()
			End for each 
			
		: ($school.name="Math school")
			For each ($courseName; $mathSchool)
				$course:=ds:C1482.Courses.new()
				$course.name:=$courseName
				$course.school:=$school
				$status:=$course.save()
			End for each 
			
	End case 
	
End for each 

