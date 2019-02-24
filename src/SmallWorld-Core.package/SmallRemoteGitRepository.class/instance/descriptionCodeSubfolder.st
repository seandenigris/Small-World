magritte
descriptionCodeSubfolder
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 100;
		accessor: #codeSubfolder;
		morphClass: MADropListMorph;
		options: #('src' 'source' 'repository' 'packages');
		yourself