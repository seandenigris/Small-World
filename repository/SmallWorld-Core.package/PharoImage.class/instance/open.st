as yet unclassified
open

"	self createSetupScript."
	"Flags mean 'create a new instance'  and 'look in the Applications folder'"
	OSProcess command: ('open -n "{1}"' format: { file fullName }).