Form:C1466.windowDetails.formMethod()

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		OBJECT SET ENABLED:C1123(*;"ButtonFullname";False:C215)
		OBJECT SET ENABLED:C1123(*;"ButtonIdentity";False:C215)
		
		OBJECT SET ENABLED:C1123(*;"ButtonFullname2";False:C215)
		OBJECT SET ENABLED:C1123(*;"ButtonIdentity2";False:C215)
		
		C_LONGINT:C283(nTrace)
		nTrace:=1  // active debug
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		Case of 
			: ($page=2)
				
				Form:C1466.firstname:="John"
				Form:C1466.lastname:="Doe"
				Form:C1466.birthdate:=!1956-10-27!
				Form:C1466.subject:="Geography"
				
				Form:C1466.fullname:=Null:C1517
				Form:C1466.identity:=Null:C1517
				
			: ($page=3)
				
				Form:C1466.firstname:="William"
				Form:C1466.lastname:="Smith"
				Form:C1466.birthdate:=!2002-02-20!
				Form:C1466.grade:="10th"
				Form:C1466.school:="Waco High School"
				
				Form:C1466.fullname:=Null:C1517
				Form:C1466.identity:=Null:C1517
				
		End case 
		
End case 