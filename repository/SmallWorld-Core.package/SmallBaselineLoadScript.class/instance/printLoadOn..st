as yet unclassified
printLoadOn: aStream 

	| template |
	template := 'Metacello new
	repository: ''filetree://'', FileLocator imageDirectory fullName, ''/{projectPath}/repository'';
	baseline: ''{baselineName}'';
	onConflict: [ :ex | ex allow ];
	load.'.
	self
		printTemplate: template
		format: {
			#projectPath -> self project repository projectPath.
			(#baselineName -> (self project name copyWithout: Character space)) }
		on: aStream