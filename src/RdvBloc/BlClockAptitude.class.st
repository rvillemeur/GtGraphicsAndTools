Class {
	#name : #BlClockAptitude,
	#superclass : #BrAptitude,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockAptitude >> onAttachedTo: anElement [.
super onAttachedTo: anElement.
	anElement geometry: (BlCircleGeometry new matchExtent: anElement extent).
	anElement border: (BlBorder paint: Color black width: 4).
	anElement background: (BlBackground paint: Color lightBlue)
]
