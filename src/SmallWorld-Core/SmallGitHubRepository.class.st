Class {
	#name : #SmallGitHubRepository,
	#superclass : #SmallRemoteGitRepository,
	#category : 'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallGitHubRepository class >> example [
	<gtExample>
	^ self
		given: [ SmallProject named: 'my-project' ]
		when: [ :p | 
			self new
				project: p;
				yourself ]
		then: [ :repo :proj |
			repo url asString should 
				equalTemplate: 'https://github.com/{author}/{project}'
				format: {
					#author -> Author fullName asLowercase.
					#project -> proj name } asDictionary ]
]

{ #category : #accessing }
SmallGitHubRepository >> defaultUser [
	^ Author fullName asLowercase
]

{ #category : #accessing }
SmallGitHubRepository >> hostname [
	^ 'github.com'
]
