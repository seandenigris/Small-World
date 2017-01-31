as yet unclassified
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	baseline: ''{baselineName}'';
	repository: ''filetree://'', (repoFolder / ''repository'') fullName;
	onConflict: [ :ex | ex allow ];
	load.'.
	self
		printTemplate: template
		format: {
			#projectPath -> self project repository projectPath.
			#baselineName -> self baselineName }
		on: aStream