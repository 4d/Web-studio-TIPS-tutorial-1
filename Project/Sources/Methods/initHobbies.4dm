//%attributes = {}

#DECLARE ($student : Object)

var $hobby : Text

If ($student.hobbies=Null:C1517)
	$student.hobbies:=New object:C1471()
	$student.hobbies["horse riding"]:=False:C215
	$student.hobbies["reading"]:=False:C215
	$student.hobbies["cycling"]:=False:C215
	$student.hobbies["singing"]:=False:C215
	$student.hobbies["fitness"]:=False:C215
	$student.hobbies["classic music"]:=False:C215
Else 
	For each ($hobby; $student.hobbies)
		$student.hobbies[$hobby]:=Bool:C1537($student.hobbies[$hobby])
	End for each 
End if 
