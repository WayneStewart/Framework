//%attributes = {}
C_OBJECT:C1216($window)
C_TEXT:C284($title)


$window:=cs:C1710.Window.new()

$window.Title("My Title")
$window.Style(Plain form window:K39:10)

$window.CloseBox(True:C214)

  //$anotherWindow:=cs.Window.new(New object("title";"another window";\
"style";Modal dialog box))

$window.Dimensions(400;200)

$windowID_i:=$window.drawWindow()

$window.Title("A Different Title")

$title:=$window.Title()

$window.Close()


