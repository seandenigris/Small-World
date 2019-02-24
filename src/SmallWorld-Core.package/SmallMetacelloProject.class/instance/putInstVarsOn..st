saving
putInstVarsOn: aWriteStream 

	super putInstVarsOn: aWriteStream.
	self putInstVarNamed: 'configurationName' On: aWriteStream unlessDefault: 'ConfigurationOf', name.
	self putInstVarNamed: 'testPackages' On: aWriteStream unlessDefault: #().
	self putInstVarNamed: 'defaultVersion' On: aWriteStream unlessDefault: #stable.