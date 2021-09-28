//%attributes = {}


FakeData_ArraysInit

$template:=New object:C1471()
$template.firstname:="firstname"
$template.lastname:="lastname"
$template.tempGender:="gender"

For ($i; 1; 32)
	$student:=ds:C1482.Students.new()
	
	//$template.gender:=False
	//If ()
	//$template.gender:=False
	//End if 
	
	FakeData_FillObjectTemplate($template; $student)
	
End for 