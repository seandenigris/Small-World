Class {
	#name : #SmallBitBucketRepository,
	#superclass : #SmallRemoteGitRepository,
	#category : 'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallBitBucketRepository >> defaultUser [
	^ Author fullName
]

{ #category : #accessing }
SmallBitBucketRepository >> hostname [
	^ 'bitbucket.org'
]
