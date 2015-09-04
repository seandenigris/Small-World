as yet unclassified
printGitCloneOn: aStream
	| template |
	template := 'NBMacShell run: ''git clone {sshCloneUrl} '''''', FileLocator imageDirectory fullName, ''/{projectPath}''''''.'.
	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#projectPath -> self project repository projectPath.
			}
		on: aStream.