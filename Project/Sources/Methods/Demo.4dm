//%attributes = {}
// Demo
// Created by Wayne Stewart (2021-09-29T14:00:00Z)
//  Method is an autostart type
//     wayne@4dsupport.guru
// ----------------------------------------------------

var $ProcessID_i;$StackSize_i;$WindowID_i;$month_i : Integer
var $formName_t;$DesiredProcessName_t : Text
var $Form_o : Object
var $window_o : cs:C1710.cWindow


// ----------------------------------------------------

$StackSize_i:=0
$formName_t:=Current method name:C684
$DesiredProcessName_t:="$"+$formName_t

If (Current process name:C1392=$DesiredProcessName_t)
	
	$window_o:=cs:C1710.cWindow.new()
	$window_o.Title("Demo")
	$window_o.CloseBox(True:C214)
	$window_o.windowStyle(Plain form window:K39:10)
	$window_o.Position(FW Centre)
	$window_o.getSizeFromForm($formName_t)
	
	
	$Form_o:=New object:C1471()
	$Form_o.windowDetails:=$window_o
	
	$WindowID_i:=$window_o.drawWindow()
	
	//$WindowID_i:=Open form window($formName_t;Plain form window;Horizontally centered;At the top;*)
	DIALOG:C40($formName_t;$Form_o)
	CLOSE WINDOW:C154
	
	
	
Else 
	// This version allows for any number of processes
	// $ProcessID_i:=New Process(Current method name;$StackSize_i;$DesiredProcessName_t)
	
	// On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684;$StackSize_i;$DesiredProcessName_t;*)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 
