configuring
asString

	^ String streamContents: [ :str |
		self printConfigurationLoadStatementOn: str.
		loadConfigurationOnly ifFalse: [ self printLoadStatementOn: str ].
		shouldSave | shouldQuit ifTrue: [ self printSnaphotStatementOn: str ] ].