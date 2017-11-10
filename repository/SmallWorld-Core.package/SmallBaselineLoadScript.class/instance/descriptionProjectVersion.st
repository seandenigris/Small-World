Magritte
descriptionProjectVersion
	<magritteDescription>

	^ MAStringDescription new
		priority: 100;
		label: 'Project version';
		accessor: #projectVersion;
		default: 'master';
		beRequired;
		yourself