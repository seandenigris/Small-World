action
loadIntoNewImage: project

	| loadScript evalString image command |
	image := context imageRepository images detect: [ :e | e name = newImageName ].
	loadScript := project loadScript
	quitting: true;
	saving: true;
	yourself.
	evalString := loadScript asString withLineEndings: ' '.
	command := Smalltalk vm fullPath asString, ' --headless "', image file fullName, '" eval "', evalString, '"'.
	[ :job |
		| p |
		job title: 'Loading project'.
		p := OSProcess command: command.
		[ p isComplete ] whileFalse: [ 
			job increment.
			1 second asDelay wait ] ] asJob run