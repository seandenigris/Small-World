Extension { #name : #String }

{ #category : #'*SmallWorld-Core' }
String >> asMetacelloLoadableString [

	^ self surroundedBySingleQuotes.
]
