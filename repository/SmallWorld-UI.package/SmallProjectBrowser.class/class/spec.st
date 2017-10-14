specs
spec
	<spec: #default>

	^ SpecLayout composed
		"newRow: [ :spec1 | spec1 add: #debugModeSwitch ] height: 30;"
		add: #projectListModel origin: 0@0 corner: 0.25@1 "offsetOrigin: 0@30 offsetCorner: 0@0";
		add: #projectModel origin: 0.25@0 corner: 1@1 "offsetOrigin: 0@30 offsetCorner: 0@0";
		yourself.