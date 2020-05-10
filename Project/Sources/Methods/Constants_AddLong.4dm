//%attributes = {"invisible":true}
/* Constants methods by Cannon Smith
  https://www.synergyfarmsolutions.com
*/

C_TEXT:C284($1;$tConstantName)
C_LONGINT:C283($2;$lConstantValue)

$tConstantName:=$1
$lConstantValue:=$2

C_TEXT:C284($tConstantXMLRef;$tConstantNameXMLRef)

  //Increment the constant number
vlCC_CurrentConstantNumber:=vlCC_CurrentConstantNumber+1

  //Add constant to list of constants within current group
$tConstantXMLRef:=DOM Create XML element:C865(vtCC_XMLCurrentGroupRef;"trans-unit";\
"d4:value";String:C10($lConstantValue)+":L";\
"id";"k_"+String:C10(vlCC_CurrentConstantNumber))

  //Add constant name
$tConstantNameXMLRef:=DOM Create XML element:C865($tConstantXMLRef;"source")
DOM SET XML ELEMENT VALUE:C868($tConstantNameXMLRef;$tConstantName)
