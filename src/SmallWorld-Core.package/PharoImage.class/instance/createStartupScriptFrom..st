private
createStartupScriptFrom: aBlock

"	ip := Smalltalk imagePath.
ipd := FileDirectory on: ip.
temporarySubfolderName := 'tmp'.
ipd assureExistenceOfPath:  temporarySubfolderName.
tmp := ipd / temporarySubfolderName.

blockStr := [ 
	Transcript open.
	Transcript show: 'hi there' ] asString."

| scriptContents scriptFileDirectory |
	scriptContents := aBlock asString copyFrom: 2 to: aBlock asString size - 1.
	scriptFileDirectory := (FileDirectory on: Smalltalk imagePath) / 'tmp'.
	scriptFileDirectory assureExistence.
	scriptFileDirectory
		forceNewFileNamed: 'startup_script.st'
		do: [ :file | file nextPutAll: scriptContents ].