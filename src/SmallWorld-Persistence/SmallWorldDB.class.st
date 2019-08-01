Class {
	#name : #SmallWorldDB,
	#superclass : #SpFileDatabase,
	#category : 'SmallWorld-Persistence'
}

{ #category : #customization }
SmallWorldDB class >> backupDirectoryParent [
	^ FileLocator userData
]

{ #category : #'class initialization' }
SmallWorldDB class >> initialize [

	self restoreLastBackup.
	self enablePersistence
]

{ #category : #'loading/saving' }
SmallWorldDB class >> repositories [

	^ { SmallProject projects }.
]

{ #category : #'loading/saving' }
SmallWorldDB class >> restoreRepositories: someRepositories [

	SmallProject restoreFrom: someRepositories first.
]

{ #category : #'loading/saving' }
SmallWorldDB class >> saveRepository [
	<script>
	^ super saveRepository
]

{ #category : #magritte }
SmallWorldDB class >> saveRepositoryDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		selector: #saveRepository;
		yourself
]
