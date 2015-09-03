action
loadProjectIntoNewImage

	| evalString image command |
	image := context imageRepository images detect: [ :e | e name = self newImageName ].
	evalString := self project loadScript asString withLineEndings: ' '.
	command := Smalltalk vm fullPath asString, ' --headless "', image file fullName, '" eval --save "', evalString, '"  > /tmp/launcherLoad', self newImageName, '.log'. "It seems we need to redirect output to a file otherwise the command never completes; possibly related to the pipe being full and blocking"
	[ :job |
		| p |
		job title: 'Loading project'.
		p := OSProcess command: command.
		[ p isComplete ] whileFalse: [ 
			job increment.
			1 second asDelay wait ] ] asJob run