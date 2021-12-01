Class {
	#name : #SmallBundle,
	#superclass : #Object,
	#category : 'SmallWorld-Core-Images'
}

{ #category : #'as yet unclassified' }
SmallBundle >> file: imageFileReference headlessAndExecute: scriptFileReference [
| template command |
	template := '"{1}" -headless "{2}" "{3}"'.
	command := template format: { (self vmBundle / 'Contents/MacOS/CogVM') fullName. imageFileReference fullName. scriptFileReference fullName }.
]
