accessing
localCloneURL
	^ '''filetree://'', (FileLocator home / ''Dynabook'' / ''Repositories'' / ''', self user, ''' / ''', self projectName, ''' / ''', self codeSubfolder, ''') fullName'