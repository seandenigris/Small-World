as yet unclassified
testLoadDevelopmentVersion

	| project script |
	project := SmallMetacelloProject named: 'Versionner'.
	project repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference.

	script := project loadScript loadingDevelopment.
	
	script asString trimBoth should = '
Gofer it
	directory: ''/Volumes/Fast/Squeak/Repositories/External Package Extensions'';
	package: ''ConfigurationOfVersionner'';
	load.
((Smalltalk at: #ConfigurationOfVersionner) project version: #''development'') load: ''default''.' trimBoth.