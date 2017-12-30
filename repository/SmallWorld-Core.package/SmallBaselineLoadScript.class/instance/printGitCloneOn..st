printing
printGitCloneOn: aStream
	| template |
	template := 'repoFolder := {repoFolder}.
repoFolder exists
	ifFalse: [ 
		LibC system: ''git clone {sshCloneUrl} '', repoFolder fullName surroundedBySingleQuotes.
		({localSourceFolder}) ensureCreateDirectory ].'.

	self
		printTemplate: template
		format: {
			#repoFolder -> self repository localCloneFolder storeString.
			#sshCloneUrl -> self repository sshCloneUrl.
			#localSourceFolder -> self localSourceFolder storeString
		}
		on: aStream.