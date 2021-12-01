Class {
	#name : #Pharo1pt2Image,
	#superclass : #Object,
	#category : 'SmallWorld-Core-Images'
}

{ #category : #'as yet unclassified' }
Pharo1pt2Image class >> current [

	^ self new.
]

{ #category : #'as yet unclassified' }
Pharo1pt2Image >> addItemToWorldMenu [

	^ AddItemToWorldMenuMorph open.
]
