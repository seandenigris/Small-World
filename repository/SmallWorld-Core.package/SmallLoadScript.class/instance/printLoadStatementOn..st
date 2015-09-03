private
printLoadStatementOn: aStream 
		 
	| projectLoadTemplate projectLoadString |
	projectLoadTemplate :='((Smalltalk at: {1}) project version: {2}) load: {3}.'.
	projectLoadString := projectLoadTemplate format: { 
		project configurationName asSymbol printString.
		self projectVersionString.
		whatToLoad asMetacelloLoadableString }.
	aStream nextPutAll: projectLoadString; cr. 