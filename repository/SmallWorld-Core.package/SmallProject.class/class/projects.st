instance creation
projects
	"Collects class-side methods containing <SwProject> pragma"

	| projectConstructors |
	projectConstructors := (PragmaCollector filter: [:prag | prag keyword = 'SwProject' ]) reset collected.
	^ projectConstructors collect: [ :e |
		e methodClass soleInstance perform: e selector ]