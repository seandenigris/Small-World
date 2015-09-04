accessing
url
	| template urlString |
	template := 'https://{hostname}/{user}/{projectPath}'.
	urlString := template format: { 
		#hostname -> self hostname.
		#user -> self user.
		#projectPath -> self projectPath } asDictionary.
	^ urlString asUrl