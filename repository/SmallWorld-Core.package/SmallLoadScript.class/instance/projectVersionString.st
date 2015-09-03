private
projectVersionString
	
	^ String streamContents: [ :str |
		projectVersion isSymbol ifTrue: [ str nextPut: $# ].
		str nextPutAll: projectVersion surroundedBySingleQuotes ].