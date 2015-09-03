magritte
descriptionHasMetacelloConfiguration
	<magritteDescription>

	^ MABooleanDescription new
		priority: 250;
		label: 'Has Metacello Configuration?';
		accessor: #hasMetacelloConfiguration;
		beReadonly;
		beRequired;
		yourself