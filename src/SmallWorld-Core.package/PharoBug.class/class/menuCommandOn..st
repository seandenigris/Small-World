as yet unclassified
menuCommandOn: aBuilder 

	<worldMenu>
	| mainItem |
	mainItem := aBuilder item: #'Smalltalk Websites'.
	mainItem with: [
		(aBuilder item: #'Go to Pharo Website')
			action:[ self openUrl: 'http://www.pharo-project.org/home' ]; 
			help: 'Go to Pharo project site'.
		(aBuilder item: #'Go to CI Server')
			action:[ self openUrl: 'http://ci.lille.inria.fr/pharo' ]; 
			help: 'Go to Pharo project site'.
		(aBuilder item: #'Open Squeaksource')
			action: [ self openUrl: 'http://www.squeaksource.com' ];
			help: 'Go to Squeaksource'.
		(aBuilder item: #'Open Pharocasts')
			action: [ self openUrl: 'http://www.pharocasts.com/' ];
			help: 'Go to Pharocasts' ].