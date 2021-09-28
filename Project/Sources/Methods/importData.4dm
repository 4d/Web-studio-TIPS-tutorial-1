//%attributes = {"invisible":true}


TRUNCATE TABLE:C1051([Students:2])
SET DATABASE PARAMETER:C642([Students:2]; Table sequence number:K37:31; 0)

TRUNCATE TABLE:C1051([Schools:3])
SET DATABASE PARAMETER:C642([Schools:3]; Table sequence number:K37:31; 0)

TRUNCATE TABLE:C1051([Courses:4])
SET DATABASE PARAMETER:C642([Courses:4]; Table sequence number:K37:31; 0)

TRUNCATE TABLE:C1051([Attending:5])
SET DATABASE PARAMETER:C642([Attending:5]; Table sequence number:K37:31; 0)

var $text : Text
var $coll : Collection
var $schools : cs:C1710.SchoolsSelection
var $courses : cs:C1710.CoursesSelection
var $students : cs:C1710.StudentsSelection
var $attending : cs:C1710.AttendingSelection

$text:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"Schools.txt")
$coll:=JSON Parse:C1218($text)
$schools:=ds:C1482.Schools.fromCollection($coll)

$text:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"Courses.txt")
$coll:=JSON Parse:C1218($text)
$courses:=ds:C1482.Courses.fromCollection($coll)

$text:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"Attending.txt")
$coll:=JSON Parse:C1218($text)
$attending:=ds:C1482.Attending.fromCollection($coll)

$text:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"Students.txt")
$coll:=JSON Parse:C1218($text)
$students:=ds:C1482.Students.fromCollection($coll)

//initStorage
