//%attributes = {"invisible":true}
/* Constants methods by Cannon Smith
  https://www.synergyfarmsolutions.com


  //This module can be used to create constants via code. 4D will recognize
  //user created constants if they are in an .xlf file at the top level of
  //the Resources folder. It is possible to have multiple .xlf files.

  //The files created by this module are compatible with the 4DPop Constants
  //Editor component so files created with this module can be opened and
  //edited with the component if desired. (This module does not read in
  //existing files—it is only for creating constant files from code.)

  //If a module in Foundation needs constants, a method named <module>_Constants
  //should be created and then called from Foundation__Constants method. The
  //same goes for other module groups.

  //Whenever the constants need to be updated, manually run the <module>_Constants
  //method and then restart the database.

*/

  //================================================================================================================
  //Module methods
  //================================================================================================================

  //The basic code to use the module from scratch follows:

Constants_NewFile ("My Constants.xlf")

Constants_NewGroup ("Math")
Constants_AddReal ("Pi";3.14)
Constants_AddLong ("Universe";42)

Constants_NewGroup ("Windows")
Constants_AddString ("Left";"Left")
Constants_AddString ("Right";"Right")

Constants_SaveFile 
