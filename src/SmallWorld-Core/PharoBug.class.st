Class {
	#name : 'PharoBug',
	#superclass : 'Object',
	#category : 'SmallWorld-Core-Bugs'
}

{ #category : 'as yet unclassified' }
PharoBug class >> menuCommandOn: aBuilder [ 

	<worldMenu>
	| mainItem |
	mainItem := aBuilder item: #'Smalltalk Websites'.
	mainItem with: [
		(aBuilder item: #'Go to Pharo Website')
			action:[ self openUrl: 'http://www.pharo-project.org/home' ]; 
			help: 'Go to Pharo project site'.
		(aBuilder item: #'Go to CI Server')
			action:[ self openUrl: 'http://ci.lille.inria.fr/pharo' ]; 
			help: 'Go to Pharo project site'.
		(aBuilder item: #'Open Squeaksource')
			action: [ self openUrl: 'http://www.squeaksource.com' ];
			help: 'Go to Squeaksource'.
		(aBuilder item: #'Open Pharocasts')
			action: [ self openUrl: 'http://www.pharocasts.com/' ];
			help: 'Go to Pharocasts' ].
]

{ #category : 'as yet unclassified' }
PharoBug class >> openUrl: aString [

	aString asUrl openInBrowser.
]

{ #category : 'as yet unclassified' }
PharoBug class >> reportThat: aString [

	"	1. see if it's a bug in latest trunk
		2. check the issue tracker to see if it's already been reported
			poss implementation - applescript, EWB, Zn
		3. if 1 & not 2... " 
]
