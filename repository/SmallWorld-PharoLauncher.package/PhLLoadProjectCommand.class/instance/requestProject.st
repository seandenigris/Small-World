as yet unclassified
requestProject
	| chooser |
	chooser := ListDialogWindow new
		getList: [ :r | SmallProject projects select: [ :e | r search: e name ] ];
		displayBlock: [ :e | e name ];
		title: 'Select Project' translated;
		yourself.
	 ^ chooser chooseFromOwner: World