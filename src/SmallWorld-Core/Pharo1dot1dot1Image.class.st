Class {
	#name : #Pharo1dot1dot1Image,
	#superclass : #PharoImage,
	#category : 'SmallWorld-Core-Images'
}

{ #category : #'as yet unclassified' }
Pharo1dot1dot1Image class >> archiveFileName [

	^ 'Pharo-1.1.1.zip'.
]

{ #category : #'as yet unclassified' }
Pharo1dot1dot1Image class >> description [

	^ 'Pharo 1.1.1'.
]

{ #category : #private }
Pharo1dot1dot1Image class >> uncompressFreshCopy [

	| archive |
	archive := ZipArchive new readFrom: self archiveDirectoryPath, self archiveFileName.
	archive extractAllTo: (FileDirectory on: self archiveDirectoryPath).
]

{ #category : #private }
Pharo1dot1dot1Image >> filePath [

	^ '/Users/sean/Squeak/Fresh Images/Pharo-1.1.1/Pharo-1.1.1-dev10.09.1.image'.
]

{ #category : #initialization }
Pharo1dot1dot1Image >> initialize [

	super initialize.
	self class uncompressFreshCopy.
]

{ #category : #private }
Pharo1dot1dot1Image >> setupScript [

	Gofer new
		directory:  '/Users/sean/Squeak/Repositories/Setup/';
		package:  'DeNigrisSetup-Core';
		package:  'DeNigrisSetup-Platform.pharo';
		load.
]

{ #category : #private }
Pharo1dot1dot1Image >> setupScriptFileName [

	^ 'setup_pharo-1.1.1.st'.
]

{ #category : #private }
Pharo1dot1dot1Image >> setupScriptPath [

	^ self setupScriptDirectoryPath, self setupScriptFileName.
]
