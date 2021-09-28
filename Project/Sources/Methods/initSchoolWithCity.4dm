//%attributes = {}



$generateTemplateSchool:=New object:C1471
$generateTemplateSchool.zipCode:="zipCode"
$generateTemplateSchool.city:="city"
$generateTemplateSchool.country:="country"
$generateTemplateSchool.state:="state"
$schoolWithCity:=New object:C1471()
$schoolWithCity.zipCode:=""
$schoolWithCity.city:=""
$schoolWithCity.country:=""
$schoolWithCity.state:=""

FakeData_FillObjectTemplate($generateTemplateSchool; $schoolWithCity)

If (Length:C16($schoolWithCity.zipCode)<=4)
	$schoolWithCity.zipCode:="0"+$schoolWithCity.zipCode
End if 

$0:=$schoolWithCity