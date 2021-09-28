//%attributes = {}
var $now;$GMT : cs:C1710.cDate

$now:=cs:C1710.cDate.new()
$date:=$now.getDate()

$nowTS:=$now.strDate(ISO date:K1:8)
$now2TS:=$now.strDate(ISO date GMT:K1:10)
$gmtTS:=Timestamp:C1445


$GMT:=dts_ConvertToGMT($now)


$gmtTime:=$GMT.strTime()

$nextYear:=OB Copy:C1225($now)

$nextYear.addYear(1)

$easter:=$nextYear.Easter()

