baselines
baselineLoadSnippet
	| template |
	template := 'baseline: ''{projectName}'' with: [
				spec repository: ''{repoURL}'' ]'.
	^ template format: { 
			#projectName -> (self name copyWithout: Character space).
			#repoURL -> self repository directDownloadURL } asDictionary