as yet unclassified
printGitCloneOn: aStream
	| template |
	template := 'NBMacShell run: ''git clone git@bitbucket.org:{username}/{projectPath}.git '''''', FileLocator imageDirectory fullName, ''/{projectPath}''''''.'.
	self
		printTemplate: template
		format: {
				#username -> self project repository user.
				#projectPath -> self project repository projectPath.
			}
		on: aStream.