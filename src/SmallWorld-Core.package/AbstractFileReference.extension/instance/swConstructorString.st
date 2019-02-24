*SmallWorld-Core
swConstructorString

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