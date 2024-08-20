Class {
	#name : #BaselineOfGtGraphicsAndTools,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtGraphicsAndTools
}

{ #category : #accessing }
BaselineOfGtGraphicsAndTools >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec postLoadDoIt: #loadLepiter3.
			spec
				package: 'RdvBloc']
]

{ #category : #accessing }
BaselineOfGtGraphicsAndTools >> loadLepiter [ 
<gtExample>
	| dbExist |
	dbExist := false.
	LeDatabasesRegistry defaultLogicalDatabase registeredDBs
		do: [ :e | e uuidString = '7zlqn4f9rol35oflyp8ho9zyv' ifTrue: [ dbExist := true ] ].
	dbExist
		ifFalse: [ LeDatabasesRegistry defaultLogicalDatabase properties
				addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'rvillemeur'
			/ 'GtGraphicsAndTools'
			/ 'lepiter'.
	
	LeDatabasesRegistry default defaultLogicalDatabase reload. ]
]

{ #category : #accessing }
BaselineOfGtGraphicsAndTools >> loadLepiter2 [
	"https://github.com/feenkcom/gt4edx/blob/4d57e4c9993de6e2e22a5d27dd7809f012f67ee1/src/BaselineOfGToolkit4Edx/BaselineOfGToolkit4Edx.class.st#L8"
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'feenkcom'
			/ 'gt4edx'
			/ 'lepiter'.
	
	LeDatabasesRegistry default defaultLogicalDatabase reload.
	
]

{ #category : #'as yet unclassified' }
BaselineOfGtGraphicsAndTools >> loadLepiter3 [
	IceRepository registry
		detect: [ :aRepository | aRepository name = 'GtGraphicsAndTools' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties
				addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [ self inform: 'Repository not found.' ]
]
