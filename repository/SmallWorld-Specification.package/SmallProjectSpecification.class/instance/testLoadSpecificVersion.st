as yet unclassified
testLoadSpecificVersion

	| project script |
	project := SmallMetacelloProject named: 'Versionner'.
	project repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference.

	script := project loadScript loadingVersion: '1.9'.
	
	script asString trimBoth should = '
Gofer it
	directory: ''/Volumes/Fast/Squeak/Repositories/External Package Extensions'';
	package: ''ConfigurationOfVersionner'';
	load.
((Smalltalk at: #ConfigurationOfVersionner) project version: ''1.9'') load: ''default''.' trimBoth.