//%attributes = {"invisible":true}
/*
  Constants methods by Cannon Smith
  https://www.synergyfarmsolutions.com
*/

C_TEXT:C284($1;vtCC_Filename)  //Should end in ".xlf"

vtCC_Filename:=$1

C_TEXT:C284(vtCC_XMLTopLevelRef)
C_TEXT:C284(vtCC_XMLFileRef)
C_TEXT:C284(vtCC_XMLBodyRef)
C_TEXT:C284(vtCC_XMLGroupsRef)
C_TEXT:C284(vtCC_XMLCurrentGroupRef)
C_LONGINT:C283(vlCC_CurrentGroupNumber)
C_LONGINT:C283(vlCC_CurrentConstantNumber)

  //Create the XML document with the xliff root
vtCC_XMLTopLevelRef:=DOM Create XML Ref:C861("xliff";"";\
"version";"1.0";\
"xmlns:d4";"http://www.4d.com/d4-ns")

  //Create the file node
vtCC_XMLFileRef:=DOM Create XML element:C865(vtCC_XMLTopLevelRef;"file";\
"datatype";"x-4DK#";\
"original";"x-undefined";\
"source-language";"x-none";\
"target-language";"x-none")

  //Create the body node
vtCC_XMLBodyRef:=DOM Create XML element:C865(vtCC_XMLFileRef;"body")

  //Create the groups labels node
vtCC_XMLGroupsRef:=DOM Create XML element:C865(vtCC_XMLBodyRef;"group";\
"resname";"themes")

vlCC_CurrentGroupNumber:=0
vlCC_CurrentConstantNumber:=0
