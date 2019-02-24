accessing
onSmalltalkHubUser: userString repository: repoString

	self repository: ('http://smalltalkhub.com/mc/', userString, '/', repoString, '/main/') asUrl.