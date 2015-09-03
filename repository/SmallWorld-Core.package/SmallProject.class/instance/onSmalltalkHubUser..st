accessing
onSmalltalkHubUser: aString

	self repository: ('http://smalltalkhub.com/mc/', aString, '/', name, '/main/') asUrl.