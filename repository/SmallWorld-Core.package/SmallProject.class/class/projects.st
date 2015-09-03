instance creation
projects

	| projects |
	projects := OrderedCollection new.
	self subclassesDo: [ :klass | | builders |
		builders := klass class selectorsInProtocol: #projects.
		builders do: [ :selector | | project | 
			project := klass perform: selector.
			projects add: project ] ].
	^ projects.