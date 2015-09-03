as yet unclassified
menuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #'Dashboard')
		parent: #'Small World';
		action: [ self open ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon