as yet unclassified
compile

	| p |
	p := PipeableOSProcess waitForCommand: 'cd /Developer/cogvm/cog/build/; /opt/local/bin/cmake -G Xcode'.
	p succeeded ifFalse: [ self error: 'Cog failed to compile' ].