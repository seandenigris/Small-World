magritte
descriptionCodeSubfolder
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 100;
		label: 'Code Subfolder';
		accessor: #codeSubfolder;
		morphClass: MADropListMorph;
		options: #('src' 'source' 'repository');
		yourself