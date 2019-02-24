*SmallWorld-Core
goferLoadCascade
	| repository repoUsername repoPassword |
	repository := MCHttpRepository location: self asString.
	repoUsername := MlConfigurationFile new defaultUserFor: repository.
	repoPassword := MlConfigurationFile new defaultPasswordFor: repository.
	^ 'url: ', self asGoferString surroundedBySingleQuotes, ' username: ''', repoUsername, ''' password: ''', repoPassword, ''''