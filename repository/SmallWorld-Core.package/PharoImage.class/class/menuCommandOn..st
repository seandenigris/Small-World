world menu
menuCommandOn: aBuilder 

	<worldMenu>
	| mainItem |
	mainItem := aBuilder item: #'New Images'.
	mainItem with: [
		self versions do: [ :version | | imageDescription menuForVersion |
			imageDescription := 'Pharo ', version asString.
			menuForVersion := aBuilder item: imageDescription.
			menuForVersion with: [
				(aBuilder item: 'Open bare-bones') action: [ (PharoImage version: version) open ].
				(aBuilder item: 'Open for development') action: [ (PharoImage version: version) openForDevelopment ] ] ] ].