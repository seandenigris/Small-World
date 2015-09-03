Example:

image := PharoImage at: '/Users/sean/Squeak/Main Working Images/Seaside-3/pier2.image'.
image startAndEvaluate: [
		Gofer new
			directory: '/Users/sean/Squeak/Repositories/Setup';
			package: 'DeNigrisSetup-Core';
			package: 'DeNigrisSetup-Platform.pharo';
			load ].