"
This comment may not be the case anymore... have to think...
I add a meta-layer that captures the intention and language of project organization. E.g. instead of (as the convention) describing loading in a Metacello configuration, I allow you to say something like:
project hasPackage: 'DeNigrisSetup-Core'.
project hasPackage: 'DeNigrisSetup-Platform.pharo' whichDependsOn: 'Core'.

This actually sounds exactly like Metacello, but the problem is that, when Squeaksource goes down, does Metacello work?
"
Class {
	#name : #SmallMetacelloProject,
	#superclass : #SmallProject,
	#instVars : [
		'configurationName',
		'testPackages',
		'defaultVersion'
	],
	#category : #'SmallWorld-Core-Projects'
}

{ #category : #'version status' }
SmallMetacelloProject >> beBleedingEdge [

	defaultVersion := #bleedingEdge.
]

{ #category : #'version status' }
SmallMetacelloProject >> beDevelopment [

	defaultVersion := #development.
]

{ #category : #'version status' }
SmallMetacelloProject >> becomeSmallProject [
	"We are phasing out the SmallProject subclasses because MC, Metacello, etc are simply loading/packaging strategies employed by a particular project, which can be changed during its lifetime"
	self becomeForward: (SmallProject named: self name)
]

{ #category : #accessing }
SmallMetacelloProject >> configurationName [

	^ configurationName ifNil: [ 'ConfigurationOf', self name ].
]

{ #category : #accessing }
SmallMetacelloProject >> configurationName: aString [

	configurationName := aString.
]

{ #category : #accessing }
SmallMetacelloProject >> defaultVersion [

	^ defaultVersion.
]

{ #category : #accessing }
SmallMetacelloProject >> defaultVersion: anObject [
	defaultVersion := anObject
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionBecomeSmallProject [
	<magritteActionDescription>
	^ MAActionDescription new
		priority: 300;
		label: 'Become SmallProject';
		action: #becomeSmallProject;
		yourself
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionConfigurationName [
	<magritteDescription>

	^ MAStringDescription new
		priority: 275;
		accessor: #configurationName;
		beRequired;
		yourself
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionDefaultVersion [
	<magritteDescription>

	^ MASymbolDescription new
		priority: 290;
		accessor: #defaultVersion;
		beRequired;
		yourself
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionLoadDefaultVersion [
	<magritteActionDescription>
	^ MAActionDescription new
		priority: 100;
		label: 'Load';
		action: #load;
		yourself
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionLoadScriptSource [
	<gtInspectorPresentationOrder: 2>

	^ MAMemoDescription new
			label: 'Load Script';
			accessor: { #loadScript. #asString };
			glmPresentation: [ :a | a pharoScript ];
			yourself
]

{ #category : #magritte }
SmallMetacelloProject >> descriptionTestPackages [
	<magritteDescription>

	^ MAToManyRelationDescription new
		priority: 287;
		label: 'Test Packages';
		accessor: #testPackageNames;
		classes: { ByteString };
		yourself
]

{ #category : #'initialize-release' }
SmallMetacelloProject >> initialize [

	super initialize.
	testPackages := #().
	defaultVersion := #stable.
]

{ #category : #loading }
SmallMetacelloProject >> load [
	"Even though we delegate most loading to #loadScript, put the most common case here for convenience. We will have to resist the urge in the future to add all possible combinations here..."
	
	loadScript := self loadScript
		loadingVersion: self defaultVersion;
		yourself.
	loadScript run.
]

{ #category : #loading }
SmallMetacelloProject >> loadConfiguration [
	
	| gofer |
	gofer := Gofer it.
	repository addToGofer: gofer.
	gofer
		package: self configurationName; 
		load.
]

{ #category : #loading }
SmallMetacelloProject >> loadScript [

	^ loadScript ifNil: [ loadScript := SmallBaselineLoadScript building: self ].
]

{ #category : #committing }
SmallMetacelloProject >> publishMetacelloConfiguration [

	self shouldBeImplemented.
	Gofer it
		perform: repository goferRepositorySetter with: repository;
		package: self configurationName;
		push.
	
	Gofer it
		perform: repository goferRepositorySetter with: repository;
		package: self configurationName;
		push.
]

{ #category : #saving }
SmallMetacelloProject >> putInstVarsOn: aWriteStream [ 

	super putInstVarsOn: aWriteStream.
	self putInstVarNamed: 'configurationName' On: aWriteStream unlessDefault: 'ConfigurationOf', name.
	self putInstVarNamed: 'testPackages' On: aWriteStream unlessDefault: #().
	self putInstVarNamed: 'defaultVersion' On: aWriteStream unlessDefault: #stable.
]

{ #category : #accessing }
SmallMetacelloProject >> testPackageNames [

	^ testPackages.
]

{ #category : #accessing }
SmallMetacelloProject >> testPackageNames: aCollection [

	testPackages := aCollection.
]

{ #category : #'running tests' }
SmallMetacelloProject >> testScript [

	^ TestScript testing: self testPackageNames.
]
