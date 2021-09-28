//%attributes = {"executedOnServer":true}

Use (Storage:C1525)
	If (Storage:C1525.infos=Null:C1517)
		Storage:C1525.infos:=New shared object:C1526("studentId"; ds:C1482.Students.all().length)
	End if 
End use 