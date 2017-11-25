printing
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := FileLocator home / ''Dynabook'' / ''Repositories'' / ''{user}'' / ''{projectName}''.
repoFolder exists
	ifFalse: [ 
		LibC system: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		(repoFolder / ''{codeSubfolder}'') ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
				#sshCloneUrl -> self project repository sshCloneUrl.
				#user -> self project repository user.
				#projectName -> self project localFolderName.
				#codeSubfolder -> self project repository codeSubfolder
			}
		on: aStream.