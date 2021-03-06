Class {
	#name : #AddItemToWorldMenuMorph,
	#superclass : #Object,
	#instVars : [
		'targetClass'
	],
	#category : 'SmallWorld-Core-IDE'
}

{ #category : #'as yet unclassified' }
AddItemToWorldMenuMorph class >> openToAddMenuFor: aClass [
	"self openToAddMenuFor: Array"
	
	^ (self new setTargetClass: aClass) open.
]

{ #category : #'as yet unclassified' }
AddItemToWorldMenuMorph >> open [

	| builder content |
	builder := UITheme builder.
	content := builder
		newColumn: {
			builder newLabelGroup:{
				('labelled: ' -> ((builder
					newTextEntryFor: self
					getText: nil
					setText: #label:
					help: '')
						acceptOnCR: false;
						minWidth: 200)).
				('action: ' -> ((builder
					newTextEntryFor: self
					getText: nil
					setText: #action
					help: '')
						acceptOnCR: false;
						minWidth: 200)) }.
			builder newOKButtonFor: self }. 
						
	(content openInWindowLabeled: 'New menu item for ', targetClass name) extent: 400 @ 200.
]

{ #category : #private }
AddItemToWorldMenuMorph >> setTargetClass: aClass [ 

	targetClass := aClass.
	^ self.
]
