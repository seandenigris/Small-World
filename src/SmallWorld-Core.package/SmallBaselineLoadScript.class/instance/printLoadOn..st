printing
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''{repositoryURL}'';
	onConflict: {conflictBlock};
	load.'.
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#repositoryURL -> self repository directDownloadURL.
			#conflictBlock -> self conflictBlock 	
		}
		on: aStream