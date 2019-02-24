testing
isSmallProjectLoaded
	| registration |
	registration := MetacelloProjectRegistration registry 
		registrationForClassNamed: self configurationName
		ifAbsent: [ ^ false ].
	^ registration loadedInImage