as yet unclassified
createSetupScript

	FileStream forceNewFileNamed: self setupScriptPath do: [ :str |
		str nextPutAll: self setupScriptContents ]