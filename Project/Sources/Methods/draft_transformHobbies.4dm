//%attributes = {}

$students:=ds:C1482.Students.query("hobbies is not null")


For each ($s; $students)
	
	For each ($key; $s.hobbies)
		If ($key="horse riding")
			$s.hobbies.horseRiding:=$s.hobbies[$key]
			OB REMOVE:C1226($s.hobbies; $key)
		End if 
		If ($key="classic music")
			$s.hobbies.classicMusic:=$s.hobbies[$key]
			OB REMOVE:C1226($s.hobbies; $key)
		End if 
	End for each 
	
	$status:=$s.save()
	
End for each 
