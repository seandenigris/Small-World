private
select: aSmallProject 

	| projectMorph |
	projectMorph := aSmallProject asMagritteMorph
		addButtons;
		onAnswer: [ :project | project save ];
		morph.
	projectModel morph
		removeAllMorphs;
		addMorph: projectMorph fullFrame: (0@0 corner: 1@1) asLayoutFrame.