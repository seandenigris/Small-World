printing
printLoadStatementsOn: aStream

	self printGitCloneOn: aStream.
	aStream crlf.
	self printLoadOn: aStream.
	aStream crlf.
	aStream nextPutAll: self postLoadDoIt.