Class {
	#name : #SmallGitHubRepository,
	#superclass : #SmallRemoteGitRepository,
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #accessing }
SmallGitHubRepository class >> example [
	<gtExample>
	^ self
		given: [ SmallProject named: 'my-project' ]
		when: [ :p | 
			self new
				project: p;
				yourself ]
		then: [ :repo :proj |
			repo url asString should 
				equalTemplate: 'https://github.com/{author}/{project}'
				format: {
					#author -> Author fullName asLowercase.
					#project -> proj name } asDictionary ]
]

{ #category : #accessing }
SmallGitHubRepository >> defaultUser [
	^ Author fullName asLowercase
]

{ #category : #accessing }
SmallGitHubRepository >> hostname [
	^ 'github.com'
]

{ #category : #accessing }
SmallGitHubRepository >> readme [

	| template legalPage legalMarkdown baselineComment |
	template := '# {project}
	
TLDR: {description}
	
# Overview

{baselineComment}
	
NB. This section is an export of the class comment of {baseline}. When viewed from inside the system, it is live, dynamic and beautiful. "Just the markdown" only gives you a taste. We suggest you dive in and view the documentation as it was intended as quickly as possible - it will be more enjoyable and productive!
	
# Installation
In GToolkit (preferably) or Pharo (v. 9 best supported at time of writing), do the following:

```smalltalk
{loadScript}
```
N.B. you only have to do the outer fork if on GT and you want the UI to stay responsive during the load.

{legal}'.

	baselineComment := self project loadScript baselineClass hasComment
		ifTrue: [ self project loadScript baselineClass gitHubComment ]
		ifFalse: [ '' ].
	legalPage := LeDatabasesRegistry defaultLogicalDatabase pageNamed: 'Publishing Private Repos'.
	legalMarkdown := legalPage children first asMarkdownString allButFirst: 2.

	^ template format: {
		#project -> self projectName.
		#description -> self project description.
		#baseline -> self project loadScript baselineClass gitHubMarkdownLink.
		#baselineComment -> baselineComment.
		#loadScript -> self project loadScript printString.
		#legal -> legalMarkdown } asDictionary
]
