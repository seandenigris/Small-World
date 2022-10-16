Extension { #name : #GtSpotterStart }

{ #category : #'*SmallWorld-Core' }
GtSpotterStart >> spGtProjectSpotterFor: aStep [
	<gtSearch>
	^ SmallProjectRegistry
		itemsSearchOn: SmallProjectRegistry uniqueInstance
		priority: 87 
		for: aStep
]
