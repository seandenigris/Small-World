*SmallWorld-UI
glamour

	| browser |
	browser := GLMTabulator new.
	browser
		column: #one;
		column: #two span: 4.
	browser transmit
		to: #one;
		andShow: [ :a | 
			a fastList
				title: 'Filter and named action ';
				display: [ :input | input ];
				icon: [ :project | 
					project isLoaded
						ifTrue: [ Smalltalk ui icons testGreen ] 
						ifFalse: [ Smalltalk ui icons testNotRun ] ];
				act: [ self add ] iconName: #add on: $a entitled: 'Add Project';
				maAddSelectionActionsFor: SmallProject new;
				enableFilterWithAction: [ :dataSource :pattern :selectedRow | selectedRow browse ] named: 'Browse' ].
	browser transmit
		from: #one;
		to: #two;
		andShow: [ :a | 
			a finder show: [ :b :object | object gtInspectorPresentationsIn: b inContext: GTInspector new ] ].
	^ browser