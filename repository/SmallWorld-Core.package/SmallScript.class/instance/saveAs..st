saving
saveAs: aFileReference 

	| fixedScript |
	fixedScript := self asString copyReplaceAll: Character cr asString with: Character lf asString.
	aFileReference writeStreamDo: [ :s | s nextPutAll: fixedScript ].