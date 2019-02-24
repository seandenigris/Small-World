Extension { #name : #AbstractFileReference }

{ #category : #'*SmallWorld-Core' }
AbstractFileReference >> addToGofer: aGofer [ 

	aGofer directory: self.
]

{ #category : #'*SmallWorld-Core' }
AbstractFileReference >> goferLoadCascade [
	^ 'directory: ', self asGoferString surroundedBySingleQuotes
]

{ #category : #'*SmallWorld-Core' }
AbstractFileReference >> goferRepositorySetter [

	^ #directory:.
]

{ #category : #'*SmallWorld-Core' }
AbstractFileReference >> swConstructorString [

	| isLocalRepository |
	isLocalRepository := SmallProject localRepositoryRoot contains: self.
	^ isLocalRepository
		ifTrue: [ | relativePath |
			relativePath := self relativeTo: SmallProject localRepositoryRoot.
			String streamContents: [ :str |
				str nextPutAll: 'self localRepositoryRoot'.
				relativePath do: [ :segment |
					str
						nextPutAll: ' / ';
						nextPutAll: segment surroundedBySingleQuotes ] ] ]
		ifFalse: [ self fullName surroundedBySingleQuotes, ' asFileReference' ].
]

{ #category : #'*SmallWorld-Core' }
AbstractFileReference >> swDescription [

	^ MADirectoryDescription new
		priority: 200;
		accessor: #repository;
		kind: AbstractFileReference;
		beRequired;
		yourself
]
