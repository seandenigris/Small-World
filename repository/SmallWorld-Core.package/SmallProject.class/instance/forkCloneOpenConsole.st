actions
forkCloneOpenConsole
	| myUsername |
	myUsername := 'seandenigris'.
	LibC system: 'open -a Terminal ', (self repository localCloneFolderForUser: myUsername) fullName surroundedByDoubleQuotes