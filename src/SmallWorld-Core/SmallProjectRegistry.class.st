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

{ #category : #accessing }
SmallProjectRegistry class >> gtSpotterOn: candidatesSource priority: aNumber for: aStep [ 

	^ aStep listProcessor
		priority: aNumber;
		title: 'Projects';
		allCandidates: [ candidatesSource projects ];
		filter: GtFilterSubstrings;
		candidatesLimit: 7;
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
SmallProjectRegistry >> gtSpotterFor: aStep [
	<gtSearch>
	^ self class
		gtSpotterOn: self
		priority: 5 
		for: aStep
]

{ #category : #spotter }
SmallProjectRegistry >> gtSpotterNewProjectFor: aStep [
	<gtSearch>
	aStep listProcessor
		title: 'New Project';
		priority: 50;
		itemName: [ :input | 'Create new project: ', input ];
		previewObject: [ :input | SmallProject named: input ];
		wantsToDisplayOnEmptyQuery: false;
		filter: GtNullFilter
			item: [ :filter :context | 
				| isExisting |
				isExisting := self projects anySatisfy: [ :e | 
					e name = context textTrimmed ].
				isExisting ifFalse: [ 
					filter value: context textTrimmed ] ];
		send: [ :newName :spotterStep | self projects add: (SmallProject named: newName) ]
]

{ #category : #accessing }
SmallProjectRegistry >> projects [
	^ projects ifNil: [ projects := SortedCollection sortBlock: #name ascending ]
]

{ #category : #accessing }
SmallProjectRegistry >> projects: anObject [
	projects := anObject
]
