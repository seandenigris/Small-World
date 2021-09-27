Extension { #name : 'ZnUrl' }

{ #category : '*SmallWorld-Core' }
ZnUrl >> addToGofer: aGofer [ 

	aGofer url: self.
]

{ #category : '*SmallWorld-Core' }
ZnUrl >> asGoferString [

	^ self asString.
]

{ #category : '*SmallWorld-Core' }
ZnUrl >> goferLoadCascade [
	| repository repoUsername repoPassword |
	repository := MCHttpRepository location: self asString.
	repoUsername := MlConfigurationFile new defaultUserFor: repository.
	repoPassword := MlConfigurationFile new defaultPasswordFor: repository.
	^ 'url: ', self asGoferString surroundedBySingleQuotes, ' username: ''', repoUsername, ''' password: ''', repoPassword, ''''
]

{ #category : '*SmallWorld-Core' }
ZnUrl >> goferRepositorySetter [

	^ #url:username:password:.
]

{ #category : '*SmallWorld-Core' }
ZnUrl >> swDescription [

	^ MAUrlDescription new
			priority: 200;
			accessor: #repository;
			beRequired;
			yourself
]
