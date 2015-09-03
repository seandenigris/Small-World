scripting
setUpWith: scriptBlock
	"Use DeNigrisSetup to customize the image.
	Arguments:
		scriptBlock: takes one argument, an instance of DeNigrisSetup.
	Example:
		PharoTrunkImage setUpWith: [ :i |
			i loadGrowableTextMorph ]."

	| scriptString |
	scriptString := DeNigrisSetup script: scriptBlock.
	^ (self basicNew setScriptContents: scriptString) initialize.