printing
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''filetree://'', (repoFolder / ''{codeSubfolder}'') fullName;
	onConflict: [ :ex | ex allow ];
	load.'.
	self
		printTemplate: template
		format: { 
			#baselineName -> self baselineName.
			#codeSubfolder -> self project repository codeSubfolder }
			on: aStream