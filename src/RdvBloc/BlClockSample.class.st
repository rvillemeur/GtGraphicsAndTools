Class {
	#name : #BlClockSample,
	#superclass : #Object,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockSample >> openInDynamicLayout [

	<gtExample>
	| clock container |
	container := BlElement new
		border: (BlBorder paint: Color red width: 1);
		background: Color yellow;
		layout: BlFlowLayout horizontal;
		size: 500@500.


	clock := BlClock new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].

	container addChild: clock.
	^ container
]

{ #category : #'as yet unclassified' }
BlClockSample >> openInFixedSize [
	<gtExample>
	| clock container |
	container := BlElement new
			border: (BlBorder paint: Color red width: 1);
			background: Color yellow;
			layout: BlFrameLayout new;
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

	clock := BlClock new size: 300 @ 300.
	clock aptitude: BlClockAptitude new.

	container addChild: clock.

	^ container
]
