debugging
initialize

	super initialize.
	loads := OrderedCollection new.
	whatToLoad := 'default'.
	loadConfigurationOnly := false.