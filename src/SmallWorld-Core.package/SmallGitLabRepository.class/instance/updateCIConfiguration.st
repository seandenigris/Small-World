actions
updateCIConfiguration
	(self localCloneFolder / '.gitlab-ci.yml') writeStreamDo: [ :s | self ciConfiguration contentsOn: s ]