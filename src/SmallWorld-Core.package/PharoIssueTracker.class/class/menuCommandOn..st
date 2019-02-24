as yet unclassified
menuCommandOn: aBuilder 

	<worldMenu>
	(aBuilder item: #'Open Issue Tracker')
		parent: #'Smalltalk Websites';	
		action:[ self goToWebsite ]; 
		help: 'Go to Pharo issue tracker site'.