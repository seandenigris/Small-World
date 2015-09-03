accessing
initializeWidgets

	self instantiateModels: #(
		loadButton ButtonModel
		loadDevelopmentButton ButtonModel
		loadBleedingEdgeButton ButtonModel
		loadStableButton ButtonModel
		browseScriptButton ButtonModel).
		
	loadButton
		label: 'Load';
		action: [ self project load ];
		enabled: false.
	
	loadDevelopmentButton
		label: 'Load Development';
		action: [ self project loadScript loadingDevelopment run ];
		enabled: false.
		
	loadBleedingEdgeButton
		label: 'Load Bleeding Edge';
		action: [ self project loadScript loadingBleedingEdge run ];
		enabled: false.
		
	browseScriptButton
		label: 'Browse Script';
		action: [ self browseScript ];
		enabled: false.