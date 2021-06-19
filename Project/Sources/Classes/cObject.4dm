Function class  // cObject
	C_OBJECT:C1216($0)
	$0:=OB Class:C1730(This:C1470)
	
	
Function copy
	C_OBJECT:C1216($0)
	C_VARIANT:C1683($1; $2; $3)
	
	$resolvePtrs_b:=False:C215
	$options_i:=0
	
	
	If (Count parameters:C259>0)
		$ValueType_i:=Value type:C1509($1)
		Case of 
			: ($ValueType_i=Is boolean:K8:9)
				$resolvePtrs_b:=$1
				
			: ($ValueType_i=Is longint:K8:6
				$options_i:=$1
				
			Else 
				$ClassOrObject:=$1
				
		End case 
		
	End if 
	
	If (Count parameters:C259>1)
		$ValueType_i:=Value type:C1509($2)
		Case of 
			: ($ValueType_i=Is boolean:K8:9)
				$resolvePtrs_b:=$2
				
			: ($ValueType_i=Is longint:K8:6
				$options_i:=$2
				
			Else 
				$ClassOrObject:=$2
				
		End case 
		
	End if 
	
	If (Count parameters:C259>2)
		$ValueType_i:=Value type:C1509($3)
		Case of 
			: ($ValueType_i=Is boolean:K8:9)
				$resolvePtrs_b:=$3
				
			: ($ValueType_i=Is longint:K8:6
				$options_i:=$3
				
			Else 
				$ClassOrObject:=$3
				
		End case 
		
	End if 
	
	If (Count parameters:C259>2)
		$0:=OB Copy:C1225(This:C1470; $resolvePtrs_b; $options_i; $3)
	Else 
		$0:=OB Copy:C1225(This:C1470; $resolvePtrs_b; $options_i)
	End if 
	