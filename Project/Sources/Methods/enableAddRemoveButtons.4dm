//%attributes = {"invisible":true}


If (btnTrace)
	TRACE:C157
End if 

OBJECT SET ENABLED:C1123(*; "AddButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "RemoveButton"; False:C215)

Case of 
		
	: (__AND(Formula:C1597(Form:C1466.toRemove#Null:C1517); Formula:C1597(Form:C1466.toRemove.length#0); Formula:C1597(Form:C1466.toAdd#Null:C1517); Formula:C1597(Form:C1466.toAdd.length#0)))
		OBJECT SET ENABLED:C1123(*; "AddButton"; False:C215)
		OBJECT SET ENABLED:C1123(*; "RemoveButton"; False:C215)
		
	: (__AND(Formula:C1597(Form:C1466.toAdd#Null:C1517); Formula:C1597(Form:C1466.toAdd.length#0)))
		OBJECT SET ENABLED:C1123(*; "AddButton"; True:C214)
		
	: (__AND(Formula:C1597(Form:C1466.toRemove#Null:C1517); Formula:C1597(Form:C1466.toRemove.length#0)))
		OBJECT SET ENABLED:C1123(*; "RemoveButton"; True:C214)
		
End case 


