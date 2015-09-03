*SmallWorld-Core
swDescription

	^ MADirectoryDescription new
		priority: 200;
		label: 'Repository';
		accessor: #repository;
		kind: AbstractFileReference;
		beRequired;
		yourself