accessing
customProjectAttributes
	| result |
	result := super customProjectAttributes.
	self isLauncherImage ifTrue: [ result := result copyWith: #'PharoLauncher' ].
	^ result