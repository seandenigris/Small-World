private
printConfigurationLoadStatementOn: aStream

	| loadTemplate loadParameters loadCommand |
	loadTemplate := 'Gofer it
	{1} {2};
	package: {3};
	load.'.
	loadParameters := Array
		with: project repository goferRepositorySetter
		with: project repository asGoferString surroundedBySingleQuotes
		with: project configurationName surroundedBySingleQuotes.
	loadCommand := loadTemplate format: loadParameters.
	aStream nextPutAll: loadCommand; cr.