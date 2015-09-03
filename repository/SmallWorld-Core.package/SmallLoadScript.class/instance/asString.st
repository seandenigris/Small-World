configuring
asString

	^ String streamContents: [ :str |
		self printConfigurationLoadStatementOn: str.
		loadConfigurationOnly ifFalse: [ self printLoadStatementsOn: str ].
		shouldSave | shouldQuit ifTrue: [ self printSnaphotStatementOn: str ] ].