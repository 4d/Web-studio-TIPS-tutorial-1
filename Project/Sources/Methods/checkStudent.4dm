//%attributes = {"invisible":true}

var $1; $student; $0; $status : Object
var $age : Integer

$student:=$1
$status:=New object:C1471("success"; True:C214)

$age:=Year of:C25(Current date:C33)-Year of:C25(Date:C102($student.birthDate))

If (($age<15) | ($age>30))
	$status.success:=False:C215
	$status.statusText:="The student must be between 15 and 30 - This one is "+String:C10($age)
End if 

$0:=$status