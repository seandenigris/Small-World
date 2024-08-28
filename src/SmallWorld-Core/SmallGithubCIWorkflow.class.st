Class {
	#name : #SmallGithubCIWorkflow,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #'as yet unclassified' }
SmallGithubCIWorkflow class >> for: aSmallProject [ 
	
	^ self new
		project: aSmallProject;
		yourself
]

{ #category : #accessing }
SmallGithubCIWorkflow >> currentContents [

	^ self file
		ifExists: #contents
		ifAbsent: [ nil ]
]

{ #category : #accessing }
SmallGithubCIWorkflow >> desiredContents [

	^ self template format: { #projectName -> (self project repository localCloneFolder base select: #isLetter) } asDictionary.
]

{ #category : #accessing }
SmallGithubCIWorkflow >> ensurePublished [

	self isUpToDate ifTrue: [ ^ self ].
	
	self
		overwriteFile;
		publish
]

{ #category : #accessing }
SmallGithubCIWorkflow >> exists [

	^ self file exists
]

{ #category : #accessing }
SmallGithubCIWorkflow >> file [

	| workflowFolder |
	workflowFolder := self project repository localCloneFolder / '.github' / 'workflows'.
	
	workflowFolder
		ifExists: [ :wf | 
			wf files 
				detect: [ :file | file extension = 'yaml' and: [ file base = 'ci' or: [ file base = 'runTests' ] ] ]
				ifFound: [ :existingFile | ^ existingFile ] ].
				
	^ workflowFolder / 'ci.yaml'
]

{ #category : #accessing }
SmallGithubCIWorkflow >> isUpToDate [

	self file exists ifFalse: [ ^ false ].
	self project name = 'Pharo Enhancements' ifTrue: [ ^ true ]. "Canonical"
	^ self currentContents trimRight = self desiredContents trimRight
]

{ #category : #accessing }
SmallGithubCIWorkflow >> overwriteFile [

	self file ensureDelete ensureCreateFile writeStreamDo: [ :str | str << self desiredContents ]
]

{ #category : #accessing }
SmallGithubCIWorkflow >> project [
	^ project
]

{ #category : #accessing }
SmallGithubCIWorkflow >> project: anObject [
	project := anObject
]

{ #category : #accessing }
SmallGithubCIWorkflow >> publish [

	self project repository localClone
		stageAll;
		commit: '[CI]: Update to Latest PharoEnhancements Workflow';
		push
]

{ #category : #accessing }
SmallGithubCIWorkflow >> template [

	| baseTemplate |
	baseTemplate := '# Adapted from https://github.com/seandenigris/Pharo-Enhancements/blob/master/.github/workflows/ci.yaml

name: CI

# Controls when the action will run. 
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Adapted from https://docs.github.com/en/actions/using-workflows/reusing-workflows
jobs:
  test-and-release:
    uses: seandenigris/Pharo-Enhancements/.github/workflows/ci_reusable.yaml@master
    with:
      project-name: {projectName}'.

	self project isPrivate ifTrue: [ self shouldBeImplemented ].
   
	^ baseTemplate withUnixLineEndings
]
