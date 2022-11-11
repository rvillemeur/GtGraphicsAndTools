Class {
	#name : #BaselineOfRdvNote,
	#superclass : #BaselineOf,
	#category : #BaselineOfRdvNote
}

{ #category : #accessing }
BaselineOfRdvNote >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec

		package: 'RdvNote'.
]
]
