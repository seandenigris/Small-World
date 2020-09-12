Class {
	#name : #SmallProject,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'repository',
		'loadScript',
		'isPrivate',
		'supportedImages',
		'isObsolete'
	],
	#classInstVars : [
		'projects'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #private }
SmallProject class >> localRepositoryRoot [

	^ FileLocator home / 'Dynabook' / 'Repositories'.
]

{ #category : #'world menu' }
SmallProject class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Small World')
		with: [
			(aBuilder item: #'Add Project')
				action: [ self add ]; 
				icon: Smalltalk ui icons add.
			(aBuilder item: #'Save Project Catalog')
				action: [ SmallWorldDB saveRepository ]; 
				icon: Smalltalk ui icons glamorousSaveIcon.
			(aBuilder item: #'Project Inspector')
				action: [ self projects inspect ]; 
				icon: Smalltalk ui icons smallLoadProjectIcon. ]
]

{ #category : #'instance creation' }
SmallProject class >> named: aString [ 

	^ self new
			name: aString;
			yourself
]

{ #category : #'instance creation' }
SmallProject class >> projects [

	^ projects ifNil: [ projects := SortedCollection sortBlock: [ :a :b | a name < b name ] ].
]

{ #category : #persistence }
SmallProject class >> restoreFrom: anObject [

	projects := anObject.
]

{ #category : #persistence }
SmallProject class >> spData [

	^ projects
]

{ #category : #comparing }
SmallProject >> <= rhs [
	^ self name <= rhs name
]

{ #category : #accessing }
SmallProject >> allSmalltalkImages [
	"See #glAsSmalltalkImagesStoreString re how this list was created"
		
	^ #('GemStone-3.1.0.6' 'GemStone-3.2.12' 'GemStone-3.3.0' 'Moose-6.0' 'Moose-6.1' 'Moose-trunk' 'Pharo-3.0' 'Pharo-4.0' 'Pharo-5.0' 'Pharo-6.0' 'Pharo-6.1' 'Pharo-7.0' 'Pharo-alpha' 'Pharo-stable' 'Pharo64-6.0' 'Pharo64-6.1' 'Pharo64-7.0' 'Pharo64-alpha' 'Pharo64-stable' 'Squeak-4.5' 'Squeak-4.6' 'Squeak-5.0' 'Squeak-5.1' 'Squeak-trunk' )
]

{ #category : #baselines }
SmallProject >> baselineLoadSnippet [
	| template |
	template := 'baseline: ''{projectName}'' with: [
				spec repository: ''{repoURL}'' ]'.
	^ template format: { 
			#projectName -> (self name copyWithout: Character space).
			#repoURL -> self repository directDownloadURL } asDictionary
]

{ #category : #actions }
SmallProject >> cloneOpenConsole [
	LibC system: 'open -a Terminal ', self repository localCloneFolder fullName surroundedByDoubleQuotes
]

{ #category : #actions }
SmallProject >> copyLoadScriptFrom: existingProject [
	"Helpful temporarily because of Magritte bug which prevents load script being saved in MA form (related to defaults)"

	self loadScript: (existingProject loadScript copy
		project: self;
		yourself)
]

{ #category : #Metacello }
SmallProject >> createBaselineBoilerplate [
	MetacelloToolBox 
	createBaselineOf: self name asCamelCase
	requiredProjects: #()
	packages: #()
	repositories: #()
	dependencies: #()
	groups: #()
]

{ #category : #accessing }
SmallProject >> description [
	^ description
]

{ #category : #accessing }
SmallProject >> description: anObject [
	description := anObject
]

{ #category : #magritte }
SmallProject >> descriptionCloneConsole [
	<magritteActionDescription>
	
	^ MAActionDescription new
			action: #forkCloneOpenConsole;
			label: 'Fork - Open Console';
			isMutator: false;
			shortcut: $f asShortcut;
			icon: #glmOpenFromURL;
			yourself
]

{ #category : #magritte }
SmallProject >> descriptionCopyBaselineLoadSnippet [
	<magritteActionDescription>
	^ MAActionDescription new
		priority: 150;
		label: 'Copy Baseline Load Snippet';
		action: [ Clipboard clipboardText: self baselineLoadSnippet ];
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionDescription [
	<magritteDescription>

	^ MAMemoDescription new
		priority: 125;
		accessor: #description;
		lineCount: 5;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionGtCustomizationScript [
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #gtCustomizationScript;
		readonly: true;
		priority: 500;
		lineCount: 5;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionHasMetacelloConfiguration [
	<magritteDescription>
	^ MABooleanDescription new
		priority: 250;
		accessor: #hasMetacelloConfiguration;
		beReadOnly;
		beRequired;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionIsPrivate [
	<magritteDescription>

	^ MABooleanDescription new
		priority: 275;
		accessor: #isPrivate;
		beRequired;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionLoadScript [
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 350;
		accessor: #loadScript;
		initializer: [ :e | e project: self ];
		classes: SmallLoadScript allSubclasses;
		"beRequired;
		"yourself
]

{ #category : #magritte }
SmallProject >> descriptionName [
	<magritteDescription>

	^ MAStringDescription new
		priority: 100;
		accessor: #name;
		beRequired;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionRepository [
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 200;
		accessor: #repository;
		classes: { ZnUrl }, AbstractFileReference allSubclasses, SmallRemoteGitRepository allSubclasses;
		initializer: [ :repo | repo project: self ];
		beRequired;
		yourself
]

{ #category : #magritte }
SmallProject >> descriptionRepositoryView [
	<magritteActionDescription>
	
	^ MAActionDescription new
			action: [ :target | target repository view ];
			label: 'Open Repository';
			isMutator: false;
			shortcut: $r asShortcut;
			icon: #glmOpenFromURL;
			yourself
]

{ #category : #magritte }
SmallProject >> descriptionSupportedImages [
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #supportedImages;
		priority: 250;
		options: self allSmalltalkImages;
		morphClass: MATokenCompletionMorph;
		yourself
]

{ #category : #accessing }
SmallProject >> displayText [
	| result |
	result := self name asText.
	self isObsolete
		ifTrue: [ result addAttribute: TextEmphasis struckOut ].
	^ result
]

{ #category : #actions }
SmallProject >> forkCloneOpenConsole [
	| myUsername |
	myUsername := 'seandenigris'.
	LibC system: 'open -a Terminal ', (self repository localCloneFolderForUser: myUsername) fullName surroundedByDoubleQuotes
]

{ #category : #accessing }
SmallProject >> gtCustomizationScript [
	"Preserve your play pages when you move to a new image. To automate, place in a MetaC postload e.g. `spec for: #'common' do: [ spec postLoadDoIt: #'postLoad'. ]`"
	| template |
	template := '	| rootFolder |
	rootFolder := FileLocator dynabookData / ''{projectName}''.
	GTPlayBook 
		cacheDirectory: (rootFolder / ''play-cache'') ensureCreateDirectory;
		stashDirectory: (rootFolder / ''play-stash'') ensureCreateDirectory.
	Smalltalk globals
		at: #XdPlaygroundSettings
		ifPresent: [ :cls | cls directory: (rootFolder / ''xdocs'') ensureCreateDirectory ]'.
	^ template format: { #projectName -> self name } asDictionary
]

{ #category : #testing }
SmallProject >> hasMetacelloConfiguration [

	^ self isKindOf: SmallMetacelloProject.
]

{ #category : #testing }
SmallProject >> isLoaded [
	^ self loadScript isSmallProjectLoaded
]

{ #category : #accessing }
SmallProject >> isObsolete [
	^ self maLazyFrom: self isObsoleteDescription
]

{ #category : #accessing }
SmallProject >> isObsolete: anObject [
	isObsolete := anObject
]

{ #category : #'magritte-accessing' }
SmallProject >> isObsoleteDescription [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #isObsolete;
		default: false;
		yourself
]

{ #category : #testing }
SmallProject >> isPrivate [
	^ isPrivate
]

{ #category : #accessing }
SmallProject >> isPrivate: anObject [
	isPrivate := anObject
]

{ #category : #accessing }
SmallProject >> loadScript [
	^ loadScript
]

{ #category : #accessing }
SmallProject >> loadScript: anObject [
	loadScript := anObject
]

{ #category : #accessing }
SmallProject >> localFolderName [
	^ self name copyReplaceAll: ' ' with: '-'
]

{ #category : #Metacello }
SmallProject >> metacelloURL [
	^ self repository metacelloURLFor: self
]

{ #category : #accessing }
SmallProject >> name [

	^ name ifNil: [ name := '' ].
]

{ #category : #private }
SmallProject >> name: aString [ 

	name := aString.
]

{ #category : #accessing }
SmallProject >> onSmalltalkHubUser: aString [

	self onSmalltalkHubUser: aString repository: name
]

{ #category : #accessing }
SmallProject >> onSmalltalkHubUser: userString repository: repoString [

	self repository: ('http://smalltalkhub.com/mc/', userString, '/', repoString, '/main/') asUrl.
]

{ #category : #accessing }
SmallProject >> onSqueaksource [

	self repository: 'http://squeaksource.com/MetacelloRepository' asUrl.
]

{ #category : #accessing }
SmallProject >> onSqueaksource3 [

	self repository: ('http://ss3.gemstone.com/ss/', name) asUrl.
]

{ #category : #printing }
SmallProject >> printOn: aStream [

	aStream nextPutAll: name asString, ' Project'.
]

{ #category : #private }
SmallProject >> putInstVarNamed: aString On: aWriteStream unlessDefault: anObject [

	| value |
	value := self instVarNamed: aString.
	value = anObject ifTrue: [ ^ self ].
	
	aWriteStream
		cr; tab; tab;
		nextPutAll: aString;
		nextPut: $:;
		space;
		nextPutAll: value swConstructorString;
		nextPut: $;
]

{ #category : #private }
SmallProject >> putInstVarsOn: aWriteStream [ 

	self putInstVarNamed: 'repository' On: aWriteStream unlessDefault: nil.
	self putInstVarNamed: 'description' On: aWriteStream unlessDefault: ''.
]

{ #category : #baselines }
SmallProject >> releaserProject [
	| template |
	template := 'BaselineOf{projectName} gtRlProjectWithRepository: ''{repoURL}'''.
	^ template
		format:
			{(#projectName -> (self name copyWithout: Character space)).
			(#repoURL -> self repository directDownloadURL)} asDictionary
]

{ #category : #accessing }
SmallProject >> remoteLoadSnippet [
	"Adapted from https://github.com/dalehenrich/metacello-work#pharo30-pharo40-and-pharo50"
	| template |
	template := 'Metacello new
	baseline: ''{projectName}'';
	repository: ''{repoURL}'';
	onConflict: [ :ex | ex allow ];
	load.'.
	^ template format: { 
			#projectName -> (self name copyWithout: Character space).
			#repoURL -> self repository directDownloadURL } asDictionary
]

{ #category : #accessing }
SmallProject >> repository [
	
	^ repository.
]

{ #category : #accessing }
SmallProject >> repository: anObject [
	"anObject - a URL or aFileReference"

	repository := anObject.
]

{ #category : #saving }
SmallProject >> save [

	| source |
	source := String streamContents: [ :str |
		str
			nextPutAll: name asLegalSelector;
			cr; cr;
			tab;
			nextPutAll: '^ (';
			nextPutAll: 'self named: ''';
			nextPutAll: name;
			nextPutAll: ''')'.
		self putInstVarsOn: str.
		str
			cr; tab; tab;
			nextPutAll: 'yourself.' ].
	
	self class class compile: source classified: 'projects'.
]

{ #category : #accessing }
SmallProject >> supportedImages [
	^ self maLazyFrom: self descriptionSupportedImages
]

{ #category : #accessing }
SmallProject >> supportedImages: anObject [
	supportedImages := anObject
]
