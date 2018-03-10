accessing
ciConfiguration
	^ GitLabCIConfiguration new
			smalltalkImages: self project supportedImages;
			yourself.