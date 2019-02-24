as yet unclassified
buildScriptString

	^ 'StackCocoaIOSConfig new
	addExternalPlugins: #(FT2Plugin SqueakSSLPlugin);
	addInternalPlugins: #( UnixOSProcessPlugin );
	generateForDebug;
	generateSources; generate.
	
	Smalltalk snapshot: false andQuit: true.'