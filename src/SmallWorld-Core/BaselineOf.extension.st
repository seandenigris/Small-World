Extension { #name : #BaselineOf }

{ #category : #'*SmallWorld-Core' }
BaselineOf class >> readme [
	"Your baseline can proivide three possibilities to insert into a repo's readme:
		- if the baseline has a comment, this will be inserted by default
		- something custom by overriding `BaselineOf class>>#readme`
		- if neither of the above, nothing will be inserted beyond the default"

	^ self hasComment
		ifTrue: [ self gitHubComment ]
		ifFalse: [ '' ].
]
