//%attributes = {}
$myShared_o:=New shared object:C1526

$date:=cs:C1710.cDate.new()

$date.setDate("1/1/2021")

Use ($myShared_o)
	$myShared_o:=$date.copy(ck shared:K85:29)
End use 




