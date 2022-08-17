Extension { #name : #BaselineOf }

{ #category : #'*SmallWorld-Core' }
BaselineOf class >> readme [
	^ self hasComment
		ifTrue: [ self gitHubComment ]
		ifFalse: [ '' ].
]
