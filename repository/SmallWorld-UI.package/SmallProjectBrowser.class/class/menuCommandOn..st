as yet unclassified
menuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #'Small World')
		with: [
			(aBuilder item: #'Dashboard')
				action: [ self open ]; 
				icon: Smalltalk ui icons smallLoadProjectIcon ].