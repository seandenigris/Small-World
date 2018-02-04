printing
printLoadStatementsOn: aStream

	self repository ifNil: [ ^ self ].
	self printGitCloneOn: aStream.
	aStream crlf.
	self printLoadOn: aStream.
	aStream crlf.
	aStream nextPutAll: self postLoadDoIt.