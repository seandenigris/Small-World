version status
becomeSmallProject
	"We are phasing out the SmallProject subclasses because MC, Metacello, etc are simply loading/packaging strategies employed by a particular project, which can be changed during its lifetime"
	self becomeForward: (SmallProject named: self name)