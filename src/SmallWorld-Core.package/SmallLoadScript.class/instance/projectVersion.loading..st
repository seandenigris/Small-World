initialize-release
projectVersion: aSymbol loading: anObject
	"
	aSymbol - a symbolic Metacello version (e.g. #bleedingEdge | #stable | #development)
	anObject - can be a group or package name, or a collection thereof"

	projectVersion := aSymbol.
	whatToLoad := anObject.