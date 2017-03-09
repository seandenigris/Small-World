as yet unclassified
directDownloadURL
	"This is actually in the wrong place because it assumes the master branch. Right now, only the load script knows which branch we want"
	^ 'bitbucket://', self user, '/', self projectName, ':master/repository'