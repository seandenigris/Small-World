Class {
	#name : #PharoIssueTracker,
	#superclass : #Object,
	#category : 'SmallWorld-Core-Bugs'
}

{ #category : #'as yet unclassified' }
PharoIssueTracker class >> goToWebsite [

	ExternalWebBrowser openOnUrl: self url.
]

{ #category : #'as yet unclassified' }
PharoIssueTracker class >> menuCommandOn: aBuilder [ 

	<worldMenu>
	(aBuilder item: #'Open Issue Tracker')
		parent: #'Smalltalk Websites';	
		action:[ self goToWebsite ]; 
		help: 'Go to Pharo issue tracker site'.
]

{ #category : #'as yet unclassified' }
PharoIssueTracker class >> url [

	^ 'http://code.google.com/p/pharo/issues/list'.
]
