magritte
descriptionLoadScriptSource
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Load Script';
			accessor: { #loadScript. #asString };
			gtPresentation: [ :a | a smalltalkCode ];
			yourself