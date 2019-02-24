private
putInstVarNamed: aString On: aWriteStream unlessDefault: anObject

	| value |
	value := self instVarNamed: aString.
	value = anObject ifTrue: [ ^ self ].
	
	aWriteStream
		cr; tab; tab;
		nextPutAll: aString;
		nextPut: $:;
		space;
		nextPutAll: value swConstructorString;
		nextPut: $;