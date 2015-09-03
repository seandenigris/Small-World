as yet unclassified
requestProject
	| chooser |
	chooser := ListDialogWindow new
		getList: [ :r | | projects |
			projects := SmallProject projects sort: [ :a :b | a name < b name ].
			projects select: [ :e | r search: e name ] ];
		displayBlock: [ :e | e name ];
		title: 'Select Project' translated;
		yourself.
	 ^ chooser chooseFromOwner: World