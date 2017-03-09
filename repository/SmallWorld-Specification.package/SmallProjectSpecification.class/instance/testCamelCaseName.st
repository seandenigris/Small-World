as yet unclassified
testCamelCaseName

	| project script |
	project := SmallMetacelloProject named: 'HTML Link'.
	project camelCaseName should equal: 'HtmlLink'.
	
	project := SmallMetacelloProject named: 'Small World'.
	project camelCaseName should equal: 'SmallWorld'