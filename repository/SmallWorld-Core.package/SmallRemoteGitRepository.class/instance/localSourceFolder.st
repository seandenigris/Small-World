accessing
localSourceFolder
	^ self codeSubfolder
			ifNil: [ self localCloneFolder ]
			ifNotNil: [ :subfolder | self localCloneFolder / subfolder ]