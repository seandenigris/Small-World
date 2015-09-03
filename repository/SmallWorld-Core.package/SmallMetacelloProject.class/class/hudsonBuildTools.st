projects
hudsonBuildTools
	"Right now, there is no mechanism to load projects without Metacello configurations. We are only loading this with Jenkins, so for now, we'll wait"

	| project |
	project := self named: 'Hudson Build Tools'.
	^ project repository: 'http://source.lukas-renggli.ch/hudson/' asUrl.
	"packages: #(HudsonBuildTools)."