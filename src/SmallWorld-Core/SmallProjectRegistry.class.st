Class {
	#name : #SmallProjectRegistry,
	#superclass : #Object,
	#instVars : [
		'projects'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #'private-spotter' }
SmallProjectRegistry class >> itemsSearchOn: candidatesSource priority: aNumber for: aSearch [
	"Helper to make available both from global and instance Spotters. See senders"

	^ aSearch list
		priority: aNumber;
		title: 'Projects';
		items: [ candidatesSource projects ];
		matchSubstrings;
		itemName: #name
]

{ #category : #'world menu' }
SmallProjectRegistry class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Small World')
		with: [
			(aBuilder item: #'Add Project')
				action: [ self add ]; 
				icon: Smalltalk ui icons add.
			(aBuilder item: #'Save Project Catalog')
				action: [ SmallWorldDB saveRepository ]; 
				icon: Smalltalk ui icons glamorousSaveIcon.
			(aBuilder item: #'Project Inspector')
				action: [ self projects inspect ]; 
				icon: Smalltalk ui icons smallLoadProjectIcon. ]
]

{ #category : #persistence }
SmallProjectRegistry class >> restoreFrom: anObject [

	UniqueInstance := anObject.
]

{ #category : #persistence }
SmallProjectRegistry class >> spData [

	^ UniqueInstance
]

{ #category : #accessing }
SmallProjectRegistry class >> uniqueInstance [
	^ UniqueInstance ifNil: [  UniqueInstance := self new ]
]

{ #category : #accessing }
SmallProjectRegistry class >> uniqueInstance: anObject [
	UniqueInstance := anObject
]

{ #category : #accessing }
SmallProjectRegistry >> detectForBaseline: aClass [
	^ self projects detect: [ :p | 
		p loadScript 
			ifNil: [ false ]
			ifNotNil: [ :ls | ls baselineClass = aClass ] ]
]

{ #category : #accessing }
SmallProjectRegistry >> printOn: aStream [
	aStream
		nextPutAll: 'Registry of ';
		print: self projects size;
		nextPutAll: ' projects'
]

{ #category : #accessing }
SmallProjectRegistry >> projects [
	^ projects ifNil: [ projects := SortedCollection sortBlock: #name ascending ]
]

{ #category : #accessing }
SmallProjectRegistry >> projects: anObject [
	projects := anObject
]

{ #category : #spotter }
SmallProjectRegistry >> projectsSearchFor: aStep [
	<gtSearch>
	^ self class
		itemsSearchOn: self
		priority: 5 
		for: aStep
]

{ #category : #spotter }
SmallProjectRegistry >> projectsSearchNewFor: aSearch [
	<gtSearch>
	
	^ aSearch explicit
		title: 'New Project';
		priority: 50;
		itemName: [ :result | '+ ' , result gtDisplayText ];
		search: [ :context | { SmallProject named: context searchQuery trimmed } ];
		itemSpawnAfter: [ :result | self projects add: result ]
]

{ #category : #accessing }
SmallProjectRegistry >> projectsViewFor: aView [
	<gtView>
	
	^ aView list
		title: 'Projects' translated;
		priority: 5;
		items: [ self projects ];
		"send: #model;"
		yourself.
]
