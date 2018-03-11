accessing
directDownloadURL
	"This is actually in the wrong place because it assumes the master branch. Right now, only the load script knows which branch we want"
	| scheme url |
	scheme := self hostname copyUpTo: $..
	url := scheme, '://', self user, '/', self projectName, ':master'.
	^ self codeSubfolder
			ifNotNil: [ :folder | url, '/', folder ]
			ifNil: [ url ]