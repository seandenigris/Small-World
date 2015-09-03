initialization
project: aSmallProject 

	project := aSmallProject.
	self buttons do: [ :e | e enabled: project isNil not ].