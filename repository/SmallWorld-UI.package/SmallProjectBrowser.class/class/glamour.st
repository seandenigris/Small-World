glamour
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
				enableFilterWithAction: [ :dataSource :pattern :selectedRow | selectedRow browse ] named: 'Browse' ].
	browser transmit
		from: #one;
		to: #two;
		andShow: [ :a | a finder show: [ :b :object | object gtInspectorPresentationsIn: b inContext: GTInspector new ] ].
	^ browser