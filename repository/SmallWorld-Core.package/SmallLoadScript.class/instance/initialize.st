debugging
initialize

	super initialize.
	loads := OrderedCollection new.
	projectVersion := #'stable'.
	whatToLoad := 'default'.
	loadConfigurationOnly := false.