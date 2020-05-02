Class extends Object


Class constructor
	C_OBJECT:C1216($1)
	If ($1.title#Null:C1517)
		This:C1470.title:=$1.title
	Else 
		This:C1470.title:=""
	End if 
	
	If ($1.style#Null:C1517)
		This:C1470.style:=$1.style
	Else 
		This:C1470.style:=Plain form window:K39:10
	End if 
	
	If ($1.closeBox#Null:C1517)
		This:C1470.closeBox:=$1.closeBox
	Else 
		This:C1470.closeBox:=False:C215
	End if 
	
	
Function Title
	C_TEXT:C284($1;$0)
	If (Count parameters:C259=1)
		This:C1470.title:=$1
		If (This:C1470.windowID#Null:C1517)
			SET WINDOW TITLE:C213(This:C1470.title;This:C1470.windowID)
		End if 
	End if 
	$0:=This:C1470.title
	
	
Function Style
	C_LONGINT:C283($1;$0)
	If (Count parameters:C259=1)
		This:C1470.style:=$1
	End if 
	$0:=This:C1470.style
	
Function CloseBox
	C_BOOLEAN:C305($1;$0)
	If (Count parameters:C259=1)
		This:C1470.closeBox:=$1
	End if 
	$0:=This:C1470.closeBox
	
Function Dimensions
	C_LONGINT:C283($1;$2)
	This:C1470.width:=$1
	This:C1470.height:=$2
	
Function Width
	C_LONGINT:C283($1)
	This:C1470.width:=$1
	
Function Height
	C_LONGINT:C283($1)
	This:C1470.height:=$1
	
	
Function drawWindow
	If (This:C1470.width=Null:C1517)
		This:C1470.width:=512  // It has to be something
	End if 
	
	If (This:C1470.height=Null:C1517)
		This:C1470.height:=342  // It has to be something
	End if 
	
	If (This:C1470.position=Null:C1517)  //  I'll work this out later
		This:C1470.position:=0  //  Some constants might be nice
	End if 
	
	  // Now draw the window
	$Wnd_Left_i:=(Screen width:C187-This:C1470.width)\2
	$Wnd_Top_i:=(Screen height:C188-This:C1470.height)\3
	$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
	$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
	
	If (This:C1470.windowID=Null:C1517)  // If it doesn't exist open it
		This:C1470.windowID:=Open window:C153($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.style;This:C1470.closeBox)
		SET WINDOW TITLE:C213(This:C1470.title)
	Else 
		  // If it does exist move it
		GET WINDOW RECT:C443($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.windowID)
		$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
		$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
		SET WINDOW RECT:C444($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.windowID)
	End if 
	
	  // Return the window ID as a number
	$0:=This:C1470.windowID
	
Function Close
	CLOSE WINDOW:C154(This:C1470.windowID)
	
Function copy
	$0:=Super:C1706.copy()
	$0.windowID:=Null:C1517  // Remove the existing window reference
	
	
Function formMethod
	Case of 
		: (Form event code:C388=On Resize:K2:27)
			
			
	End case 
	
	