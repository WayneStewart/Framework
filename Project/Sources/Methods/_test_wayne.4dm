//%attributes = {}
C_OBJECT:C1216($window)
C_TEXT:C284($title)


$window:=cs:C1710.Window.new()

$window.Title("My Title")
$window.Style(Plain window:K34:13)

$window.Position(FW Centre)

$window.CloseBox(True:C214)

$WinRef_i:=$window.drawWindow()

$window.Dimensions(900;600)
$window.drawWindow()  // Resize window

DIALOG:C40("Dummy";New object:C1471("window";$window);*)

$anotherWindow:=$window.copy()

$anotherWindow.Title("A Different Title")

$title:=$window.Title()

$anotherWindow.Dimensions(300;200)

$anotherWindow.Position(FW Center on Window)

$AnotherWinRef_i:=$anotherWindow.drawWindow()

DIALOG:C40("Dummy";New object:C1471("window";$anotherWindow);*)

CLOSE WINDOW:C154

CLOSE WINDOW:C154

