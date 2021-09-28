If (nTrace=1)
	TRACE:C157
End if 


  // Call the getFullName function. This function is not declare in the Student class, but in the parent class, Person.
  // No difference in calling the function. It's transparent for the developer
Form:C1466.fullname:=Form:C1466.oStudent.getFullName()



