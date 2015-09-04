magritte
descriptionUser
	<magritteDescription>

	^ MAStringDescription new
		priority: 200;
		label: 'User';
		accessor: #user;
		default: self defaultUser;
		beRequired;
		yourself