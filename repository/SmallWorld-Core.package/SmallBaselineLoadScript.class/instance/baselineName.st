accessing
baselineName
	| tokens |
	baselineName ifNotNil: [ ^ baselineName ].
	tokens := self project name findTokens: ' '.
	^ baselineName := String streamContents: [ :str | 
	tokens do: [ :token | str nextPutAll:  token asLowercase capitalized ] ]