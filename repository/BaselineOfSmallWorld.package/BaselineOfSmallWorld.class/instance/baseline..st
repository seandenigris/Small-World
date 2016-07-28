baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'BabyPhexample' with: [
				spec repository: 'github://seandenigris/Baby-Phexample:master/repository' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence:master/repository' ];
			baseline: 'Magritte3' with: [
				spec
					loads: #('Morphic' 'Magritte-GT');
					repository: 'github://seandenigris/Magritte3:master/repository' ].
		spec 
			package: 'Glamour-Magritte-Presentations' with: [
				spec repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main/'. ];
			package: 'SmallWorld-Core' with: [
				spec requires: #('Magritte3' 'Glamour-Magritte-Presentations' ). ];
			package: 'SmallWorld-UI';
			package: 'SmallWorld-Specification' with: [
				spec requires: #('BabyPhexample' ). ];
			package: 'SmallWorld-Platform';
			package: #'SmallWorld-Persistence' with: [
				spec requires: #('SimplePersistence' ). ]. ].
