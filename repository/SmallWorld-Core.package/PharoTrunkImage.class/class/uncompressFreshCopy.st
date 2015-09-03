private
uncompressFreshCopy

	| archive |
	archive := ZipArchive new readFrom: self archiveDirectoryPath, self archiveFileName.
	archive extractAllTo: (FileDirectory on: self archiveDirectoryPath).