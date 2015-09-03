accessing
configurationName

	^ configurationName ifNil: [ configurationName := 'ConfigurationOf', name ].