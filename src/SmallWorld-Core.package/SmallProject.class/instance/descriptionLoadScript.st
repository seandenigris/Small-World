magritte
descriptionLoadScript
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 300;
		accessor: #loadScript;
		initializer: [ :e | e project: self ];
		classes: SmallLoadScript allSubclasses;
		"beRequired;
		"yourself