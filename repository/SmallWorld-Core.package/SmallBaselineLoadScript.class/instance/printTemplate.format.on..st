as yet unclassified
printTemplate: aString format: convertibleToDictionary on: aStream
	| filled |
	filled := aString
		format: convertibleToDictionary asDictionary.
	aStream
		nextPutAll: filled;
		cr