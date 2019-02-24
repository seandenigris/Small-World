Class {
	#name : #SmallScript,
	#superclass : #Object,
	#instVars : [
		'shouldSave',
		'shouldQuit'
	],
	#category : 'SmallWorld-Core-Scripts'
}

{ #category : #converting }
SmallScript >> asString [
	"Return the source code string of the script"

	self subclassResponsibility.
]

{ #category : #API }
SmallScript >> initialize [

	super initialize.
	shouldSave := false.
	shouldQuit := false.
]

{ #category : #running }
SmallScript >> run [

	Compiler evaluate: self asString.
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
