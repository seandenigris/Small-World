Class {
	#name : #SmallRemoteGitRepository,
	#superclass : #SmallRepository,
	#instVars : [
		'user',
		'codeSubfolder',
		'hasProjectMetadata',
		'isUpstream',
		'defaultBranch'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #adding }
SmallRemoteGitRepository >> addRemote: urlString as: nameString [
	"Assumes repo is loaded"
	
	| repo remote |
	repo := IceRepository registry detect: [ :e | e name = self projectName ].
	remote := IceGitRemote name: nameString url: urlString.
	repo addRemote: remote.
	remote fetch
]

{ #category : #accessing }
SmallRemoteGitRepository >> codeSubfolder [
	^ codeSubfolder
]

{ #category : #accessing }
SmallRemoteGitRepository >> codeSubfolder: aString [
	codeSubfolder := aString
]

{ #category : #accessing }
SmallRemoteGitRepository >> defaultBranch [
	^ self maLazyFrom: self descriptionDefaultBranch
]

{ #category : #accessing }
SmallRemoteGitRepository >> defaultBranch: anObject [
	defaultBranch := anObject
]

{ #category : #accessing }
SmallRemoteGitRepository >> defaultUser [
	self subclassResponsibility
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionCodeSubfolder [
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 100;
		accessor: #codeSubfolder;
		morphClass: MADropListMorph;
		options: #('src' 'source' 'repository' 'packages');
		yourself
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionDefaultBranch [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #defaultBranch;
		default: 'master';
		yourself
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionHasProjectMetadata [
	<magritteDescription>

	^ MABooleanDescription new
		priority: 400;
		accessor: #hasProjectMetadata;
		default: false;
		yourself
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionIsUpstream [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #isUpstream;
		label: 'Upstream?';
		comment: 'Is this someone else''s project that you''ve forked?';
		default: false;
		yourself
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionSyncForkScript [
	<gtInspectorPresentationOrder: 200>

	| result |
	result := MAMemoDescription new
			accessor: #syncForkScript;
			yourself.
	self isUpstream ifFalse: [ result glmPresentation: nil ].
	^ result
]

{ #category : #magritte }
SmallRemoteGitRepository >> descriptionUser [
	<magritteDescription>

	^ MAStringDescription new
		priority: 200;
		accessor: #user;
		default: self defaultUser;
		beRequired;
		yourself
]

{ #category : #accessing }
SmallRemoteGitRepository >> directDownloadURL [

	| scheme url path |
	scheme := self hostname copyUpTo: $..
	path := self projectName.
	self defaultBranch = self descriptionDefaultBranch default ifFalse: [ path := path, ':', self defaultBranch ].
	url := ZnUrl new
		scheme: scheme;
		host: self workingUser;
		addPathSegment: path;
		yourself.
	self hasProjectMetadata ifTrue: [ ^ url ].
	^ self codeSubfolder
			ifNotNil: [ :folder | url / folder ]
			ifNil: [ url ].
]

{ #category : #accessing }
SmallRemoteGitRepository >> hasProjectMetadata [
	^ self maLazyFrom: self descriptionHasProjectMetadata
]

{ #category : #accessing }
SmallRemoteGitRepository >> hasProjectMetadata: anObject [
	hasProjectMetadata := anObject
]

{ #category : #accessing }
SmallRemoteGitRepository >> hostname [
	self subclassResponsibility
]

{ #category : #accessing }
SmallRemoteGitRepository >> isUpstream [
	^ self maLazyFrom: self descriptionIsUpstream
]

{ #category : #accessing }
SmallRemoteGitRepository >> isUpstream: anObject [
	isUpstream := anObject
]

{ #category : #accessing }
SmallRemoteGitRepository >> localCloneFolder [
	| safeProjectName |
	safeProjectName := self projectName copyReplaceAll: ' ' with: '-'.
	^ FileLocator home / 'Dynabook' / 'Repositories' / self user asLowercase / safeProjectName
]

{ #category : #accessing }
SmallRemoteGitRepository >> localCloneFolderForUser: userString [
	| safeProjectName |
	safeProjectName := self projectName copyReplaceAll: ' ' with: '-'.
	^ FileLocator home / 'Dynabook' / 'Repositories' / userString asLowercase / safeProjectName
]

{ #category : #accessing }
SmallRemoteGitRepository >> localCloneURL [
	^ '''filetree://'', (', self localSourceFolder storeString, ') fullName'
]

{ #category : #accessing }
SmallRemoteGitRepository >> localSourceFolder [
	^ self codeSubfolder
			ifNil: [ self localCloneFolder ]
			ifNotNil: [ :subfolder | self localCloneFolder / subfolder ]
]

{ #category : #accessing }
SmallRemoteGitRepository >> metacelloURLFor: project [
	^ project isPrivate 
			ifTrue: [ self localCloneURL ]
			ifFalse: [ self directDownloadURL surroundedBySingleQuotes ]
]

{ #category : #accessing }
SmallRemoteGitRepository >> printOn: aStream [
	aStream
		nextPutAll: self url asString;
		nextPutAll: ' Repo'
]

{ #category : #accessing }
SmallRemoteGitRepository >> projectPath [
	^ self projectName copyReplaceAll: ' ' with: '-'
]

{ #category : #adding }
SmallRemoteGitRepository >> scriptToAddRemote: urlString as: nameString [
	| method transformer |
	method := SmallRemoteGitRepository>>#addRemote:as:.
	transformer := method parseTree peTransformer
		beScript;
		addStatementFirst: #projectName , ' := ' , self projectName printString;
		addStatementFirst: #nameString , ' := ' , nameString printString;
		addStatementFirst: #urlString , ' := ' , urlString printString;
		replaceNodesSelect: [ :e | e isMessage and: [ e selector = #projectName ] ]
			withNode: (RBVariableNode named: #projectName).
	^ transformer newSource
]

{ #category : #'as yet unclassified' }
SmallRemoteGitRepository >> scriptToAddUpstreamRemote [
	^ self scriptToAddRemote: self sshUpstreamUrl as: 'upstream'.
]

{ #category : #accessing }
SmallRemoteGitRepository >> sshCloneUrl [
	^ self sshUrlForUserNamed: self workingUser
]

{ #category : #accessing }
SmallRemoteGitRepository >> sshUpstreamUrl [
	^ self sshUrlForUserNamed: self user
]

{ #category : #accessing }
SmallRemoteGitRepository >> sshUrlForUserNamed: aString [
	^ 'git@', self hostname, ':', aString, '/', self projectPath, '.git'
]

{ #category : #actions }
SmallRemoteGitRepository >> syncFork [
	| commandTemplate command |
	self isUpstream ifFalse: [ self error: 'No fork to sync!' ].
	"To actually run this with LibC, prepend a `cd` into an appropriate direcdtory and then squash into one line separated by semicolons. I personally like to run in a Terminal window so I can see the output"
	Clipboard clipboardText: self syncForkScript.
	UIManager inform: 'Sync command copied to clipboard'.
]

{ #category : #accessing }
SmallRemoteGitRepository >> syncForkScript [
	| commandTemplate |
	commandTemplate := 'git clone git@github.com:{defaultUser}/{projectName}.git
cd {projectName}/
git remote add upstream {sshUpstreamUrl}
git fetch upstream
git merge upstream/master
git push origin master
'.
	^ commandTemplate format: { 
			#defaultUser -> self defaultUser.
			#projectName -> self projectName.
			#sshUpstreamUrl -> self sshUpstreamUrl } asDictionary.
]

{ #category : #accessing }
SmallRemoteGitRepository >> url [
	^ super url
			addPathSegment: self user;
			addPathSegment: self projectPath;
			yourself.
]

{ #category : #accessing }
SmallRemoteGitRepository >> user [
	^ self maLazyFrom: self descriptionUser
]

{ #category : #accessing }
SmallRemoteGitRepository >> user: anObject [
	user := anObject
]

{ #category : #accessing }
SmallRemoteGitRepository >> workingUser [
	"If we've forked, all downloads, clones, etc. should come from the fork"
	^ self isUpstream ifTrue: [ self defaultUser ] ifFalse: [ self user ].
]
