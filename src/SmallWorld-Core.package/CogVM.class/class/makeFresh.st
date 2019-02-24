as yet unclassified
makeFresh

	self
		downloadFiles;
		uncompressFiles;
		generateSources;
		compile.