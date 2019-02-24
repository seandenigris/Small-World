magritte
descriptionRepositoryView
	<magritteActionDescription>
	
	^ MAActionDescription new
			action: [ :target | target repository view ];
			label: 'Open Repository';
			isMutator: false;
			shortcut: $r asShortcut;
			icon: #glmOpenFromURL;
			yourself