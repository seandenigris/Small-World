Extension { #name : 'GtSpotterStart' }

{ #category : '*SmallWorld-Core' }
GtSpotterStart >> spGtProjectSpotterFor: aStep [
	<gtSearch>
	^ SmallProjectRegistry
		gtSpotterOn: SmallProjectRegistry uniqueInstance
		priority: 87 
		for: aStep
]
