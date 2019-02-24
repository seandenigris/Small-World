as yet unclassified
setupScriptContents

	| scriptMethod sourceString sourceStringWithBracketsStripped |
	scriptContents ifNotNil: [ :sc | ^ sc ].
	scriptMethod := self class compiledMethodAt: #setupScript.
	sourceString := scriptMethod methodNode body asString.
	sourceStringWithBracketsStripped := sourceString copyFrom: 3 to: sourceString size - 2.
	^ sourceStringWithBracketsStripped.