//%attributes = {}
C_OBJECT:C1216($window)
C_TEXT:C284($title)


$window:=cs:C1710.Window.new()

$window.Title("My Title")
$window.Style(Plain form window:K39:10)

$window.CloseBox(True:C214)

$windowID_i:=$window.drawWindow()

  //$anotherWindow:=$window.copy()

  //$anotherWindow.Title("A Different Title")

  //$title:=$window.Title()

  //$anotherWindow.Dimensions(900;600)

  //$AnotherwindowID_i:=$anotherWindow.drawWindow()

$window.Close()

  //$anotherWindow.Close()

