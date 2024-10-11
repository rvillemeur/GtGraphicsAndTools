Class {
	#name : #BrClockSample,
	#superclass : #Object,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BrClockSample >> clockContainer [

	<gtExample>
	^BlElement new
			border: (BlBorder paint: Color red width: 1);
			background: Color yellow;
			layout: BlFrameLayout new;
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

]

{ #category : #'as yet unclassified' }
BrClockSample >> clockDynamicContainer [

	<gtExample>
	^BlElement new
			border: (BlBorder paint: Color red width: 1);
			background: Color yellow;
			layout: BlFrameLayout new;
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

]

{ #category : #'as yet unclassified' }
BrClockSample >> clockDynamicSize [
<gtExample>
^BrClock new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].
]

{ #category : #'as yet unclassified' }
BrClockSample >> clockFixedContainer [
<gtExample>
^BlElement new
		border: (BlBorder paint: Color red width: 1);
		background: Color yellow;
		layout: BlFlowLayout horizontal;
		size: 500@500.
]

{ #category : #'as yet unclassified' }
BrClockSample >> clockFixedSize [
	<gtExample>
	^ BrClock new size: 300 @ 300
]

{ #category : #'as yet unclassified' }
BrClockSample >> openInDynamicLayout [

	<gtExample>
	| clock container |
	container := self clockFixedContainer.
	clock := self clockDynamicSize.
	clock aptitude: BrClockAptitude.
	container addChild: clock.
	^ container
]

{ #category : #'as yet unclassified' }
BrClockSample >> openInFixedSize [
	<gtExample>
	| clock container |
	container := self clockDynamicContainer.
	clock := self clockFixedSize.
	clock aptitude: BrClockAptitude.

	container addChild: clock.
	^ container
]
