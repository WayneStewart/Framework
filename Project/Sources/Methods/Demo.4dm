//%attributes = {}
// Demo
// Created by Wayne Stewart (2021-09-27T14:00:00Z)
//  Method is an autostart type
//     wayne@4dsupport.guru
// ----------------------------------------------------

C_LONGINT:C283($ProcessID_i;$StackSize_i;$WindowID_i)
C_TEXT:C284($Form_t;$DesiredProcessName_t)

// ----------------------------------------------------

$StackSize_i:=0
$Form_t:=Current method name:C684
$DesiredProcessName_t:="$"+Current method name:C684

If (Current process name:C1392=$DesiredProcessName_t)
	
	
	$WindowID_i:=Open form window:C675($Form_t;Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4;*)
	DIALOG:C40($Form_t)
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
