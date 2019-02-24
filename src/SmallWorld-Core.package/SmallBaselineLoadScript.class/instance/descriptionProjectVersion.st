Magritte
descriptionProjectVersion
	<magritteDescription>

	^ MAStringDescription new
		priority: 100;
		accessor: #projectVersion;
		default: 'master';
		beRequired;
		yourself