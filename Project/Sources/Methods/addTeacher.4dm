//%attributes = {}


var $teacher : cs:C1710.TeachersEntity
var $status : Object

$teacher:=ds:C1482.Teachers.new()
$teacher.lastname:="Smith"
$status:=$teacher.save()