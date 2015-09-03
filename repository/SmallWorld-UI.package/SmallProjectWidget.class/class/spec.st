as yet unclassified
spec
	<spec: #default>

	^ SpecLayout composed
		newColumn: [ :col |
			col
				add: #loadButton;
				add: #loadDevelopmentButton;
				add: #loadBleedingEdgeButton;
				add:#browseScriptButton ];
		"newRow: [ :spec | spec
			add: #loadButton;
			add: #loadStableButton ] height: 30;"
		yourself.