instance creation
projects
	"Collects class-side methods containing <SwProject> pragma"

	| projectConstructors |
	projects ifNotNil: [ ^ projects ].
	projectConstructors := (PragmaCollector filter: [:prag | prag keyword = 'SwProject' ]) reset collected.
	^ projects := projectConstructors collect: [ :e |
		e methodClass soleInstance perform: e selector ]