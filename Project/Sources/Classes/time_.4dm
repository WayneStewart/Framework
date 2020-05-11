/*  time_ ()
 Created by: Kirk as Designer, Created: 05/10/20, 07:06:28
 ------------------
 Purpose: manage time values

timeValue             - saved as number of seconds

What distinguishes a time from a date? 
What does more seconds than the length of a day mean?
We don't deal with time zones here beyond using the built in string formats

86400 = 24*60*60 = seconds in a day

*/
Class extends Object

Class constructor
	C_VARIANT:C1683($1)
	This:C1470.timeValue:=Current time:C178
	
	Case of 
		: (Count parameters:C259=0)
		: (Value type:C1509($1)=Is longint:K8:6) | (Value type:C1509($1)=Is text:K8:3)
			This:C1470.timeValue:=This:C1470.calcTime($1)
	End case 
	
	  //=========================================================
Function calcTimeZoneDiff  //  offset between myTime (or value) anmd GMT. 
	C_TIME:C306($1;$myTime_h)
	C_LONGINT:C283($0)
	
	If (Count parameters:C259=1)
		$myTime_h:=$1
	Else 
		$myTime_h:=Time:C179(This:C1470.timeValue)
	End if 
	
	$0:=(($myTime_h)-((Time:C179(Substring:C12(String:C10(Current date:C33;ISO date GMT:K1:10;$myTime_h);12;19)))))/(60*60)
	
Function calcTime  //  text | longint   calculate the time value of $1
	C_VARIANT:C1683($1)
	C_TIME:C306($0)
	
	Case of 
		: (Value type:C1509($1)=Is longint:K8:6) | (Value type:C1509($1)=Is real:K8:4)
			$0:=$1
			
		: (Value type:C1509($1)=Is text:K8:3)
			C_TEXT:C284($text)
			$text:=$1
			  // what are going to support?
			
			Case of 
				: (Match regex:C1019("^\\d+$";$text;1))  //  line of only numbers
					$0:=Time:C179(Num:C11($text))
					
				Else   //  it's something 4D Time function can handle - which is pretty darn robust
					$0:=Time:C179($text)
			End case 
			
	End case 
	
Function setTime  //    text | longint | time
	C_VARIANT:C1683($1)
	
	If (Value type:C1509($1)=Is time:K8:8)
		This:C1470.timeValue:=$1
	Else 
		This:C1470.timeValue:=This:C1470.calcTime($1)
	End if 
	
Function addTime  //  add the expression to the current time value
	C_VARIANT:C1683($1)
	
	This:C1470.timeValue:=This:C1470.timeValue+This:C1470.calcTime($1)  //  add back the starting value
	
	While (This:C1470.timeValue>(86400))
		This:C1470.timeValue:=This:C1470.timeValue-(86400)
	End while 
	
Function subtractTime  //  delete the expression from the current time value
	C_VARIANT:C1683($1)
	
	This:C1470.timeValue:=This:C1470.timeValue-This:C1470.calcTime($1)
	
	While (This:C1470.timeValue<0)
		This:C1470.timeValue:=(24*60*60)+This:C1470.timeValue
	End while 
	
Function timeDiff  //      return # seconds difference between current value and $1
	C_VARIANT:C1683($1)
	C_LONGINT:C283($0)
	
	$0:=This:C1470.timeValue-This:C1470.calcTime($1)
	
	  // --------------------------------------------------------
Function hour
	C_LONGINT:C283($0)
	$0:=Num:C11(Substring:C12(String:C10(Time:C179(This:C1470.timeValue);HH MM SS:K7:1);1;2))
	
Function minute
	C_LONGINT:C283($0)
	$0:=Num:C11(Substring:C12(String:C10(Time:C179(This:C1470.timeValue);HH MM SS:K7:1);4;2))
	
Function second
	C_LONGINT:C283($0)
	$0:=Num:C11(Substring:C12(String:C10(Time:C179(This:C1470.timeValue);HH MM SS:K7:1);7;2))
	
Function fracDay  //  fraction of the day
	C_REAL:C285($0)
	$0:=This:C1470.timeValue/86400
	
	  // --------------------------------------------------------
Function strTime  //  4D format constant or str
	C_VARIANT:C1683($1)
	C_TEXT:C284($0;$str)
	
	Case of 
		: (Count parameters:C259=0)
			$0:=Time string:C180(This:C1470.timeValue)
			
		: (Value type:C1509($1)=Is longint:K8:6)
			$0:=String:C10(Time:C179(This:C1470.timeValue);$1)
			
		: (Value type:C1509($1)=Is text:K8:3)
			C_LONGINT:C283($pos;$len)
			C_BOOLEAN:C305($AmPm)
			
			$str:=$1
			
			Case of 
				: ($str="")
					$str:=String:C10(Time:C179(This:C1470.timeValue);HH MM SS:K7:1)
					
				: ($str="1123")  //  RFC 1123
					$str:=String:C10(Time:C179(This:C1470.timeValue);Date RFC 1123:K1:11)
					
				Else   //  replace in pattern and return
					
					If (Match regex:C1019("(?i)\\bhh?";$str;1;$pos;$len))  //  hh
						$str:=Delete string:C232($str;$pos;$len)
						$str:=Insert string:C231($str;String:C10(This:C1470.hour());$pos)
					End if 
					
					If (Match regex:C1019("(?i)\\bmm?";$str;1;$pos;$len))  //  mm
						$str:=Delete string:C232($str;$pos;$len)
						$str:=Insert string:C231($str;String:C10(This:C1470.minute();"00");$pos)
					End if 
					
					If (Match regex:C1019("(?i)\\bss?";$str;1;$pos;$len))  //  ss
						$str:=Delete string:C232($str;$pos;$len)
						$str:=Insert string:C231($str;String:C10(This:C1470.second();"00");$pos)
					End if 
					
			End case 
			
			$0:=$str
	End case 
	