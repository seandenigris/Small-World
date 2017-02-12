as yet unclassified
glamour

	| browser |
	browser := GLMTabulator new.
	browser
		column: #one;
		column: #two.
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
		andShow: [ :a :b | a custom: (GTInspector new startOn: b) ].
	^ browser