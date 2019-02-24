private
printConfigurationLoadStatementOn: aStream

	| loadTemplate loadParameters loadCommand |
	project repository ifNil: [ ^ self ].
	loadTemplate := 'Gofer it
	{1};
	package: {2};
	load.'.
	loadParameters := Array
		with: project repository 
		with: project configurationName surroundedBySingleQuotes.
	loadCommand := loadTemplate format: loadParameters.
	aStream nextPutAll: loadCommand; cr.