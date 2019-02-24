Extension { #name : #PharoLauncher }

{ #category : #'*SmallWorld-PharoLauncher' }
PharoLauncher >> commandClassesForTemplatesToolbar [
	^ {PhLCreateImageFromTemplateCommand. PhLLoadProjectCommand. PhLRefreshTemplateRepositoryCommand}
]
