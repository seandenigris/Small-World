magritte
descriptionRepository
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 200;
		label: 'Repository';
		accessor: #repository;
		classes: { ZnUrl }, AbstractFileReference allSubclasses, SmallRemoteGitRepository allSubclasses;
		beRequired;
		yourself