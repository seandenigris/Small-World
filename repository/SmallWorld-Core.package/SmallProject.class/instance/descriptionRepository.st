magritte
descriptionRepository
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 200;
		accessor: #repository;
		classes: { ZnUrl }, AbstractFileReference allSubclasses, SmallRemoteGitRepository allSubclasses;
		initializer: [ :repo | repo projectName: self name ];
		beRequired;
		yourself