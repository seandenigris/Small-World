loading
load
	"Even though we delegate most loading to #loadScript, put the most common case here for convenience. We will have to resist the urge in the future to add all possible combinations here..."
	
	loadScript := self loadScript
		loadingVersion: self defaultVersion;
		yourself.
	loadScript run.