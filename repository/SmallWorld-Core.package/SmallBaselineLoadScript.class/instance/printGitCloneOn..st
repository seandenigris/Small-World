printing
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := FileLocator home / ''Dynabook'' / ''Repositories'' / ''{projectName}''.
repoFolder exists
	ifFalse: [ 
		LibC system: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		(repoFolder / ''{codeSubfolder}'') ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#projectName -> self project localFolderName.
				#codeSubfolder -> self project repository codeSubfolder
			}
		on: aStream.