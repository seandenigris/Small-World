as yet unclassified
startAndEvaluate: aBlock
	
	self createStartupScriptFrom: aBlock.
	OSProcess command: ('open -n -a "{1}" --args "{2}" "{3}"' format: { self vmBundle. self filePath. self setupScriptPath }).