magritte
descriptionCopyBaselineLoadSnippet
	<magritteActionDescription>

	^ MAActionDescription new
		priority: 100;
		label: 'Copy Baseline Load Snippet';
		selector: [ Clipboard clipboardText: self baselineLoadSnippet ];
		yourself