committing
publishMetacelloConfiguration

	self shouldBeImplemented.
	Gofer it
		perform: repository goferRepositorySetter with: repository;
		package: self configurationName;
		push.
	
	Gofer it
		perform: repository goferRepositorySetter with: repository;
		package: self configurationName;
		push.