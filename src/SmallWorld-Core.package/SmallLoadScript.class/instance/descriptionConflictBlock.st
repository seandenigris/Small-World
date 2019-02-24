as yet unclassified
descriptionConflictBlock
	<magritteDescription>

	^ MABlockDescription new
		priority: 250;
		default: [ :ex | ex allow ];
		accessor: #conflictBlock;
		yourself