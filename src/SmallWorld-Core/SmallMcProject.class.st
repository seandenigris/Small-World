Class {
	#name : 'SmallMcProject',
	#superclass : 'SmallProject',
	#instVars : [
		'packageName'
	],
	#category : 'SmallWorld-Core-Projects'
}

{ #category : 'instance creation' }
SmallMcProject class >> named: aString [

	^ (super named: aString) packageName: aString.
]

{ #category : 'accessing' }
SmallMcProject >> load [

	Gofer it
		perform: repository goferRepositorySetter with: repository asGoferString;
		package: packageName;
		load.
]

{ #category : 'accessing' }
SmallMcProject >> packageName: aString [ 

	packageName := aString.
]
