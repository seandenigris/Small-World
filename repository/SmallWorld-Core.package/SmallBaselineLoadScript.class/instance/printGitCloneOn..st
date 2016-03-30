as yet unclassified
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := FileLocator home / ''Dynabook'' / ''Repositories'' / ''{projectName}''.
repoFolder exists
	ifFalse: [ 
		NBMacShell run: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		(repoFolder / ''repository'') ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#projectName -> self project name.
			}
		on: aStream.