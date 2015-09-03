action
execute
	self project ifNil: [ ^ self ].
	super execute.
	self loadProjectIntoNewImage