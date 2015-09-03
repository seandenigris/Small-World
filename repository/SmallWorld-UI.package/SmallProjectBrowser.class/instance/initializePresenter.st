private
initializePresenter
 
	projectListModel whenSelectedItemChanged: [ :selection | 
		selection ifNotNil: [ :project | self select: project ] ].