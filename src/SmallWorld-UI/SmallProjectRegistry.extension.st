Extension { #name : #SmallProjectRegistry }

{ #category : #'*SmallWorld-UI' }
SmallProjectRegistry class >> add [
	SmallProject new asMagritteMorph
		addButtons;
		addWindow;
		onAnswer: [ :newProject | self uniqueInstance projects add: newProject ];
		openInWorld
]

{ #category : #'*SmallWorld-UI' }
SmallProjectRegistry class >> glamour [

	| browser |
	browser := GLMTabulator new.
	browser
		column: #one;
		column: #two span: 4.
	browser transmit
		to: #one;
		andShow: [ :a | 
			a fastList
				title: 'Filter and named action ';
				display: [ :registry | registry projects ];
				format: [ :e | e displayText ];
				icon: [ :project | 
					project isLoaded
						ifTrue: [ Smalltalk ui icons testGreen ] 
						ifFalse: [ Smalltalk ui icons testNotRun ] ];
				act: [ self add ] iconName: #add on: $a entitled: 'Add Project';
				maAddSelectionActionsFor: SmallProject new;
				enableFilterWithAction: [ :dataSource :pattern :selectedRow | selectedRow browse ] named: 'Browse' ].
	browser transmit
		from: #one;
		to: #two;
		andShow: [ :a | 
			a finder show: [ :b :object | object gtInspectorPresentationsIn: b inContext: GTInspector new ] ].
	^ browser
]

{ #category : #'*SmallWorld-UI' }
SmallProjectRegistry class >> openGlamour [
	<script>

	^ self glamour openOn: self uniqueInstance
]

{ #category : #'*SmallWorld-UI' }
SmallProjectRegistry class >> uiMenuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Dashboard')
		parent: #'Small World';
		order: 10; "Be first"
		action: [ self openGlamour ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon
]
