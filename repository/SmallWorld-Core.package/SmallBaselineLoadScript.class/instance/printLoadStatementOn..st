as yet unclassified
printLoadStatementOn: aStream

	| template filled |
	template := 'NBMacShell run: ''/usr/bin/git clone git@bitbucket.org:{username}/{gitProject}.git '''''', FileLocator imageDirectory fullName, ''/{gitProject}''''''.

Metacello new
	repository: ''filetree://'', FileLocator imageDirectory fullName, ''/{gitProject}'';
	baseline: ''{baselineName}'';
	load.'.
	filled := template format: { 
		#username -> Author fullName.
		#gitProject -> (self project name asLowercase copyReplaceAll: ' ' with: '-').
		#baselineName -> (self project name copyWithout: Character space).
		#sha -> self projectVersion } asDictionary.
	aStream nextPutAll: filled; cr