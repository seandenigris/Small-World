magritte
descriptionContents
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Contents';
			accessor: #asString;
			gtPresentation: [ :a | a smalltalkCode ];
			yourself