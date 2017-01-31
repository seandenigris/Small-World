as yet unclassified
remoteLoadSnippet
	"Adapted from https://github.com/dalehenrich/metacello-work#pharo30-pharo40-and-pharo50"
	| template |
	template := 'Metacello new
	baseline: ''{projectName}'';
	repository: ''{repoURL}'';
	onConflict: [ :ex | ex allow ];
	load.'.
	^ template format: { 
			#projectName -> (self name copyWithout: Character space).
			#repoURL -> self repository directDownloadURL } asDictionary