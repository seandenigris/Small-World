Class {
	#name : #SmallBaselineLoadScript,
	#superclass : #SmallLoadScript,
	#instVars : [
		'baselineName',
		'postLoadDoIt'
	],
	#category : #'SmallWorld-Core-Scripts'
}

{ #category : #'as yet unclassified' }
SmallBaselineLoadScript class >> defaultProjectVersion [
	^ 'master'
]

{ #category : #accessing }
SmallBaselineLoadScript >> baselineName [
	^ baselineName ifNil: [ self project name copyWithout: Character space ]
]

{ #category : #accessing }
SmallBaselineLoadScript >> baselineName: aString [ 
	baselineName := aString
]

{ #category : #accessing }
SmallBaselineLoadScript >> configurationName [
	"To be polymorphic w. Config load script"
	^ self baselineName
]

{ #category : #Magritte }
SmallBaselineLoadScript >> descriptionBaselineName [
	<magritteDescription>

	^ MAStringDescription new
			priority: 300;
			accessor: #baselineName;
			yourself
]

{ #category : #Magritte }
SmallBaselineLoadScript >> descriptionPostLoadDoIt [
	<magritteDescription>

	^ MAMemoDescription new
		priority: 200;
		accessor: #postLoadDoIt;
		yourself
]

{ #category : #Magritte }
SmallBaselineLoadScript >> descriptionProjectVersion [
	<magritteDescription>

	^ MAStringDescription new
		priority: 100;
		accessor: #projectVersion;
		default: 'master';
		beRequired;
		yourself
]

{ #category : #printing }
SmallBaselineLoadScript >> localSourceFolder [
	^ self project repository localSourceFolder
]

{ #category : #accessing }
SmallBaselineLoadScript >> postLoadDoIt [
	^ postLoadDoIt ifNil: [ '' ]
]

{ #category : #accessing }
SmallBaselineLoadScript >> postLoadDoIt: anObject [
	postLoadDoIt := anObject
]

{ #category : #printing }
SmallBaselineLoadScript >> printConfigurationLoadStatementOn: aStream [
	"No-op pending refactor. Don't yet understand the difference bewteen BaselineOf and ConfigurationOf well enough to finalize the API"
]

{ #category : #printing }
SmallBaselineLoadScript >> printFileTreeLoadOn: aStream [ 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''filetree://'', ({localSourceFolder}) fullName;
	onConflict: {conflictBlock};
	load.'.
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#localSourceFolder -> self localSourceFolder storeString.
			#conflictBlock -> self conflictBlock 	
		}
		on: aStream
]

{ #category : #printing }
SmallBaselineLoadScript >> printGitCloneOn: aStream [
	| template |
	template := 'repoFolder := {repoFolder}.
repoFolder exists
	ifFalse: [ 
		LibC system: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		({localSourceFolder}) ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
			#repoFolder -> self repository localCloneFolder storeString.
			#sshCloneUrl -> self repository sshCloneUrl.
			#localSourceFolder -> self localSourceFolder storeString
		}
		on: aStream.
]

{ #category : #printing }
SmallBaselineLoadScript >> printLoadOn: aStream [ 

	| template loadCascade |
	template := 'EpMonitor current disable.
Metacello new
	baseline: ''{baselineName}'';
	repository: ''{repositoryURL}'';
	onConflict: {conflictBlock};
	{loadCascade}.
EpMonitor current enable'.
	
	self flag: 'yuck, but don''t have time to research Metacello API right now to come up with a flexible way to handle this'.
	loadCascade := (#('default' nil) includes: whatToLoad)
		ifTrue: [ 'load' ]
		ifFalse: [ 'load: ', whatToLoad printString ].
		
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#repositoryURL -> self repository directDownloadURL.
			#conflictBlock -> self conflictBlock.
			#loadCascade -> loadCascade
		}
		on: aStream
]

{ #category : #printing }
SmallBaselineLoadScript >> printLoadStatementsOn: aStream [

	self repository ifNil: [ ^ self ].
	self printLoadOn: aStream.
	self postLoadDoIt ifNotNil: [ :pl |
		aStream
			crlf;
			nextPutAll: pl ].
]

{ #category : #printing }
SmallBaselineLoadScript >> printTemplate: aString format: convertibleToDictionary on: aStream [
	| filled |
	filled := aString
		format: convertibleToDictionary asDictionary.
	aStream
		nextPutAll: filled;
		cr
]

{ #category : #accessing }
SmallBaselineLoadScript >> projectVersion: aString [ 
	projectVersion := aString
]

{ #category : #accessing }
SmallBaselineLoadScript >> projectVersionString [
	^ self projectVersion
]

{ #category : #private }
SmallBaselineLoadScript >> repository [
	^ self project repository
]

{ #category : #accessing }
SmallBaselineLoadScript >> smalltalkCIConfigOn: aStream [
	aStream 
		nextPutAll: 'SmalltalkCISpec {
  #preLoading : ''scripts/preLoading.st'', 
  #loading : [
    SCIMetacelloLoadSpec {
      #baseline : ';
		print: self baselineName;
		nextPutAll: ',
      #directory : ';
			print: self repository codeSubfolder;
			nextPutAll: ',
      #platforms : [ #pharo ]
    }
  ]
}'
]
