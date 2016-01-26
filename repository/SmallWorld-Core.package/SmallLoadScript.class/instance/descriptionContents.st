magritte
descriptionContents
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Contents';
			accessor: #asString;
			glmPresentation: [ :a | a smalltalkCode ];
			yourself