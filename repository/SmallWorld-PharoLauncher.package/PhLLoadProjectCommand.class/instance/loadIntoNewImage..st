action
loadIntoNewImage: project

	| loadScript evalString image |
	Halt now.
	image := context imageRepository images detect: [ :e | e name = newImageName ].
	loadScript := project loadScript
	quitting: true;
	saving: true;
	yourself.
	evalString := loadScript asString withLineEndings: ' '.
	image launch: '' vmOptions: '--headless' imageOptions: 'eval "', evalString, '"'