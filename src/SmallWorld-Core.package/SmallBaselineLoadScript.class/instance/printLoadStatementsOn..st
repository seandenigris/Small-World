printing
printLoadStatementsOn: aStream

	self repository ifNil: [ ^ self ].
	self printLoadOn: aStream.
	aStream crlf.
	aStream nextPutAll: self postLoadDoIt.