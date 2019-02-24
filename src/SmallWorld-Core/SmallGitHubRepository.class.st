Class {
	#name : #SmallGitHubRepository,
	#superclass : #SmallRemoteGitRepository,
	#category : 'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallGitHubRepository >> defaultUser [
	^ Author fullName asLowercase
]

{ #category : #accessing }
SmallGitHubRepository >> hostname [
	^ 'github.com'
]
