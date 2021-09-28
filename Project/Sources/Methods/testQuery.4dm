//%attributes = {}

var $tasks; $limit : Real

$students:=ds:C1482.Students.query("hobbies.cycling = true")

$students2:=ds:C1482.Students.query("hobbies.cycling = :1"; True:C214)

$s:=ds:C1482.Students.get(1)

QUERY:C277([Students:2]; [Students:2]hobbies:7; "cycling"; =; True:C214)