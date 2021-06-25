Class {
	#name : #SmallWorldDB,
	#superclass : #SpFileDatabase,
	#category : #'SmallWorld-Persistence'
}

{ #category : #customization }
SmallWorldDB class >> backupDirectoryParent [
	^ FileLocator dynabookData
]

{ #category : #accessing }
SmallWorldDB class >> schema [

	^ { SmallProject }.
]
