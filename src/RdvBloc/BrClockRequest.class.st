Class {
	#name : #BrClockRequest,
	#superclass : #BrRequest,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BrClockRequest >> responseClass [
	^ BrClockChanged
]
