Class {
	#name : #SmallLoadScript,
	#superclass : #SmallScript,
	#instVars : [
		'debug',
		'loads',
		'project',
		'projectVersion',
		'whatToLoad',
		'loadConfigurationOnly',
		'conflictBlock'
	],
	#category : 'SmallWorld-Core-Scripts'
}

{ #category : #'instance creation' }
SmallLoadScript class >> building: aSmallProject [ 

	^ self new project: aSmallProject.
]

{ #category : #'as yet unclassified' }
SmallLoadScript class >> defaultProjectVersion [
	self subclassResponsibility
]

{ #category : #configuring }
SmallLoadScript >> asString [

	^ String streamContents: [ :str |
		self printConfigurationLoadStatementOn: str.
		loadConfigurationOnly ifFalse: [ self printLoadStatementsOn: str ].
		shouldSave | shouldQuit ifTrue: [ self printSnaphotStatementOn: str ] ].
]

{ #category : #converting }
SmallLoadScript >> beDebug [

	debug := true.
]

{ #category : #accessing }
SmallLoadScript >> conflictBlock [
	^ self maLazyFromDescriptionOf: #conflictBlock
]

{ #category : #accessing }
SmallLoadScript >> conflictBlock: anObject [
	conflictBlock := anObject
]

{ #category : #'as yet unclassified' }
SmallLoadScript >> descriptionConflictBlock [
	<magritteDescription>

	^ MABlockDescription new
		priority: 250;
		default: [ :ex | ex allow ];
		accessor: #conflictBlock;
		yourself
]

{ #category : #magritte }
SmallLoadScript >> descriptionContents [
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Contents';
			accessor: #asString;
			glmPresentation: [ :a | a pharoScript ];
			yourself
]

{ #category : #debugging }
SmallLoadScript >> initialize [

	super initialize.
	loads := OrderedCollection new.
	whatToLoad := 'default'.
	loadConfigurationOnly := false.
]

{ #category : #testing }
SmallLoadScript >> isSmallProjectLoaded [
	| registration |
	registration := MetacelloProjectRegistration registry 
		registrationForClassNamed: self configurationName
		ifAbsent: [ ^ false ].
	^ registration loadedInImage
]

{ #category : #configuring }
SmallLoadScript >> loadingVersion: aString [ 

	projectVersion := aString.
]

{ #category : #private }
SmallLoadScript >> printConfigurationLoadStatementOn: aStream [

	| loadTemplate loadParameters loadCommand |
	project repository ifNil: [ ^ self ].
	loadTemplate := 'Gofer it
	{1};
	package: {2};
	load.'.
	loadParameters := Array
		with: project repository 
		with: project configurationName surroundedBySingleQuotes.
	loadCommand := loadTemplate format: loadParameters.
	aStream nextPutAll: loadCommand; cr.
]

{ #category : #printing }
SmallLoadScript >> printOn: aStream [

	aStream nextPutAll: self asString.
]

{ #category : #private }
SmallLoadScript >> printSnaphotStatementOn: aStream [

	 "aStream nextPutAll: 'Smalltalk snapshot: ', shouldSave asString, ' andQuit: ', shouldQuit asString, '.' "
]

{ #category : #accessing }
SmallLoadScript >> project [
	^ project
]

{ #category : #private }
SmallLoadScript >> project: aSmallProject [ 

	project := aSmallProject.
]

{ #category : #accessing }
SmallLoadScript >> projectVersion [
	^ projectVersion ifNil: [ projectVersion := self class defaultProjectVersion ]
]

{ #category : #'initialize-release' }
SmallLoadScript >> projectVersion: aSymbol loading: anObject [
	"
	aSymbol - a symbolic Metacello version (e.g. #bleedingEdge | #stable | #development)
	anObject - can be a group or package name, or a collection thereof"

	projectVersion := aSymbol.
	whatToLoad := anObject.
]

{ #category : #'initialize-release' }
SmallLoadScript >> quitting: aBoolean [

	shouldQuit := aBoolean.
	
]

{ #category : #'initialize-release' }
SmallLoadScript >> saving: aBoolean [

	shouldSave := aBoolean.
	
]
