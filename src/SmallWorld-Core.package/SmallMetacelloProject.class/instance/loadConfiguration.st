loading
loadConfiguration
	
	| gofer |
	gofer := Gofer it.
	repository addToGofer: gofer.
	gofer
		package: self configurationName; 
		load.