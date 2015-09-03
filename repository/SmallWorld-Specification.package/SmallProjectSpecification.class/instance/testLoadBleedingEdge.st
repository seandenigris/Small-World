as yet unclassified
testLoadBleedingEdge

	| project |
	project := SmallMetacelloProject named: 'Versionner'.
	project
		repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference;
		beBleedingEdge;
		yourself.

	project loadScript loadsBleedingEdge should beTrue.