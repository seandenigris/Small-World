world menu
menuCommandOn: aBuilder 
	<worldMenu> 
	
	(aBuilder item: #'Small World')
		with: [
			(aBuilder item: #'Project Inspector')
				action: [ self projects inspect ]; 
				icon: Smalltalk ui icons smallLoadProjectIcon.
			(aBuilder item: #'Add Project')
				action: [ (self projects add: SmallProject new) inspect ]; 
				icon: Smalltalk ui icons add.
			(aBuilder item: #'Save Project Catalog')
				action: [ SmallWorldDB saveRepository ]; 
				icon: Smalltalk ui icons glamorousSaveIcon ]