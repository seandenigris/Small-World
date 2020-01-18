Class {
	#name : #SmallWorldDB,
	#superclass : #SpFileDatabase,
	#category : 'SmallWorld-Persistence'
}

{ #category : #customization }
SmallWorldDB class >> backupDirectoryParent [
	^ FileLocator dynabookData
]

{ #category : #'class initialization' }
SmallWorldDB class >> initialize [

	self restoreLastBackup.
	self enablePersistence
]

{ #category : #accessing }
SmallWorldDB class >> schema [

	^ { SmallProject }.
]
