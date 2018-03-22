printing
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''filetree://'', ({localSourceFolder}) fullName;
	onConflict: {conflictBlock};
	load.'.
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#localSourceFolder -> self localSourceFolder storeString.
			#conflictBlock -> self conflictBlock 	
		}
		on: aStream