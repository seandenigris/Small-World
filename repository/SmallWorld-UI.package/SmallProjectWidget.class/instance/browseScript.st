callbacks
browseScript

	| projectClass builder |
	projectClass := self project class.
	builder := projectClass class methods detect: [ :e | | builtProject |
		builtProject := projectClass perform: e selector.
		builtProject name = self project name ].
	builder browse.