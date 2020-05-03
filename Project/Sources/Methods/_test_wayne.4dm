//%attributes = {}
C_OBJECT:C1216($window)
C_TEXT:C284($title)


  //ALERT("Plain form window: "+String(Plain form window)+Char(13)+\
"Plain window"+String(Plain window))


$window:=cs:C1710.Window.new()

$window.Title("My Title")
$window.Style(Plain form window:K39:10)

$window.CloseBox(True:C214)

$windowID_i:=$window.drawWindow()

  //DIALOG("Dummy";New object("window";$window);*)

$anotherWindow:=$window.copy()

$anotherWindow.Title("A Different Title")

$title:=$window.Title()

$anotherWindow.Dimensions(900;600)

ARRAY LONGINT:C221($windows_ai;0)
WINDOW LIST:C442($Windows_ai;*)

$window.Close()

$AnotherwindowID_i:=$anotherWindow.drawWindow()


$anotherWindow.Close()

