/*
Created by: Wayne Stewart
 ------------------
  General window routines

*/

Class extends cObject


Class constructor
	C_OBJECT:C1216($1)  // Sets up default values rather than have Nulls
	If ($1.title#Null:C1517)
		This:C1470.title:=$1.title
	Else 
		This:C1470.title:=""
	End if 
	
	If ($1.style#Null:C1517)
		This:C1470.style:=$1.style
	Else 
		This:C1470.style:=Plain window:K34:13
	End if 
	
	If ($1.closeBox#Null:C1517)
		This:C1470.closeBox:=$1.closeBox
	Else 
		This:C1470.closeBox:=False:C215
	End if 
	
	If ($1.position#Null:C1517)
		This:C1470.position:=$1.position
	Else 
		This:C1470.position:=Plain window:K34:13
	End if 
	
	If ($1.position#Null:C1517)
		This:C1470.position:=$1.position
	Else 
		This:C1470.position:=Plain window:K34:13
	End if 
	
	If ($1.width#Null:C1517)
		This:C1470.width:=$1.width
	Else 
		This:C1470.width:=512
	End if 
	
	If ($1.width#Null:C1517)
		This:C1470.height:=$1.height
	Else 
		This:C1470.height:=342
	End if 
	
Function Title
	C_TEXT:C284($1;$0)
	If (Count parameters:C259=1)
		This:C1470.title:=$1
		If (This:C1470.windowReferenceNumber#Null:C1517)  // The window may not be open yet
			SET WINDOW TITLE:C213(This:C1470.title;This:C1470.windowReferenceNumber)
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
	C_LONGINT:C283($screenHeight_i;$style_i;$screenWidth_i;$Wnd_Bottom_i;$Wnd_Left_i;$Wnd_Right_i;$Wnd_Top_i;$wr01_i;$wr02_i)
	C_TEXT:C284($title_t)
	
	$screenHeight_i:=Screen height:C188
	$screenWidth_i:=Screen width:C187
	
	Case of 
		: (This:C1470.position=FW Centre)
			$Wnd_Left_i:=($screenWidth_i-This:C1470.width)\2
			$Wnd_Top_i:=($ScreenHeight_i-This:C1470.height)\3
			$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
			$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
			
		: (This:C1470.position=FW Center on Window)
			$FrontmostWindow_i:=Frontmost window:C447
			GET WINDOW RECT:C443($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i)
			$HorizontalCentre_i:=$Wnd_Right_i-$Wnd_Left_i
			$VerticalCentre_i:=$Wnd_Bottom_i-$Wnd_Top_i
			$Wnd_Left_i:=$HorizontalCentre_i-(This:C1470.width/2)
			$Wnd_Top_i:=$VerticalCentre_i-(This:C1470.height/2)
			$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
			$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
			
		Else   // Default is also centred
			
			$Wnd_Left_i:=($screenWidth_i-This:C1470.width)\2
			$Wnd_Top_i:=($screenHeight_i-This:C1470.height)\3
			$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
			$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
			
	End case 
	
	  // Now draw the window
	If (This:C1470.windowReferenceNumber=Null:C1517)  // If it doesn't exist open it
		This:C1470.windowReferenceNumber:=Open window:C153($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.style;"";"WindowCloseBox")
		SET WINDOW TITLE:C213(This:C1470.title)
	Else 
		  // If it does exist move it
		GET WINDOW RECT:C443($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.windowReferenceNumber)
		$Wnd_Right_i:=$Wnd_Left_i+This:C1470.width
		$Wnd_Bottom_i:=$Wnd_Top_i+This:C1470.height
		SET WINDOW RECT:C444($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;This:C1470.windowReferenceNumber)
	End if 
	
	  // Return the window ID as a number
	$0:=This:C1470.windowReferenceNumber
	
Function copy
	$0:=Super:C1706.copy()
	$0.windowReferenceNumber:=Null:C1517  // Remove the existing window reference
	
Function formMethod
	
	If (Count parameters:C259=1)
		$formEvent_i:=$1
	Else 
		$formEvent_i:=Form event code:C388
	End if 
	
	Case of 
		: ($formEvent_i=On Resize:K2:27)
			
			
		: ($formEvent_i=On Close Box:K2:21)
			CANCEL:C270
			
		: ($formEvent_i=On Load:K2:1)
			
			
	End case 
	
	
Function Position
	C_LONGINT:C283($1)
	This:C1470.position:=$1
	
Function WinRef
	$0:=This:C1470.windowReferenceNumber
	