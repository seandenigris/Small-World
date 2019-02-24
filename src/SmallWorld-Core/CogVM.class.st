"
""Build a fresh Stack VM""
CogVM makeFresh.
"
Class {
	#name : #CogVM,
	#superclass : #Object,
	#category : 'SmallWorld-Core-VM'
}

{ #category : #'as yet unclassified' }
CogVM class >> buildScriptString [

	^ 'StackCocoaIOSConfig new
	addExternalPlugins: #(FT2Plugin SqueakSSLPlugin);
	addInternalPlugins: #( UnixOSProcessPlugin );
	generateForDebug;
	generateSources; generate.
	
	Smalltalk snapshot: false andQuit: true.'
]

{ #category : #'as yet unclassified' }
CogVM class >> cloneFromGit [

	^ 'git clone git?//gitorious.org/cogvm/blessed.git cogvm'.
]

{ #category : #'as yet unclassified' }
CogVM class >> compile [

	| p |
	p := PipeableOSProcess waitForCommand: 'cd /Developer/cogvm/cog/build/; /opt/local/bin/cmake -G Xcode'.
	p succeeded ifFalse: [ self error: 'Cog failed to compile' ].
]

{ #category : #'as yet unclassified' }
CogVM class >> downloadFiles [

	| targetFolder |
	targetFolder := '/Developer/cogvm/' asFile.
	ZnClient download: 'http://ci.lille.inria.fr/pharo/job/Cog%20Git%20Tracker/lastSuccessfulBuild/artifact/cog.tar.gz' to: targetFolder.
	ZnClient download: 'http://ci.lille.inria.fr/pharo/job/Cog%20Git%20Tracker/lastSuccessfulBuild/artifact/vmmaker-image.zip' to: targetFolder.
]

{ #category : #'as yet unclassified' }
CogVM class >> generateSources [

	| scriptFile |
	scriptFile := FSLocator imageDirectory asReference / 'script.st'.
	scriptFile writeStreamDo: [ :str |  str nextPutAll: self buildScriptString ].
	OpenImage file: '/Developer/cogvm/cog/image/generator.image' asFile andExecute: scriptFile.
]

{ #category : #'as yet unclassified' }
CogVM class >> gitoriousRepo [

	^ 'https://gitorious.org/cogvm'.
]

{ #category : #'as yet unclassified' }
CogVM class >> makeFresh [

	self
		downloadFiles;
		uncompressFiles;
		generateSources;
		compile.
]

{ #category : #'as yet unclassified' }
CogVM class >> openImageMaker [
	"self openImageMaker"

	OpenImage file: '/Developer/cogvm/cog/image/generator.image' asFile.
]

{ #category : #'as yet unclassified' }
CogVM class >> openInXcode [

	OSProcess waitForCommand: 'open /Developer/cogvm/cog/build/StackVM.xcodeproj'.
]

{ #category : #'as yet unclassified' }
CogVM class >> reset [
	"self reset"

	| buildDir |
	PipeableOSProcess waitForCommand: '/usr/bin/osascript -e "tell application \"Xcode\" to quit"'.
	buildDir := '/Developer/cogvm/cog/build/' asFile.
	buildDir children do: [:e | e basename = 'vmVersionInfo.h' ifFalse: [ e deleteAll ] ].
	self
		generateSources;
		compile.
]

{ #category : #'as yet unclassified' }
CogVM class >> rootFolder [

	^ 	'/Developer/cogvm/' asFile.
]

{ #category : #'as yet unclassified' }
CogVM class >> uncompressFiles [

	| sourcesArchive imageArchive imageFolder |
	sourcesArchive := self rootFolder / 'cog.tar.gz'.
	imageArchive := self rootFolder / 'vmmaker-image.zip'.
	imageFolder := self rootFolder / 'cog' / 'image'.
	
	OSProcess waitForCommand: 'tar xvzf ', sourcesArchive asCliString, ' -C ', self rootFolder asCliString.
	OSProcess waitForCommand: 'tar xvzf ', imageArchive asCliString, ' -C ', imageFolder asCliString.
]
