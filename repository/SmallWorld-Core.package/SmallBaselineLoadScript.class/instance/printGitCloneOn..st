as yet unclassified
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := FileLocator home / ''Dynabook'' / ''Repositories'' / ''{projectPath}''.
repoFolder exists
	ifFalse: [ NBMacShell run: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes ].'.

	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#projectPath -> self project repository projectPath.
			}
		on: aStream.