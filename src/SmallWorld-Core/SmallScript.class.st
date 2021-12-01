Class {
	#name : #SmallScript,
	#superclass : #Object,
	#instVars : [
		'shouldSave',
		'shouldQuit'
	],
	#category : 'SmallWorld-Core-Scripts'
}

{ #category : #API }
SmallScript >> initialize [

	super initialize.
	shouldSave := false.
	shouldQuit := false.
]

{ #category : #running }
SmallScript >> run [

	Smalltalk compiler evaluate: self asString.
]

{ #category : #accessing }
SmallScript >> runDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		priority: 150;
		gtIcon: BrGlamorousVectorIcons play;
		action: #run;
		yourself
]

{ #category : #API }
SmallScript >> save: saveBoolean andQuit: quitBoolean [

	shouldSave := saveBoolean.
	shouldQuit := quitBoolean.
]

{ #category : #saving }
SmallScript >> saveAs: aFileReference [ 

	| fixedScript |
	fixedScript := self asString copyReplaceAll: Character cr asString with: Character lf asString.
	aFileReference writeStreamDo: [ :s | s nextPutAll: fixedScript ].
]
