//%attributes = {"invisible":true}

C_OBJECT:C1216($1; $element)
C_VARIANT:C1683($2; $entitySelOrColl)
C_TEXT:C284($3; $LBName)

If (btnTrace)
	TRACE:C157
End if 

$element:=$1
$entitySelOrColl:=$2
$LBName:=$3

Case of 
	: (Value type:C1509($entitySelOrColl)=Is object:K8:27)
		OBJECT SET SCROLL POSITION:C906(*; $LBName; $element.indexOf($entitySelOrColl)+1)
		LISTBOX SELECT ROWS:C1715(*; $LBName; $entitySelOrColl.getDataClass().newSelection().add($element); lk replace selection:K53:1)
		
		If ($LBName="ListBoxSchools")
			CALL FORM:C1391(Current form window:C827; "selectRow"; Form:C1466.selectedSchool.courses.first(); Form:C1466.selectedSchool.courses; "LBCourses")
		End if 
		enableQuitSchoolButton
		
		
	: (Value type:C1509($entitySelOrColl)=Is collection:K8:32)
		OBJECT SET SCROLL POSITION:C906(*; $LBName; $entitySelOrColl.indexOf($element)+1)
		LISTBOX SELECT ROWS:C1715(*; $LBName; New collection:C1472($element); lk replace selection:K53:1)
End case 
