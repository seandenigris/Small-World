accessing
directDownloadURL
	"This is actually in the wrong place because it assumes the master branch. Right now, only the load script knows which branch we want"
	self error: 'Metacello does not support direct GL repo links as of 9/8/2017'.
	^ 'gitlab://', self user, '/', self projectName, ':master/repository'