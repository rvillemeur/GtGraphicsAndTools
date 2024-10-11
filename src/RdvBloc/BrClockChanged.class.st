Class {
	#name : #BrClockChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'time'
	],
	#category : #'RdvBloc-BlocClock'
}

{ #category : #accessing }
BrClockChanged >> time [
	^ time
]

{ #category : #accessing }
BrClockChanged >> time: anObject [
	self
		assert: [ anObject isNotNil ]
		description: [ 'Time must not be nil' ].
	time := anObject
]
