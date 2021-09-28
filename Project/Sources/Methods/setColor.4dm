//%attributes = {"invisible":true}




C_OBJECT:C1216($event; $0; $meta)
C_TEXT:C284($1; $what)

$what:=$1

$event:=FORM Event:C1606


Case of 
	: ($event.code=On Display Detail:K2:22)
		If ($event.isRowSelected)
			
			Case of 
				: ($what="Blue")
					$meta:=Form:C1466.lightBlue
					
				: ($what="Red")
					$meta:=Form:C1466.lightRed
					
				: ($what="Green")
					$meta:=Form:C1466.lightGreen
			End case 
			
		End if 
End case 

$0:=$meta