*SmallWorld-UI
uiMenuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #'Dashboard')
		parent: #'Small World';
		order: 10; "Be first"
		action: [ self openGlamour ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon