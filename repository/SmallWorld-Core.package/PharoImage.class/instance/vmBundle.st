as yet unclassified
vmBundle
	"Mac-only"
		
	| vmPath bundlePath |
	vmPath := OSProcess programName.
	bundlePath := '.*\.app' asRegex matchesPrefix: vmPath; subexpression: 1.
	^ FileSystem disk root resolve: bundlePath.