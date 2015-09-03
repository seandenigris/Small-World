magritte
descriptionTestPackages
	<magritteDescription>

	^ MAToManyRelationDescription new
		priority: 287;
		label: 'Test Packages';
		accessor: #testPackageNames;
		classes: { ByteString };
		yourself