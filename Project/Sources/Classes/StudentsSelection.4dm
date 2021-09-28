Class extends EntitySelection


exposed Function ageAverage
	
	var $sum; $age; $0 : Integer
	var $s : cs:C1710.StudentsEntity
	
	$sum:=0
	
	For each ($s; This:C1470)
		$age:=Choose:C955(Year of:C25($s.birthDate)#0; Year of:C25(Current date:C33)-Year of:C25($s.birthDate); 0)
		$sum:=$sum+$age
	End for each 
	
	$0:=$sum/This:C1470.length
	
	
Function hobbiesList
	var $result; $coll; $0 : Collection
	var $student : cs:C1710.StudentsEntity
	var $obj : Object
	
	$result:=New collection:C1472
	$coll:=New collection:C1472
	
	For each ($student; This:C1470)
		If ($student.hobbies#Null:C1517)
			$coll:=$coll.concat(OB Entries:C1720($student.hobbies).query("value = :1"; True:C214))
		End if 
	End for each 
	
	For each ($obj; $coll)
		$result:=$result.concat($obj.key)
	End for each 
	
	$0:=$result.distinct()