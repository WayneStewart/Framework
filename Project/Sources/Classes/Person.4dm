Class constructor
	C_TEXT:C284($1)  // FirstName
	C_TEXT:C284($2)  // LastName
	C_DATE:C307($3)  // Birthdate
	
	If (nTrace=1)
		TRACE:C157
	End if 
	
	This:C1470.firstName:=$1
	This:C1470.lastName:=$2
	This:C1470.birthdate:=$3
	
Function getFullName
	C_TEXT:C284($0)
	
	If (nTrace=1)
		TRACE:C157
	End if 
	
	$0:=This:C1470.firstName+" "+Uppercase:C13(This:C1470.lastName)
	
Function getAge
	C_LONGINT:C283($0)
	
	If (nTrace=1)
		TRACE:C157
	End if 
	
	$0:=(Current date:C33-This:C1470.birthdate)/365.25
	
Function getIdentity
	C_LONGINT:C283($0)
	$0:=This:C1470.fullname+", "+This:C1470.age+" old"