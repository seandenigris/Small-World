accessing
metacelloURLFor: project
	^ project isPrivate 
			ifTrue: [ self localCloneURL ]
			ifFalse: [ self directDownloadURL surroundedBySingleQuotes ]