instance creation
named: aString
	"aString - folder name where the image will be; the same as the zipped image folder without extension"
	
	| zippedImageFolder archive tempDirectory target |
	target := self archiveDirectory / aString.
	zippedImageFolder :=  target, 'zip'.
	archive := ZipArchive new readFrom: zippedImageFolder fullName.
	self flag: 'change ZipArchive to use FS after 1.4 release'.
	archive extractAllTo: self archiveDirectory parent fullName.
	tempDirectory := self archiveDirectory / '__MACOSX'.
	tempDirectory deleteAll.
	^ self new setFile: target / aString , 'image'.