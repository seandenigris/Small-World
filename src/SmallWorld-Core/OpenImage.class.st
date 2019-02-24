Class {
	#name : #OpenImage,
	#superclass : #Object,
	#category : 'SmallWorld-Core-Images'
}

{ #category : #'as yet unclassified' }
OpenImage class >> file: imageFileReference [

	| template command |
	template := '"{1}" "{2}"'.
	command := template format: { (self vmBundle / 'Contents/MacOS/CogVM') fullName. imageFileReference fullName }.
	PipeableOSProcess command: command.
]

{ #category : #'as yet unclassified' }
OpenImage class >> file: imageFileReference andExecute: scriptFileReference [

		^ self file: imageFileReference withVmNamed: 'pharo-ui' andExecute: scriptFileReference.
]

{ #category : #'as yet unclassified' }
OpenImage class >> file: imageFileReference headlessAndExecute: scriptFileReference [

	^ self file: imageFileReference withVmNamed: 'pharo' andExecute: scriptFileReference.
]

{ #category : #private }
OpenImage class >> file: imageFileReference withVmNamed: aString andExecute: scriptFileReference [

	| template command |
	self flag: 'refactor with command scripting?'.
	template := '/usr/local/bin/{1} "{2}" "{3}"'.
	command := template format: { aString. imageFileReference fullName. scriptFileReference fullName }.
	^ PipeableOSProcess command: command.
]

{ #category : #private }
OpenImage class >> vmBundle [

	^ PharoImage new vmBundle.
]
