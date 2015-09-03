as yet unclassified
file: imageFileReference

	| template command |
	template := '"{1}" "{2}"'.
	command := template format: { (self vmBundle / 'Contents/MacOS/CogVM') fullName. imageFileReference fullName }.
	PipeableOSProcess command: command.