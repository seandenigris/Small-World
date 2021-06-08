Extension { #name : #PhLAbstractTemplate }

{ #category : #'*SmallWorld-PharoLauncher' }
PhLAbstractTemplate >> extractZipArchive: zipFile to: aDirectory [
	"Unzip zipFile inside a temporary subdirectory of aDirectory. Return a reference to the subdirectory. The subdirectory can and must be deleted by the caller"
	| tempDirectory |
	"We have to go through a temporary directory because we don't know where the interesting files are in the archive (maybe at the root or maybe in a subdirectory)"
	tempDirectory := aDirectory / DateAndTime millisecondClockValue asString.
	tempDirectory createDirectory. "will crash if directory already exists. And that's good :-)"
	LibC system: 'unzip "', zipFile fullName, '" -d "', tempDirectory fullName, '"'.
	"[ ZipArchive new
		readFrom: zipFile;
		extractAllTo: tempDirectory ]
	on: Error
	do: [ :error | 
		error messageText = 'can''t find EOCD position'
			ifTrue: [ PhLCorruptedTemplateError signal ]
			ifFalse: [ error pass ] ]."
	^ tempDirectory
]

{ #category : #'*SmallWorld-PharoLauncher' }
PhLAbstractTemplate >> relocateImageFilesFrom: extractionDirectory to: targetDirectory withName: targetName [
	"Move the image files from anywhere within extractionDirectory (even subdirectories) to aDirectory and give the image the name aString"

	| imageFile changesFile sourcesFile versionFile gtExtra |
	imageFile := extractionDirectory allFiles detect: [ :aFile | '*.image' match: aFile basename ].	"A changes file must have the same name and be in the same directory as the image file:"
	changesFile := imageFile parent / imageFile basenameWithoutExtension , 'changes'.
	sourcesFile := imageFile parent / imageFile basenameWithoutExtension , 'sources'.
	versionFile := imageFile parent / PhLImage versionFileName.
	gtExtra := imageFile parent / 'gt-extra'.
	imageFile = (targetDirectory / targetName , 'image')
		ifTrue: [ ^ self "no need to relocate" ].
	imageFile moveTo: targetDirectory / targetName , 'image'.
	changesFile moveTo: targetDirectory / targetName , 'changes'.
	sourcesFile exists 
		ifTrue: [ sourcesFile moveTo: targetDirectory / sourcesFile basename ]
		ifFalse: [ "ugly hack to handle Pharo 7 - 64 bits images not following the naming scheme"
			extractionDirectory allFiles 
				detect: [ :aFile | '*.sources' match: aFile basename ]
				ifFound: [ :aFile | aFile moveTo: targetDirectory / aFile basename ] ].
	versionFile exists 
		ifTrue: [ versionFile moveTo: targetDirectory / versionFile basename ].
	gtExtra exists 
		ifTrue: [ gtExtra moveTo: targetDirectory / gtExtra basename ]
]
