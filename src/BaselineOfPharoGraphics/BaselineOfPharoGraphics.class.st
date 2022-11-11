Class {
	#name : #BaselineOfPharoGraphics,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoGraphics
}

{ #category : #accessing }
BaselineOfPharoGraphics >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec postLoadDoIt: #loadLepiter.
			spec
				package: 'RdvBloc';
				package: 'RDV-Athens-Hello';
				package: 'RdvMorph';
				package: 'RdvSpec';
				package: 'rdv-test']
]

{ #category : #accessing }
BaselineOfPharoGraphics >> loadLepiter [ 
	| dbExist |
	dbExist := false.
	LeDatabasesRegistry defaultLogicalDatabase registeredDBs
		do: [ :e | e uuidString = 'eeyinywcclrst8qypl6okcb2' ifTrue: [ dbExist := true ] ].
	dbExist
		ifFalse: [ LeDatabasesRegistry defaultLogicalDatabase properties
				addRegisteredDirectory: (FileReference
						fileSystem: FileSystem disk
						path: (Path from: 'C:\devzone\sources\note_gtoolkit\lepiter')).
			LeDatabasesRegistry default defaultLogicalDatabase reload ]
]

{ #category : #accessing }
BaselineOfPharoGraphics >> loadLepiter2 [
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
