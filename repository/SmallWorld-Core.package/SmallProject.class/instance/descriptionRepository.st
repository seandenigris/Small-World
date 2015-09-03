magritte
descriptionRepository
	<magritteDescription>

	^ MAToOneRelationDescription new
		priority: 200;
		label: 'Repository';
		accessor: #repository;
		classes: { ZnUrl }, AbstractFileReference allSubclasses, SmallBitBucketRepository withAllSubclasses;
		beRequired;
		yourself