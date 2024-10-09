Class {
	#name : #BlClockSample,
	#superclass : #Object,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockSample >> clockContainer [

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
BlClockSample >> clockDynamicContainer [

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
BlClockSample >> clockDynamicSize [
<gtExample>
^BlClock new constraintsDo: [ :c |
		         c horizontal matchParent.
		         c vertical matchParent ].
]

{ #category : #'as yet unclassified' }
BlClockSample >> clockFixedContainer [
<gtExample>
^BlElement new
		border: (BlBorder paint: Color red width: 1);
		background: Color yellow;
		layout: BlFlowLayout horizontal;
		size: 500@500.
]

{ #category : #'as yet unclassified' }
BlClockSample >> clockFixedSize [
	<gtExample>
	^ BlClock new size: 300 @ 300
]

{ #category : #'as yet unclassified' }
BlClockSample >> openInDynamicLayout [

	<gtExample>
	| clock container |
	container := self clockFixedContainer.
	clock := self clockDynamicSize.
	clock aptitude: BlClockAptitude.
	container addChild: clock.
	^ container
]

{ #category : #'as yet unclassified' }
BlClockSample >> openInFixedSize [
	<gtExample>
	| clock container |
	container := self clockDynamicContainer.
	clock := self clockFixedSize.
	clock aptitude: BlClockAptitude.

	container addChild: clock.
	^ container
]
