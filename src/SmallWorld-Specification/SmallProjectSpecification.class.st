Class {
	#name : #SmallProjectSpecification,
	#superclass : #TestCase,
	#category : 'SmallWorld-Specification'
}

{ #category : #'as yet unclassified' }
SmallProjectSpecification >> testLoadBleedingEdge [

	| project |
	project := SmallMetacelloProject named: 'Versionner'.
	project
		repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference;
		beBleedingEdge;
		yourself.

	project loadScript loadsBleedingEdge should beTrue.
]

{ #category : #'as yet unclassified' }
SmallProjectSpecification >> testLoadDevelopmentByDefault [

	| project |
	project := SmallMetacelloProject named: 'Versionner'.
	project
		repository: '/Volumes/Fast/Squeak/Repositories/External Package Extensions/' asFileReference;
		beDevelopment;
		yourself.

	project loadScript loadsDevelopment should beTrue.
]

{ #category : #'as yet unclassified' }
SmallProjectSpecification >> testLoadDevelopmentVersion [

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
]

{ #category : #'as yet unclassified' }
SmallProjectSpecification >> testLoadLocalMetacelloProject [

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
]

{ #category : #'as yet unclassified' }
SmallProjectSpecification >> testLoadSpecificVersion [

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
]
