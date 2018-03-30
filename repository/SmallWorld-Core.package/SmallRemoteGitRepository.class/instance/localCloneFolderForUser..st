accessing
localCloneFolderForUser: userString
	| safeProjectName |
	safeProjectName := self projectName copyReplaceAll: ' ' with: '-'.
	^ FileLocator home / 'Dynabook' / 'Repositories' / userString asLowercase / safeProjectName