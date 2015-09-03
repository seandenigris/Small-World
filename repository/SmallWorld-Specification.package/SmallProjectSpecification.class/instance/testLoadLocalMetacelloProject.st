as yet unclassified
testLoadLocalMetacelloProject

	| project script |
	project := SmallMetacelloProject named: 'Versionner'.
	project repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference.

	script := project loadScript.
	
	script asString trimBoth should = '
Gofer it
	directory: ''/Volumes/Fast/Squeak/Repositories/External Package Extensions'';
	package: ''ConfigurationOfVersionner'';
	load.
((Smalltalk at: #ConfigurationOfVersionner) project version: #''stable'') load: ''default''.' trimBoth.