accessing
projectVersion
	^ projectVersion ifNil: [ projectVersion := self class defaultProjectVersion ]