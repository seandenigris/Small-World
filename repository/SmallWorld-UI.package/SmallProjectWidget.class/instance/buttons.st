initialization
buttons

	| buttonNames |
	buttonNames := self class instVarNames select: [ :e | e endsWith: 'Button' ].
	^ buttonNames collect: [ :e | self instVarNamed: e ].