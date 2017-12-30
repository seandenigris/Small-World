printing
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''filetree://'', ({localSourceFolder}) fullName;
	onConflict: [ :ex | ex allow ];
	load.'.
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#localSourceFolder -> self localSourceFolder storeString 	
		}
		on: aStream