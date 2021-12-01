Class {
	#name : #PharoTrunkImage,
	#superclass : #PharoImage,
	#category : 'SmallWorld-Core-Images'
}

{ #category : #'as yet unclassified' }
PharoTrunkImage class >> archiveFileName [

	^ 'PharoTrunk.zip'.
]

{ #category : #'as yet unclassified' }
PharoTrunkImage class >> description [

	^ 'Pharo Trunk'.
]

{ #category : #'as yet unclassified' }
PharoTrunkImage class >> latestLocal [

	^ (self basicNew setScriptContents: '.') initialize.
]

{ #category : #private }
PharoTrunkImage class >> uncompressFreshCopy [

	| archive |
	archive := ZipArchive new readFrom: self archiveDirectoryPath, self archiveFileName.
	archive extractAllTo: (FileDirectory on: self archiveDirectoryPath).
]

{ #category : #'as yet unclassified' }
PharoTrunkImage >> filePath [

	^ '/Users/sean/Squeak/Fresh Images/PharoTrunk/PharoTrunk.image'.
]

{ #category : #initialization }
PharoTrunkImage >> initialize [

	super initialize.
	self class uncompressFreshCopy.
]

{ #category : #'as yet unclassified' }
PharoTrunkImage >> setupScript [

	(Smalltalk at: #UpdateStreamer) new updateFromServer.
]

{ #category : #private }
PharoTrunkImage >> setupScriptFileName [

	^ 'trunk_setup.st'.
]

{ #category : #private }
PharoTrunkImage >> setupScriptPath [

	^ self setupScriptDirectoryPath, self setupScriptFileName.
]
