//%attributes = {}


C_COLLECTION:C1488($schoolNames)
C_OBJECT:C1216($templateSchool; $school; $status)
C_TEXT:C284($name)

FakeData_ArraysInit

TRUNCATE TABLE:C1051([Schools:3])
SET DATABASE PARAMETER:C642([Schools:3]; Table sequence number:K37:31; 0)

//$schoolNames:=New collection("Old school"; "History Institute"; "4D University"; "Math school")
//$schoolNames:=$schoolNames.concat(New collection("Summerville Kindergarten"; \
"Angelwood Academy"; \
"Coral Springs Academy"; \
"Spring Hill College"; \
"Westwood Technical School"; \
"Springfield Middle School"; \
"Springfield Middle School"; \
"Ravenwood Middle School"; \
"Clearwater Technical School"))

$schoolWithCity:=initSchoolWithCity
$templateSchool:=New object:C1471
$templateSchool.phone:="phone"

$levelSchool:=New object:C1471("1"; "High "; "2"; "Intermediate "; "3"; "Primary "; "4"; "Secondary "; "5"; " Elementary"; "6"; " Middle")

$j:=1
For ($i; 1; 50)
	$school:=ds:C1482.Schools.new()
	$school.maxStudentsCapacity:=(Random:C100%91)+10
	$school.schoolID:=$i
	FakeData_FillObjectTemplate($templateSchool; $school)
	For each ($key; $schoolWithCity)
		If (ds:C1482.Schools[$key].kind="storage")
			$school[$key]:=$schoolWithCity[$key]
		End if 
	End for each 
	
	$school.name:=$levelSchool[String:C10($j)]+" school"
	$school.email:=Split string:C1554($school.name; " ").join("_")+"@acme.com"
	$j:=$j+1
	
	If (Mod:C98($i; 6)=0)
		$schoolWithCity:=initSchoolWithCity
		$j:=1
	End if 
	
	$status:=$school.save()
	
End for 

FakeData_ArraysDeinit