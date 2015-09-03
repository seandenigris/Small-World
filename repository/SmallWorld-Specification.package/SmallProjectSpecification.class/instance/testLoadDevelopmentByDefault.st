as yet unclassified
testLoadDevelopmentByDefault

	| project |
	project := SmallMetacelloProject named: 'Versionner'.
	project
		repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference;
		beDevelopment;
		yourself.

	project loadScript loadsDevelopment should beTrue.