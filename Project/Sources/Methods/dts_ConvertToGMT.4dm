//%attributes = {}
#DECLARE($original : cs:C1710.cDate)->$zuluTime : cs:C1710.cDate

var $gDate : Integer
var $date : Date
var $time : Time
var $timeDiff;$hour;$gmtHour : Real


$date:=$original.getDate()
$time:=$original.getTime()
$timeString:=$original.strTime()

$hour:=$original.hour()
$timeDiff:=$original.calcTimeZoneDiff($time)

$gmtHour:=($hour-$timeDiff)

Case of 
	: ($gmtHour<0)
		$gDate:=-1
		$gmtHour:=24-$gmtHour
		
	: ($gmtHour>23)
		$gDate:=1
		$gmtHour:=$gmtHour-24
		
	Else 
		$gDate:=0
		
End case 




$date:=Add to date:C393($date;0;0;$gDate)

$timeString:=String:C10($gmtHour;"00")+Substring:C12($timeString;3)

$zuluTime:=cs:C1710.cDate.new($date;$timeString)

