If (nTrace=1)
	TRACE:C157
End if 



  // Instantiate the oPerson object
  // Use the new member function to call the constructor with the firstname, lastname and birthdate
Form:C1466.oStudent:=cs:C1710.Student.new(Form:C1466.firstname;Form:C1466.lastname;Form:C1466.birthdate;Form:C1466.school;Form:C1466.grade)





  // only for HDI
Form:C1466.fullname:=Null:C1517
Form:C1466.identity:=Null:C1517

OBJECT SET ENABLED:C1123(*;"ButtonFullname2";True:C214)
OBJECT SET ENABLED:C1123(*;"ButtonIdentity2";True:C214)