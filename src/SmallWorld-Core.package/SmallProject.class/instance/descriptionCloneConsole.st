magritte
descriptionCloneConsole
	<magritteActionDescription>
	
	^ MAActionDescription new
			action: #forkCloneOpenConsole;
			label: 'Fork - Open Console';
			isMutator: false;
			shortcut: $f asShortcut;
			icon: #glmOpenFromURL;
			yourself