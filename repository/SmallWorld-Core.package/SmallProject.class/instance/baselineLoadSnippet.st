as yet unclassified
baselineLoadSnippet
	| template |
	template := 'baseline: ''{projectName}'' with: [
				spec repository: ''{repoURL}'' ]'.
	^ template format: { 
			#projectName -> self camelCaseName.
			#repoURL -> self repository directDownloadURL } asDictionary