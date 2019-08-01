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
				spec repository: 'github://seandenigris/Baby-Phexample:master/repository' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence:master/repository' ];
			baseline: 'Magritte' with: [
				spec
					loads: #('Morphic' 'Magritte-GT');
					repository: 'github://seandenigris/Magritte:master/source' ];
			baseline: 'GitLabCI' with: [
				spec repository: 'gitlab://SeanDeNigris/gitlab-smalltalk-ci:master/src' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ].
		spec
			package: 'SmallWorld-Core' with: [
				spec requires: #('Magritte' 'GitLabCI'). ];
			package: 'SmallWorld-UI';
			package: 'SmallWorld-Specification' with: [
				spec requires: #('BabyPhexample' ). ];
			package: #'SmallWorld-Persistence' with: [
				spec requires: #('SimplePersistence' 'PharoEnhancements' ). ]. ].

	"We require an updated GT which was not integrated until Pharo 6"
	spec for: #(#'pharo4.x' #'pharo5.x') do: [
		spec 
			package: 'GT-Inspector' with: [
				spec repository: 'http://smalltalkhub.com/mc/Moose/GToolkit/main/'. ] ].
	
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
