*SmallWorld-Core
swDescription

	^ MADirectoryDescription new
		priority: 200;
		accessor: #repository;
		kind: AbstractFileReference;
		beRequired;
		yourself