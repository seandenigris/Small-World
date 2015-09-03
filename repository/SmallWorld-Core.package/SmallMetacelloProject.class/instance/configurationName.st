accessing
configurationName

	^ configurationName ifNil: [ 'ConfigurationOf', self name ].