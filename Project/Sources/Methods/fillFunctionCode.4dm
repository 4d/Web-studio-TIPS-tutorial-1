//%attributes = {"invisible":true}

C_LONGINT:C283($page; $1)
C_TEXT:C284($class; $2)
C_BOOLEAN:C305($sizeMax)

$page:=$1
$class:=$2

OBJECT SET VISIBLE:C603(*; "AdditionalInfo@"; False:C215)
$sizeMax:=True:C214

Case of 
	: ($page=3)
		Form:C1466.title:="StudentsEntity class"
		Form:C1466.content:=_TabLineCode{7}
		
	: ($page=4)
		Form:C1466.title:="Students class"
		Form:C1466.content:=_TabLineCode{12}
		Form:C1466.additionalInfo:=_TabLineCode{21}
		Form:C1466.additionalInfoTitle:="checkStudent method"
		OBJECT SET VISIBLE:C603(*; "AdditionalInfo@"; True:C214)
		$sizeMax:=False:C215
		
	: (($page=5) & (($class="SchoolsEntity") | ($class="")))
		Form:C1466.title:="SchoolsEntity class"
		Form:C1466.content:=_TabLineCode{11}
		Form:C1466.additionalInfo:=_TabLineCode{17}
		Form:C1466.additionalInfoTitle:="StudentsSelection class"
		OBJECT SET VISIBLE:C603(*; "AdditionalInfo@"; True:C214)
		$sizeMax:=False:C215
		
	: (($page=5) & ($class="CoursesSelection"))
		Form:C1466.title:="CoursesSelection class"
		Form:C1466.content:=_TabLineCode{10}
		
	: ($page=6)
		Form:C1466.title:="StudentsEntity class"
		Form:C1466.content:=_TabLineCode{15}
		
	: ($page=7)
		Form:C1466.title:="StudentsEntity class"
		Form:C1466.content:=_TabLineCode{20}
		
	Else 
		Form:C1466.title:=""
		Form:C1466.content:=""
		Form:C1466.additionalInfo:=""
		Form:C1466.additionalInfoTitle:=""
End case 

//form  objects "sizeMax" & "sizeMin" are "invisible" rectangles in page zero
If ($sizeMax)
	OBJECT GET COORDINATES:C663(*; "sizeMax"; $x1; $y1; $x2; $y2)
Else 
	OBJECT GET COORDINATES:C663(*; "sizeMin"; $x1; $y1; $x2; $y2)
End if 

OBJECT SET COORDINATES:C1248(*; "ClassContent"; $x1; $y1; $x2; $y2)

