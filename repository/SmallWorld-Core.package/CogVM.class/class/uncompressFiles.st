as yet unclassified
uncompressFiles

	| sourcesArchive imageArchive imageFolder |
	sourcesArchive := self rootFolder / 'cog.tar.gz'.
	imageArchive := self rootFolder / 'vmmaker-image.zip'.
	imageFolder := self rootFolder / 'cog' / 'image'.
	
	OSProcess waitForCommand: 'tar xvzf ', sourcesArchive asCliString, ' -C ', self rootFolder asCliString.
	OSProcess waitForCommand: 'tar xvzf ', imageArchive asCliString, ' -C ', imageFolder asCliString.