as yet unclassified
generateSources

	| scriptFile |
	scriptFile := FSLocator imageDirectory asReference / 'script.st'.
	scriptFile writeStreamDo: [ :str |  str nextPutAll: self buildScriptString ].
	OpenImage file: '/Developer/cogvm/cog/image/generator.image' asFile andExecute: scriptFile.