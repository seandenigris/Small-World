private
printConfigurationLoadStatementOn: aStream

	| loadTemplate loadParameters loadCommand |
	loadTemplate := 'Gofer it
	{1};
	package: {2};
	load.'.
	loadParameters := Array
		with: project repository goferLoadCascade
		with: project configurationName surroundedBySingleQuotes.
	loadCommand := loadTemplate format: loadParameters.
	aStream nextPutAll: loadCommand; cr.