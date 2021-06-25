Class {
	#name : #BaselineOfSmallWorld,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallWorld
}

{ #category : #baselines }
BaselineOfSmallWorld >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'BabyPhexample' with: [
				spec repository: 'github://seandenigris/Baby-Phexample' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'Magritte' with: [ 
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'GitLabCI' with: [
				spec repository: 'gitlab://SeanDeNigris/gitlab-smalltalk-ci:master/src' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ].
		spec
			package: 'SmallWorld-Core' with: [
				spec requires: #('Magritte' 'GitLabCI'). ];
			package: 'SmallWorld-UI' with: [
				spec requires: #('ExternalWebBrowser'). ];
			package: 'SmallWorld-Specification' with: [
				spec requires: #('BabyPhexample' ). ];
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
