accessing
sshCloneUrl
	^ 'git@', self hostname, ':', self user, '/', self projectPath, '.git'