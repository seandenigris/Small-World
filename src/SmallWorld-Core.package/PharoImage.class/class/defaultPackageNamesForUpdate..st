private
defaultPackageNamesForUpdate: aNumber

	| getter |
	getter := self class methodDict
		detect: [ :e |  | pragma |
			pragma := e pragmaAt: #update:.
			pragma isNil not and: [ pragma arguments first = aNumber ] ]
		ifNone: [ self error: 'Package names have not been cached for update ', aNumber asString, '. PrintIt: (MCPackage allInstances asSet collect: [ :e| e name ]) sorted' ].
		
	^ self perform: getter selector.