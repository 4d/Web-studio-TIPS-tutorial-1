//%attributes = {}

//var$student;$newStudent : cs:C1710.StudentsEntity
//var$students;$students1;$students2 : cs:C1710.StudentsSelection

//C_OBJECT($status; $students1; $students2; $newStudent)
//var$status : Object

//$students:=ds.Students.query("extraInfo.hobbies[a].name=:1 and extraInfo.hobbies[a].level=:2"; "Horse riding"; 2)


//$students1:=ds.Students.query("hobbies is not null")

//$students1:=ds.Students.query("birthDate < :1 and hobbies.fitness =:2"; "!01/01/2002!"; True)

//$newStudent:=ds.Students.new()
//$newStudent.firstname:="Mary"
////.. Fill the entity
//$status:=$newStudent.save()

////We don't want to update $students1 entity selection, so we copy it to add a new student
//$students2:=$students1.copy()
//$students2.add($newStudent)


//$student:=ds.Students.new()
//$student.extraInfo:=New object()
//$student.extraInfo.hobbies:=New collection()

//$hobby:=New object()
//$hobby.name:="Horse riding"
//$hobby.level:=2
//$student.extraInfo.hobbies.push($hobby)

//$hobby:=New object()
//$hobby.name:="Classic music"
//$hobby.level:=3
//$student.extraInfo.hobbies.push($hobby)

//$hobby:=New object()
//$hobby.name:="Singing"
//$hobby.level:=2
//$student.extraInfo.hobbies.push($hobby)

//$status:=$student.save()


//$student:=ds.Students.new()
//$student.extraInfo:=New object()
//$student.extraInfo.hobbies:=New collection()

//$hobby:=New object()
//$hobby.name:="Horse riding"
//$hobby.level:=3
//$student.extraInfo.hobbies.push($hobby)

//$hobby:=New object()
//$hobby.name:="Reading"
//$hobby.level:=2
//$student.extraInfo.hobbies.push($hobby)

//$hobby:=New object()
//$hobby.name:="Singing"
//$hobby.level:=4
//$student.extraInfo.hobbies.push($hobby)

//$status:=$student.save()



$coll:=ds:C1482.Schools.all().toCollection()
$text:=JSON Stringify:C1217($coll)
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"Schools.txt"; $text)

$coll:=ds:C1482.Courses.all().toCollection()
$text:=JSON Stringify:C1217($coll)
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"Courses.txt"; $text)

$coll:=ds:C1482.Attending.all().toCollection()
$text:=JSON Stringify:C1217($coll)
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"Attending.txt"; $text)

$coll:=ds:C1482.Students.all().toCollection()
$text:=JSON Stringify:C1217($coll)
TEXT TO DOCUMENT:C1237(Get 4D folder:C485(Current resources folder:K5:16)+"Students.txt"; $text)