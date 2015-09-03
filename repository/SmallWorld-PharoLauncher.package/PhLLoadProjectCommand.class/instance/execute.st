action
execute
	| project |
	super execute.
	project := SmallProject projects
		detect: [ :e | e name = newImageName ]
		ifNone: [ self error: 'There is no project named ', newImageName ].
	self loadIntoNewImage: project.