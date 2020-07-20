Extension { #name : #SmallProject }

{ #category : #'*SmallWorld-UI' }
SmallProject class >> add [
	self new asMagritteMorph
		addButtons;
		addWindow;
		onAnswer: [ :newProject | self projects add: newProject ];
		openInWorld
]

{ #category : #'*SmallWorld-UI' }
SmallProject class >> glamour [

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
				display: [ :input | input ];
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
SmallProject class >> openGlamour [
	<script>

	^ self glamour openOn: SmallProject projects
]

{ #category : #'*SmallWorld-UI' }
SmallProject class >> uiMenuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Dashboard')
		parent: #'Small World';
		order: 10; "Be first"
		action: [ self openGlamour ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon
]
