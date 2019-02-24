Class {
	#name : #PhLLoadProjectCommand,
	#superclass : #PhLCreateImageFromTemplateCommand,
	#instVars : [
		'project'
	],
	#category : 'SmallWorld-PharoLauncher'
}

{ #category : #accessing }
PhLLoadProjectCommand class >> group [
	^ 2
]

{ #category : #accessing }
PhLLoadProjectCommand class >> icon [
	
	^ Smalltalk ui icons packageAddIcon "#monticelloPackageIcon might work too"
]

{ #category : #accessing }
PhLLoadProjectCommand class >> title [
	^ 'Load project into template'
]

{ #category : #action }
PhLLoadProjectCommand >> execute [
	self project ifNil: [ ^ self ].
	super execute.
	self loadProjectIntoNewImage
]

{ #category : #action }
PhLLoadProjectCommand >> loadProjectIntoNewImage [

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
]

{ #category : #accessing }
PhLLoadProjectCommand >> newImageName [
	^ self project name
]

{ #category : #accessing }
PhLLoadProjectCommand >> project [
	^ project ifNil: [ project := self requestProject ]
]

{ #category : #action }
PhLLoadProjectCommand >> requestProject [
	| chooser |
	chooser := ListDialogWindow new
		getList: [ :r | | projects |
			projects := SmallProject projects sort: [ :a :b | a name < b name ].
			projects select: [ :e | r search: e name ] ];
		displayBlock: [ :e | e name ];
		title: 'Select Project' translated;
		yourself.
	 ^ chooser chooseFromOwner: World
]
