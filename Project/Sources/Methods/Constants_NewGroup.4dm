//%attributes = {"invisible":true}
/*
  Constants methods by Cannon Smith
  https://www.synergyfarmsolutions.com
*/

C_TEXT:C284($1;$tGroupName)

$tGroupName:=$1

C_TEXT:C284($tGroupUUID;$tGroupInGroupsXMLRef;$tSourceXMLRef)

  //Increment the group number
vlCC_CurrentGroupNumber:=vlCC_CurrentGroupNumber+1

  //Create group UUID
$tGroupUUID:=Generate UUID:C1066

  //Add group to the list of group labels
$tGroupInGroupsXMLRef:=DOM Create XML element:C865(vtCC_XMLGroupsRef;"trans-unit";\
"id";"thm_"+String:C10(vlCC_CurrentGroupNumber);\
"resname";$tGroupUUID;\
"translate";"no")

  //Set group name
$tSourceXMLRef:=DOM Create XML element:C865($tGroupInGroupsXMLRef;"source")
DOM SET XML ELEMENT VALUE:C868($tSourceXMLRef;$tGroupName)

  //Add the group node that encompasses all the group's constants
vtCC_XMLCurrentGroupRef:=DOM Create XML element:C865(vtCC_XMLBodyRef;"group";\
"d4:groupName";$tGroupUUID;\
"restype";"x-4DK#")
