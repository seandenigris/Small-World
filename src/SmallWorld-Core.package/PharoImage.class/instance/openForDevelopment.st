as yet unclassified
openForDevelopment

	"-n means 'create a new instance'"
	OSProcess command: ('open -n "{1}" --args "{2}" "{3}"' format: { self vmBundle fullName. file fullName. DeNigrisSetup bootstrapFile fullName }).