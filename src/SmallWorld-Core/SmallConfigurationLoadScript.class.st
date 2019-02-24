Class {
	#name : #SmallConfigurationLoadScript,
	#superclass : #SmallLoadScript,
	#category : 'SmallWorld-Core-Scripts'
}

{ #category : #'as yet unclassified' }
SmallConfigurationLoadScript class >> defaultProjectVersion [
	^ #'stable'
]

{ #category : #accessing }
SmallConfigurationLoadScript >> configurationName [
	^ ('ConfigurationOf', self project name copyWithout: Character space) asSymbol
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingBleedingEdge [

	self loadingBleedingEdge: 'default'.
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingBleedingEdge: anObject [
	"anObject - see #projectVersion:load: comment"

	self projectVersion: #bleedingEdge loading: anObject.
]

{ #category : #configuring }
SmallConfigurationLoadScript >> loadingConfigurationOnly [

	loadConfigurationOnly := true.
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingDevelopment [

	self projectVersion: #'development' loading: 'default'.
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingDevelopment: anObject [
	"anObject - see #projectVersion:load: comment"

	self projectVersion: #'development' loading: anObject.
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingStable [

	self loadingStable: 'default'.
]

{ #category : #'initialize-release' }
SmallConfigurationLoadScript >> loadingStable: anObject [
	"anObject - see #projectVersion:load: comment"

	self projectVersion: #stable loading: anObject.
]

{ #category : #testing }
SmallConfigurationLoadScript >> loadsBleedingEdge [

	^ projectVersion = #bleedingEdge.
]

{ #category : #testing }
SmallConfigurationLoadScript >> loadsDevelopment [

	^ projectVersion = #development.
]

{ #category : #private }
SmallConfigurationLoadScript >> printLoadStatementsOn: aStream [ 
		 
	| projectLoadTemplate projectLoadString |
	projectLoadTemplate :='((Smalltalk at: {1}) project version: {2}) load: {3}.'.
	projectLoadString := projectLoadTemplate format: { 
		project configurationName asSymbol printString.
		self projectVersionString.
		whatToLoad asMetacelloLoadableString }.
	aStream nextPutAll: projectLoadString; cr. 
]

{ #category : #accessing }
SmallConfigurationLoadScript >> project: aSmallProject [ 

	super project: aSmallProject.
	projectVersion := aSmallProject defaultVersion.
]

{ #category : #private }
SmallConfigurationLoadScript >> projectVersionString [
	
	^ String streamContents: [ :str |
		projectVersion isSymbol ifTrue: [ str nextPut: $# ].
		str nextPutAll: projectVersion surroundedBySingleQuotes ].
]
