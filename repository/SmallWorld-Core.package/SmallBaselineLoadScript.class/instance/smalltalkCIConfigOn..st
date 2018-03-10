accessing
smalltalkCIConfigOn: aStream
	aStream 
		nextPutAll: 'SmalltalkCISpec {
  #preLoading : ''scripts/preLoading.st'', 
  #loading : [
    SCIMetacelloLoadSpec {
      #baseline : ';
		print: self baselineName;
		nextPutAll: ',
      #directory : ';
			print: self repository codeSubfolder;
			nextPutAll: ',
      #platforms : [ #pharo ]
    }
  ]
}'