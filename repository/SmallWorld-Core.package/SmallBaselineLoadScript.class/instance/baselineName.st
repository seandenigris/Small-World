accessing
baselineName
	^ baselineName ifNil: [ self project name copyWithout: Character space ]