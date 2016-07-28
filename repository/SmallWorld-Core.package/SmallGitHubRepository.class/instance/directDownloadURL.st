accessing
directDownloadURL
	"This is actually in the wrong place because it assumes the master branch. Right now, only the load script knows which branch we want"
	^ 'github://', self user, '/', self projectName, ':master/repository'