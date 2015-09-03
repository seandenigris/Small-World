as yet unclassified
reset
	"self reset"

	| buildDir |
	PipeableOSProcess waitForCommand: '/usr/bin/osascript -e "tell application \"Xcode\" to quit"'.
	buildDir := '/Developer/cogvm/cog/build/' asFile.
	buildDir children do: [:e | e basename = 'vmVersionInfo.h' ifFalse: [ e deleteAll ] ].
	self
		generateSources;
		compile.