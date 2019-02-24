magritte
descriptionUser
	<magritteDescription>

	^ MAStringDescription new
		priority: 200;
		accessor: #user;
		default: self defaultUser;
		beRequired;
		yourself