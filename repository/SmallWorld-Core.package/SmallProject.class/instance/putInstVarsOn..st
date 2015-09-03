private
putInstVarsOn: aWriteStream 

	self putInstVarNamed: 'repository' On: aWriteStream unlessDefault: nil.
	self putInstVarNamed: 'description' On: aWriteStream unlessDefault: ''.