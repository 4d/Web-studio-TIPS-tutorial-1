//%attributes = {}


var $1; $student : cs:C1710.StudentsEntity
var $2; $hobbies : Collection

$student:=$1
$hobbies:=$2

$index:=(Random:C100%62)+0

$student.hobbies:=New object:C1471()
$student.hobbies["horse riding"]:=False:C215
$student.hobbies["reading"]:=False:C215
$student.hobbies["cycling"]:=False:C215
$student.hobbies["singing"]:=False:C215
$student.hobbies["fitness"]:=False:C215
$student.hobbies["classic music"]:=False:C215

$has32:=$index-32
If (($has32>=0) & (Not:C34($has32<0)))
	$student.hobbies[$hobbies[5]]:=True:C214
	$index:=$index-32
End if 

$has16:=$index-16
If (($has16>=0) & (Not:C34($has16<0)))
	$student.hobbies[$hobbies[4]]:=True:C214
	$index:=$index-16
End if 

$has8:=$index-8
If (($has8>=0) & (Not:C34($has8<0)))
	$student.hobbies[$hobbies[3]]:=True:C214
	$index:=$index-8
End if 

$has4:=$index-4
If (($has4>=0) & (Not:C34($has4<0)))
	$student.hobbies[$hobbies[2]]:=True:C214
	$index:=$index-4
End if 

$has2:=$index-2
If (($has2>=0) & (Not:C34($has2<0)))
	$student.hobbies[$hobbies[1]]:=True:C214
	$index:=$index-2
End if 

$has1:=$index-1
If (($has1>=0) & (Not:C34($has1<0)))
	$student.hobbies[$hobbies[0]]:=True:C214
	$index:=$index-1
End if 