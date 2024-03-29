Class {
	#name : #SmallRepository,
	#superclass : #Object,
	#instVars : [
		'project',
		'projectName'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallRepository >> project [
	^ project
]

{ #category : #accessing }
SmallRepository >> project: anObject [
	project := anObject
]

{ #category : #magritte }
SmallRepository >> projectDescription [
	<magritteDescription>
	^ MASingleOptionDescription new
		priority: 250;
		accessor: #project;
		options: SmallProjectRegistry uniqueInstance projects;
		beExtensible;
		morphicClass: MATokenCompletionMorph;
		beReadOnly;
		yourself
]

{ #category : #accessing }
SmallRepository >> projectName [
	^ projectName ifNil: [ self project name copyReplaceAll: ' ' with: '-' ]
]

{ #category : #accessing }
SmallRepository >> projectName: aString [
	projectName := aString
]

{ #category : #magritte }
SmallRepository >> projectNameDescription [
	<magritteDescription>

	^ MAStringDescription new
		priority: 100;
		accessor: #projectName;
		beRequired;
		yourself
]

{ #category : #accessing }
SmallRepository >> url [
	^ ZnUrl new
			scheme: #https;
			host: self hostname;
			yourself.
]
