Class {
	#name : #SmallSqueakSourceRepository,
	#superclass : #SmallRepository,
	#category : 'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallSqueakSourceRepository >> hostname [
	^ 'www.squeaksource.com'
]

{ #category : #accessing }
SmallSqueakSourceRepository >> url [
	^ super url
			addPathSegment: self projectName, '.html';
			yourself.
]
