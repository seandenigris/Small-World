accessing
url
	| template urlString |
	template := 'https://bitbucket.org/{user}/{projectPath}'.
	urlString := template format: { 
		#user -> self user.
		#projectPath -> (self projectName asLowercase copyReplaceAll: ' ' with: '-') } asDictionary.
	^ urlString asUrl