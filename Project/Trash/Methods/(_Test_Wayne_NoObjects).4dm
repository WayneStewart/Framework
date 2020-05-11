//%attributes = {}


$style:=Plain window:K34:13
$title:="My First Window"

$width:=512
$Height:=342

$Wnd_Left_i:=(Screen width:C187-$width)\2
$Wnd_Top_i:=(Screen height:C188-$height)\3
$Wnd_Right_i:=$Wnd_Left_i+$width
$Wnd_Bottom_i:=$Wnd_Top_i+$height



$win_01_i:=Open window:C153($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;$style;"";"WindowCloseBox")
SET WINDOW TITLE:C213($title)


$title:="My Second Window"

$width:=900
$Height:=600

$Wnd_Left_i:=(Screen width:C187-$width)\2
$Wnd_Top_i:=(Screen height:C188-$height)\3
$Wnd_Right_i:=$Wnd_Left_i+$width
$Wnd_Bottom_i:=$Wnd_Top_i+$height

$win_02_i:=Open window:C153($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;$style;"";"WindowCloseBox")
SET WINDOW TITLE:C213($title)

ARRAY LONGINT:C221($windows_ai;0)
WINDOW LIST:C442($Windows_ai;*)

CLOSE WINDOW:C154($win_01_i)


CLOSE WINDOW:C154($win_02_i)