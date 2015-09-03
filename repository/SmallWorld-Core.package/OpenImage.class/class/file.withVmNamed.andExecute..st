private
file: imageFileReference withVmNamed: aString andExecute: scriptFileReference

	| template command |
	self flag: 'refactor with command scripting?'.
	template := '/usr/local/bin/{1} "{2}" "{3}"'.
	command := template format: { aString. imageFileReference fullName. scriptFileReference fullName }.
	^ PipeableOSProcess command: command.