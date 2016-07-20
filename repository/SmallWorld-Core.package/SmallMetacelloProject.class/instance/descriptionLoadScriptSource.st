magritte
descriptionLoadScriptSource
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Load Script';
			accessor: { #loadScript. #asString };
			glmPresentation: [ :a | a pharoScript ];
			yourself