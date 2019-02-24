instance creation
projects

	^ projects ifNil: [ projects := SortedCollection sortBlock: [ :a :b | a name < b name ] ].