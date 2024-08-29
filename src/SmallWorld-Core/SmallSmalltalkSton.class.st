Class {
	#name : #SmallSmalltalkSton,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #'SmallWorld-Core'
}

{ #category : #'as yet unclassified' }
SmallSmalltalkSton class >> for: aSmallProject [ 
	
	^ self new
		project: aSmallProject;
		yourself
]

{ #category : #accessing }
SmallSmalltalkSton >> currentContents [

	^ self file
		ifExists: #contents
		ifAbsent: [ nil ]
]

{ #category : #accessing }
SmallSmalltalkSton >> desiredContents [

	^ self template format: { 
		#baseline -> self project baselineName.
		#codeSubfolder -> self project repository codeSubfolder } asDictionary.
]

{ #category : #'as yet unclassified' }
SmallSmalltalkSton >> diffGtViewFor: aView [

	<gtView>
	self isUpToDate ifTrue: [ ^ aView empty ].
	
	^ aView forward
		title: 'Diff';
		priority: 10;
		object: [ 
			PeCharacterDiff 
				comparing: self desiredContents
				to: self currentContents ];
			view: #gtViewTextFor:
]

{ #category : #accessing }
SmallSmalltalkSton >> ensurePublished [

	self isUpToDate ifTrue: [ ^ self ].
	
	self
		overwriteFile;
		publish
]

{ #category : #accessing }
SmallSmalltalkSton >> exists [

	^ self file exists
]

{ #category : #accessing }
SmallSmalltalkSton >> file [

	^ self project repository localCloneFolder / '.smalltalk.ston'
]

{ #category : #accessing }
SmallSmalltalkSton >> isUpToDate [

	self file exists ifFalse: [ ^ false ].
	^ self currentContents trimRight = self desiredContents trimRight
]

{ #category : #accessing }
SmallSmalltalkSton >> overwriteFile [

	self file ensureDelete writeStreamDo: [ :str | str << self desiredContents ]
]

{ #category : #accessing }
SmallSmalltalkSton >> project [
	^ project
]

{ #category : #accessing }
SmallSmalltalkSton >> project: anObject [
	project := anObject
]

{ #category : #accessing }
SmallSmalltalkSton >> publish [

	self project repository localClone
		stageAll;
		commit: '[CI]: Update smalltalk STON';
		push
]

{ #category : #accessing }
SmallSmalltalkSton >> template [

	^ 'SmalltalkCISpec \{
  #loading : [
    SCIMetacelloLoadSpec \{
      #baseline : ''{baseline}'',
      #directory : ''{codeSubfolder}'',
      #onConflict : #useIncoming
    \}
  ],
  #testing : \{
      #failOnZeroTests : false
  \}
\}'
]
