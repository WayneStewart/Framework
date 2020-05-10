/*  date_ ([text/date/real/long])
$1: some date value
 Created by: Kirk as Designer, Created: 05/09/20, 16:08:52
 ------------------
VALUES
This.value is a string: yyyy-mm-dd for as much as is known

*/
Class extends time_

Class constructor
	C_VARIANT:C1683($1;$2)
	
	Super:C1705()
	This:C1470.value:=""
	
	If (Count parameters:C259=2)
		Super:C1706.setTime($2)
	Else 
		Super:C1706.setTime("12:00:00")
	End if 
	
	If (Count parameters:C259>0)
		This:C1470.setDateValue($1)
	Else 
		This:C1470.setDateValue(Current date:C33)
	End if 
	
	  // ============================================================
Function dateValue  //     return the date value
	C_BOOLEAN:C305($1;$useGMT)
	C_DATE:C307($0)
	
	If (Count parameters:C259=1)
		$useGMT:=$1
	End if 
	
	If ($useGMT)
		
	Else 
		$0:=Date:C102(This:C1470.value+"T"+Super:C1706.strTime())
	End if 
	
Function yearOf
	C_LONGINT:C283($0)
	$0:=Year of:C25(This:C1470.dateValue())
	
Function monthOf
	C_LONGINT:C283($0)
	$0:=Month of:C24(This:C1470.dateValue())
	
Function dayOf
	C_LONGINT:C283($0)
	$0:=Day of:C23(This:C1470.dateValue())
	
	  // --------------------------------------------------------
Function dayName  //  get the name of a day or value date
	C_LONGINT:C283($1;$day_l)
	C_TEXT:C284($0)
	
	If (Count parameters:C259>0)
		$day_l:=$1
	Else 
		$day_l:=Day number:C114(This:C1470.dateValue())
	End if 
	
	Case of 
		: ($day_l=1)
			$0:="Sunday"
		: ($day_l=2)
			$0:="Monday"
		: ($day_l=3)
			$0:="Tuesday"
		: ($day_l=4)
			$0:="Wednesday"
		: ($day_l=5)
			$0:="Thursday"
		: ($day_l=6)
			$0:="Friday"
		: ($day_l=7)
			$0:="Saturday"
	End case 
	
	  // --------------------------------------------------------
Function monthName
	C_LONGINT:C283($1;$month_l)
	C_TEXT:C284($0)
	
	If (Count parameters:C259>0)
		$month_l:=$1
	Else 
		$month_l:=Month of:C24(This:C1470.dateValue())
	End if 
	
	Case of 
		: ($month_l=1)
			$0:="January"
		: ($month_l=2)
			$0:="February"
		: ($month_l=3)
			$0:="March"
		: ($month_l=4)
			$0:="April"
		: ($month_l=5)
			$0:="May"
		: ($month_l=6)
			$0:="June"
		: ($month_l=7)
			$0:="July"
		: ($month_l=8)
			$0:="August"
		: ($month_l=9)
			$0:="September"
		: ($month_l=10)
			$0:="October"
		: ($month_l=11)
			$0:="Novenber"
		: ($month_l=12)
			$0:="December"
	End case 
	
	  // --------------------------------------------------------
Function monthNumFromName  //  takes a month name or abbrev
	C_TEXT:C284($1;$month_t)
	C_LONGINT:C283($0)
	
	$month_t:=Substring:C12($1;1;3)
	Case of 
		: ($month_t="jan")
			$0:=1
		: ($month_t="feb")
			$0:=2
		: ($month_t="mar")
			$0:=3
		: ($month_t="apr")
			$0:=4
		: ($month_t="may")
			$0:=5
		: ($month_t="jun")
			$0:=6
		: ($month_t="jul")
			$0:=7
		: ($month_t="aug")
			$0:=8
		: ($month_t="sep")
			$0:=9
		: ($month_t="oct")
			$0:=10
		: ($month_t="nov")
			$0:=11
		: ($month_t="dec")
			$0:=12
	End case 
	
Function firstOfMonth
	C_DATE:C307($0)
	
	$0:=Add to date:C393(!00-00-00!;\
		This:C1470.yearOf();\
		This:C1470.monthOf();\
		1)
	
Function lastOfMonth
	C_DATE:C307($0)
	
	$0:=Add to date:C393(!00-00-00!;\
		This:C1470.yearOf();\
		This:C1470.monthOf()+1;\
		1)-1
	
Function getEpoch
/* the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT), 
not counting leap seconds (in ISO 8601: 1970-01-01T00:00:00Z). 
Literally speaking the epoch is Unix time 0 (midnight 1/1/1970),
but 'epoch' is often used as a synonym for 'Unix time'.*/
	C_LONGINT:C283($0;$nDays)
	$nDays:=(This:C1470.dateValue()-!1970-01-01!)
	
	$0:=(($nDays*86400)+((This:C1470.hour()-This:C1470.calcTimeZoneDiff())*3600)+(This:C1470.minute()*60)+This:C1470.second())
	
	  // --------------------------------------------------------
Function strDate
	C_TEXT:C284($0)
	C_DATE:C307($value_d)
	C_VARIANT:C1683($1)  //  longint|text
	C_LONGINT:C283($format_l)
	
	$value_d:=Date:C102(This:C1470.dateValue())
	
	Case of 
		: (Count parameters:C259=0)
			$0:=(This:C1470.value)
			
		: (Value type:C1509($1)=Is longint:K8:6)
			$format_l:=$1
			
			Case of 
				: ($format_l=ISO date:K1:8) | ($format_l=ISO date GMT:K1:10)
					$0:=String:C10($value_d;$format_l;Time:C179(This:C1470.timeValue))
					
				Else   // assume this is some time format
					$0:=String:C10($value_d;$format_l)
					
			End case 
			
		: (Value type:C1509($1)=Is text:K8:3)
			
			Case of 
				: ($1="ISO") | ($1="yyyy-mm-dd") | ($1="simple")
					$0:=This:C1470.value
					
				: ($1="system long")
					$0:=String:C10($value_d;System date long:K1:3)+" at "+String:C10(Time:C179(This:C1470.timeValue);System time long:K7:11)
					
				: ($1="internal long")  // assume this is some time format
					$0:=String:C10($value_d;Internal date long:K1:5)+" at "+String:C10(Time:C179(This:C1470.timeValue);System time short:K7:9)
					
				: ($1="rfc1123")
					C_TEXT:C284($0)
					$0:=Substring:C12(This:C1470.dayName();1;3)+" "+String:C10(Day of:C23($value_d);"00")+" "+Substring:C12(This:C1470.monthName();1;3)+" "+String:C10(Year of:C25($value_d))+" "+String:C10(Time:C179(This:C1470.timeValue);HH MM SS:K7:1)
					
				: ($1="simple")  //   Sept 14, 1967
					C_TEXT:C284($0)
					$0:=Substring:C12(This:C1470.monthName();1;4)+" "+String:C10(Day of:C23($value_d))+", "+String:C10(Year of:C25($value_d))
					
				: ($1="formal")  //   September 14, 1967
					C_TEXT:C284($0)
					$0:=This:C1470.monthName()+" "+String:C10(Day of:C23($value_d))+", "+String:C10(Year of:C25($value_d))
					
			End case 
	End case 
	
	  // --------------------------------------------------------
Function setDate  //  date | text | longint  ;  this is the primary input for the date
	C_VARIANT:C1683($1)
	This:C1470.setDateValue(This:C1470.calcDate($1))
	
	  // --------------------------------------------------------
Function calcDate  //  text | date | longint   ;return a date value for the input expression
	C_VARIANT:C1683($1)
	C_DATE:C307($0)
	
	Case of 
		: (Value type:C1509($1)=Is date:K8:7)
			$0:=$1
			
		: (Value type:C1509($1)=Is longint:K8:6)  //  $1 is number of days since pivotDate (!1/1/1970!)// UNIX epoch
			If (This:C1470.pivotDate=Null:C1517)
				$0:=Add to date:C393(!1900-01-01!;$1;0;0)
			Else 
				$0:=Add to date:C393(This:C1470.pivotDate;$1;0;0)
			End if 
			
		: (Value type:C1509($1)=Is text:K8:3)
			C_TEXT:C284($Date_Raw_t;$Pattern_MM_DD_YY_t;$month_t)
			ARRAY LONGINT:C221($aPos;0)
			ARRAY LONGINT:C221($aLen;0)
			
			$Date_Raw_t:=$1
			
			Case of 
				: ($Date_Raw_t="")
					
				: (Match regex:C1019("\\d{1,2}/\\d{1,2}/\\d{2,4}";$Date_Raw_t;1))
					$0:=Date:C102($Date_Raw_t)
					
				: (Match regex:C1019("(\\d\\d\\d\\d?)-(\\d\\d?)-(\\d\\d?)T(\\d\\d:\\d\\d:\\d\\d)";$Date_Raw_t;1;$aPos;$aLen))  // ISO date
					$0:=Add to date:C393(!00-00-00!;\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{1};$aLen{1}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{2};$aLen{2}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{3};$aLen{3})))
					
					Super:C1706.setTime(Substring:C12($Date_Raw_t;$aPos{4};$aLen{4}))
					
				: (Match regex:C1019("(\\d\\d\\d\\d?-\\d\\d?-\\d\\d?)";$Date_Raw_t;1;$aPos;$aLen))  // ISO date
					$0:=Add to date:C393(!00-00-00!;\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{1};$aLen{1}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{2};$aLen{2}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{3};$aLen{3})))
					
				: (Match regex:C1019("(?i)(\\w+),? (\\w+) (\\d\\d?),? (\\d\\d\\d\\d?) [@at]+ (\\d\\d:\\d\\d:\\d\\d ?\\w\\w)?";$Date_Raw_t;1;$aPos;$aLen))
/* eg. Excel export value like this:
1         2    3   4         5 
Tuesday, April 10, 2018 at 12:00:00 AM
Tuesday, April 10, 2018 at 00:00:00    --  24 hour time
*/
					$0:=Add to date:C393(!00-00-00!;\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{4};$aLen{4}));\
						This:C1470.monthNumFromName(Substring:C12($Date_Raw_t;$aPos{2};$aLen{2}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{3};$aLen{3})))
					
					Super:C1706.setTime(Substring:C12($Date_Raw_t;$aPos{5};$aLen{5}))
					
				: (Match regex:C1019("(?i)(\\w+) (\\d\\d?),? (\\d\\d\\d\\d)";$Date_Raw_t;1;$aPos;$aLen))  //    September 14, 1864
					$0:=Add to date:C393(!00-00-00!;\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{3};$aLen{3}));\
						This:C1470.monthNumFromName(Substring:C12($Date_Raw_t;$aPos{1};$aLen{1}));\
						Num:C11(Substring:C12($Date_Raw_t;$aPos{2};$aLen{2})))
					
				Else 
					
					
			End case 
	End case 
	
Function setDateValue  //  writes a date value to This.value
	C_DATE:C307($1)
	This:C1470.value:=Substring:C12(String:C10($1;ISO date:K1:8);1;10)
	
	