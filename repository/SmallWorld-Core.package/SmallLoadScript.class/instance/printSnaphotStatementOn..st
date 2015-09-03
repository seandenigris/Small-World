private
printSnaphotStatementOn: aStream

	 aStream nextPutAll: 'Smalltalk snapshot: ', shouldSave asString, ' andQuit: ', shouldQuit asString, '.' 