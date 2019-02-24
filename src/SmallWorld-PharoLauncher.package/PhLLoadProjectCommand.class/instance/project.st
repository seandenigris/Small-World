accessing
project
	^ project ifNil: [ project := self requestProject ]