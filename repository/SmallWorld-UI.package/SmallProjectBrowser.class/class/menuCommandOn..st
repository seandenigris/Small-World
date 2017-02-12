as yet unclassified
menuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #'Dashboard')
		parent: #'Small World';
		action: [ self openGlamour ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon