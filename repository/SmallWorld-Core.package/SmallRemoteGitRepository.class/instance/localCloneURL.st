accessing
localCloneURL
	^ '''filetree://'', (FileLocator home / ''Dynabook'' / ''Repositories'' / ''', self projectName, ''' / ''', self codeSubfolder, ''') fullName'