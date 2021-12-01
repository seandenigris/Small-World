"
Example:

image := PharoImage at: '/Users/sean/Squeak/Main Working Images/Seaside-3/pier2.image'.
image startAndEvaluate: [
		Gofer new
			directory: '/Users/sean/Squeak/Repositories/Setup';
			package: 'DeNigrisSetup-Core';
			package: 'DeNigrisSetup-Platform.pharo';
			load ].
"
Class {
	#name : #PharoImage,
	#superclass : #Object,
	#instVars : [
		'file'
	],
	#category : 'SmallWorld-Core-Images'
}

{ #category : #private }
PharoImage class >> archiveDirectory [

	^ '/Users/sean/Squeak/Fresh Images/' asFileReference.
]

{ #category : #private }
PharoImage class >> currentPackageNames [
	
	^ RPackageOrganizer default packageNames.
]

{ #category : #private }
PharoImage class >> defaultPackageNamesForUpdate: aNumber [

	| getter |
	getter := self class methodDict
		detect: [ :e |  | pragma |
			pragma := e pragmaAt: #update:.
			pragma isNil not and: [ pragma arguments first = aNumber ] ]
		ifNone: [ self error: 'Package names have not been cached for update ', aNumber asString, '. PrintIt: (MCPackage allInstances asSet collect: [ :e| e name ]) sorted' ].
		
	^ self perform: getter selector.
]

{ #category : #'instance creation' }
PharoImage class >> file: aFileReference [

	^ self new setFile: aFileReference.
]

{ #category : #'world menu' }
PharoImage class >> menuCommandOn: aBuilder [ 

	<worldMenu>
	| mainItem |
	mainItem := aBuilder item: #'New Images'.
	mainItem with: [
		self versions do: [ :version | | imageDescription menuForVersion |
			imageDescription := 'Pharo ', version asString.
			menuForVersion := aBuilder item: imageDescription.
			menuForVersion with: [
				(aBuilder item: 'Open bare-bones') action: [ (PharoImage version: version) open ].
				(aBuilder item: 'Open for development') action: [ (PharoImage version: version) openForDevelopment ] ] ] ].
]

{ #category : #'instance creation' }
PharoImage class >> named: aString [
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
]

{ #category : #scripting }
PharoImage class >> setUpWith: scriptBlock [
	"Use DeNigrisSetup to customize the image.
	Arguments:
		scriptBlock: takes one argument, an instance of DeNigrisSetup.
	Example:
		PharoTrunkImage setUpWith: [ :i |
			i loadGrowableTextMorph ]."

	| scriptString |
	scriptString := DeNigrisSetup script: scriptBlock.
	^ (self basicNew setScriptContents: scriptString) initialize.
]

{ #category : #'instance creation' }
PharoImage class >> version: aNumber [

	^ self named: 'Pharo-', aNumber asString.
]

{ #category : #private }
PharoImage class >> versions [

	^ #(1.3 1.4)
]

{ #category : #'as yet unclassified' }
PharoImage >> createSetupScript [

	FileStream forceNewFileNamed: self setupScriptPath do: [ :str |
		str nextPutAll: self setupScriptContents ]
]

{ #category : #private }
PharoImage >> createStartupScriptFrom: aBlock [

"	ip := Smalltalk imagePath.
ipd := FileDirectory on: ip.
temporarySubfolderName := 'tmp'.
ipd assureExistenceOfPath:  temporarySubfolderName.
tmp := ipd / temporarySubfolderName.

blockStr := [ 
	Transcript open.
	Transcript show: 'hi there' ] asString."

| scriptContents scriptFileDirectory |
	scriptContents := aBlock asString copyFrom: 2 to: aBlock asString size - 1.
	scriptFileDirectory := (FileDirectory on: Smalltalk imagePath) / 'tmp'.
	scriptFileDirectory assureExistence.
	scriptFileDirectory
		forceNewFileNamed: 'startup_script.st'
		do: [ :file | file nextPutAll: scriptContents ].
]

{ #category : #private }
PharoImage >> filePath [

	^ filePath.
]

{ #category : #'as yet unclassified' }
PharoImage >> open [

"	self createSetupScript."
	"Flags mean 'create a new instance'  and 'look in the Applications folder'"
	OSProcess command: ('open -n "{1}"' format: { file fullName }).
]

{ #category : #'as yet unclassified' }
PharoImage >> openForDevelopment [

	"-n means 'create a new instance'"
	OSProcess command: ('open -n "{1}" --args "{2}" "{3}"' format: { self vmBundle fullName. file fullName. DeNigrisSetup bootstrapFile fullName }).
]

{ #category : #private }
PharoImage >> setFile: anFSReference [

	file := anFSReference.
	^ self.
]

{ #category : #private }
PharoImage >> setScriptContents: aString [

	scriptContents := aString.
	^ self.
]

{ #category : #'as yet unclassified' }
PharoImage >> setupScriptContents [

	| scriptMethod sourceString sourceStringWithBracketsStripped |
	scriptContents ifNotNil: [ :sc | ^ sc ].
	scriptMethod := self class compiledMethodAt: #setupScript.
	sourceString := scriptMethod methodNode body asString.
	sourceStringWithBracketsStripped := sourceString copyFrom: 3 to: sourceString size - 2.
	^ sourceStringWithBracketsStripped.
]

{ #category : #private }
PharoImage >> setupScriptDirectoryPath [

	^ '/Users/sean/Squeak/Fresh Images/Temp Setup Scripts/'.
]

{ #category : #'as yet unclassified' }
PharoImage >> setupScriptPath [

	^ ((FileDirectory on: Smalltalk imagePath) / 'tmp' / 'startup_script.st') pathName.
]

{ #category : #'as yet unclassified' }
PharoImage >> startAndEvaluate: aBlock [
	
	self createStartupScriptFrom: aBlock.
	OSProcess command: ('open -n -a "{1}" --args "{2}" "{3}"' format: { self vmBundle. self filePath. self setupScriptPath }).
]

{ #category : #'as yet unclassified' }
PharoImage >> vmBundle [
	"Mac-only"
		
	| vmPath bundlePath |
	vmPath := OSProcess programName.
	bundlePath := '.*\.app' asRegex matchesPrefix: vmPath; subexpression: 1.
	^ FileSystem disk root resolve: bundlePath.
]
