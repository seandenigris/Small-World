*SmallWorld-Core
goferLoadCascade
	| repository repoUsername repoPassword |
	repository := MCHttpRepository location: self asString.
	repoUsername := DpMcConfigurationFile new defaultUserFor: repository.
	repoPassword := DpMcConfigurationFile new defaultPasswordFor: repository.
	^ 'url: ', self asGoferString surroundedBySingleQuotes, ' username: ''', repoUsername, ''' password: ''', repoPassword, ''''