accessing
camelCaseName
	| tokens |
	tokens := self name findTokens: ' '.
	^ String streamContents: [ :str | tokens do: [ :token | str nextPutAll: token asLowercase capitalized ] ]