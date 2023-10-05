Class {
	#name : #BaselineOfSmallWorld,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallWorld
}

{ #category : #accessing }
BaselineOfSmallWorld class >> isDynabook [
	^ true
]

{ #category : #baselines }
BaselineOfSmallWorld >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'DynabookFoundation' with: [
				spec repository: 'github://seandenigris/Dynabook-Foundation' ];
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ];
			baseline: 'GitLabCI' with: [
				spec repository: 'gitlab://seandenigris/gitlab-smalltalk-ci:master/src' ];
			baseline: 'Magritte' with: [ 
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'Mocketry' with: [
				spec repository: 'github://dionisiydk/Mocketry' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ].
		spec
			package: 'SmallWorld-Core' with: [
				spec requires: #('DynabookFoundation' 'Magritte' 'GitLabCI'). ];
			package: 'SmallWorld-UI' with: [
				spec requires: #('ExternalWebBrowser'). ];
			package: 'SmallWorld-Specification' with: [
				spec requires: #('Mocketry' ) ];
			package: #'SmallWorld-Persistence' with: [
				spec requires: #('SimplePersistence' 'PharoEnhancements' ). ]. ].
	
	spec for: #'PharoLauncher' do: [ spec package: 'SmallWorld-PharoLauncher' ]
]

{ #category : #accessing }
BaselineOfSmallWorld >> customProjectAttributes [
	| result |
	result := super customProjectAttributes.
	self isLauncherImage ifTrue: [ result := result copyWith: #'PharoLauncher' ].
	^ result
]

{ #category : #testing }
BaselineOfSmallWorld >> isLauncherImage [
	
	^ Smalltalk globals hasClassNamed: #PhLDirectoryBasedImageRepository
]
