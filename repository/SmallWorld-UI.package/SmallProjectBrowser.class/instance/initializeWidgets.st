initialization
initializeWidgets

	projectModel := PanelMorph new
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		changeProportionalLayout;
		asSpecAdapter.
		
	projectListModel := self newList
		items: self projects;
		displayBlock: [ :e | e name ];
		yourself.