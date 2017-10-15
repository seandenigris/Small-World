accessing
configurationName
	^ ('ConfigurationOf', self project name copyWithout: Character space) asSymbol