accessing-magritte
descriptionSupportedImages
	<magritteDescription>
	^ MAMultipleOptionDescription new
		accessor: #supportedImages;
		priority: 250;
		options: self allSmalltalkImages;
		morphClass: MATokenCompletionMorph;
		yourself