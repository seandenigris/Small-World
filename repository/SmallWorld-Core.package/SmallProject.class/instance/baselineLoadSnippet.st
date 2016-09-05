as yet unclassified
baselineLoadSnippet
	| template |
	template := 'baseline: ''{projectName}'' with: [
				spec repository: ''{repoURL}'' ]'.
	^ template format: { 
			#projectName -> self name.
			#repoURL -> self repository directDownloadURL } asDictionary