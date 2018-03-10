magritte
descriptionProject
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 250;
		accessor: #project;
		options: SmallProject projects;
		beExtensible;
		morphClass: MATokenCompletionMorph;
		beReadonly;
		yourself