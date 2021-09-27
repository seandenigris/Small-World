Class {
	#name : 'SmallGitLabRepository',
	#superclass : 'SmallRemoteGitRepository',
	#category : 'SmallWorld-Core-Projects'
}

{ #category : 'accessing' }
SmallGitLabRepository >> ciConfiguration [
	^ GitLabCIConfiguration new
			smalltalkImages: self project supportedImages;
			yourself.
]

{ #category : 'accessing' }
SmallGitLabRepository >> defaultUser [
	^ Author fullName copyWithout: ' '
]

{ #category : 'accessing' }
SmallGitLabRepository >> hostname [
	^ 'gitlab.com'
]

{ #category : 'actions' }
SmallGitLabRepository >> updateCIConfiguration [
	(self localCloneFolder / '.gitlab-ci.yml') writeStreamDo: [ :s | self ciConfiguration contentsOn: s ]
]
