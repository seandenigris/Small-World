printing
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := FileLocator home / ''Dynabook'' / ''Repositories'' / ''{projectName}''.
repoFolder exists
	ifFalse: [ 
		LibC system: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		(repoFolder / ''repository'') ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#projectName -> self project localFolderName.
			}
		on: aStream.