baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			project: 'Phexample' with: [
				spec
					className: #ConfigurationOfPhexample;
					versionString: #'stable';
					repository: 'http://www.smalltalkhub.com/mc/Phexample/Phexample/main' ];
			project: 'Magritte3' with: [
				spec
					className: #ConfigurationOfMagritte3;
					versionString: #'stable';
					loads: #('Morphic' 'Magritte-GT');
					repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main/' ];
			project: 'SimplePersistence' with: [
				spec
					className: #ConfigurationOfSimplePersistence;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/SimplePersistence/main/' ].
		spec 
			package: 'Glamour-Magritte-Presentations' with: [
				spec repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/'. ];
			package: 'SmallWorld-Core' with: [
				spec requires: #('Magritte3' 'Glamour-Magritte-Presentations' ). ];
			package: 'SmallWorld-UI';
			package: 'SmallWorld-Specification' with: [
				spec requires: #('Phexample' ). ];
			package: 'SmallWorld-Platform';
			package: #'SmallWorld-Persistence' with: [
				spec requires: #('SimplePersistence' ). ]. ].
