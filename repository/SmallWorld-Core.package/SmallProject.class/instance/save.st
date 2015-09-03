saving
save

	| source |
	source := String streamContents: [ :str |
		str
			nextPutAll: name asLegalSelector;
			cr; cr;
			tab;
			nextPutAll: '^ (';
			nextPutAll: 'self named: ''';
			nextPutAll: name;
			nextPutAll: ''')'.
		self putInstVarsOn: str.
		str
			cr; tab; tab;
			nextPutAll: 'yourself.' ].
	
	self class class compile: source classified: 'projects'.