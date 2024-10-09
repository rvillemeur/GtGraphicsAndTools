Class {
	#name : #BlClock,
	#superclass : #BlElement,
	#instVars : [
		'hourNeedle',
		'minutesNeedle',
		'secondNeedle',
		'center',
		'radius',
		'hourNeedleSize',
		'minuteNeedleSize',
		'secondNeedleSize',
		'model'
	],
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClock >> background [

	^ BlBackground  paint: Color lightGray
]

{ #category : #'as yet unclassified' }
BlClock >> border [

	^ BlBorder paint: Color black width: 4
]

{ #category : #'as yet unclassified' }
BlClock >> geometry [

	^ BlCircleGeometry new matchExtent: self extent.
]

{ #category : #'as yet unclassified' }
BlClock >> initAnimation [

	| animation |
	animation := BlAnimation new
		             beInfinite;
		             duration: 0.5 seconds.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent |
				 model time: Time now.
				self updateNeedlesPosition.
				 self invalidate ]).

	self addAnimation: animation
]

{ #category : #'as yet unclassified' }
BlClock >> initClock [
	self removeChildren.

	self initConstant.
	self initClockFrame.
	self initElements.
	self initAnimation
]

{ #category : #'as yet unclassified' }
BlClock >> initClockFrame [
	"draw small lines around clock frame"

	| quarterLength quarterWidth hourLength hourWidth |
	quarterLength := radius * 4.8 / 20.
	quarterWidth := 8.
	hourLength := radius * 3.2 / 20.
	hourWidth := 6.

	0
		to: 11
		do: [ :items | 
			| coordinate angle |
			angle := items * Float pi / 6.
			coordinate := angle cos @ angle sin.

			items % 3 == 0
				ifTrue: [  "quarter mark"self
						addChild: (BlElement new
								geometry: (BlLine
										from: center + (coordinate * (radius - quarterLength))
										to: center + (coordinate * radius));
								outskirts: BlOutskirts centered;
								border: (BlBorder paint: Color black width: quarterWidth)) ]
				ifFalse: [  "other hour marks"self
						addChild: (BlElement new
								geometry: (BlLine
										from: center + (coordinate * (radius - hourLength))
										to: center + (coordinate * radius));
								outskirts: BlOutskirts centered;
								border: (BlBorder paint: Color black width: hourWidth)) ] ]
]

{ #category : #'as yet unclassified' }
BlClock >> initConstant [

	center := radius @ radius.
	hourNeedleSize := radius / 2.
	minuteNeedleSize := radius * 14.8 / 20.
	secondNeedleSize := radius * 16.8 / 20
]

{ #category : #'as yet unclassified' }
BlClock >> initElements [

	hourNeedle := BlElement new
		              id: #hourNeedle;
		              geometry: BlLine new;
		              outskirts: BlOutskirts centered;
		              border: (BlBorder paint: Color black width: 5).

	minutesNeedle := BlElement new
		                 id: #minuteNeedle;
		                 geometry: BlLine new;
		                 outskirts: BlOutskirts centered;
		                 border: (BlBorder paint: Color black width: 5).

	secondNeedle := BlElement new
		                id: #secondNeedle;
		                geometry: BlLine new;
		                outskirts: BlOutskirts centered;
		                border: (BlBorder paint: Color red width: 3).

	self addChildren: {
			hourNeedle.
			minutesNeedle.
			secondNeedle }
]

{ #category : #'as yet unclassified' }
BlClock >> initialize [
	super initialize.
	model := BlClockModel new.
	self aptitude: BlClockAptitude new.
	self addEventHandlerOn: BlElementExtentChangedEvent do: [ :e | self resize ]
]

{ #category : #'as yet unclassified' }
BlClock >> resize [

	radius := self extent min / 2.0.
	self initClock
]

{ #category : #'as yet unclassified' }
BlClock >> size: aPoint [
	super size: aPoint.

	radius := aPoint x / 2.
	self initClock.
]

{ #category : #'as yet unclassified' }
BlClock >> updateHourNeedlePosition [

	| coordinate |
	coordinate := model  hourCoordinate.
	hourNeedle geometry from: center to: center + (coordinate * hourNeedleSize).
]

{ #category : #'as yet unclassified' }
BlClock >> updateMinuteNeedlePosition [

	| coordinate |
	coordinate := model  minuteCoordinate.
	minutesNeedle geometry from: center to: center + (coordinate * minuteNeedleSize)
]

{ #category : #'as yet unclassified' }
BlClock >> updateNeedlesPosition [

	self updateHourNeedlePosition.
	self updateMinuteNeedlePosition.
	self updateSecondNeedlePosition.
]

{ #category : #'as yet unclassified' }
BlClock >> updateSecondNeedlePosition [

	| coordinate |
	coordinate :=  model secondCoordinate.
	secondNeedle geometry
		from: center
		to: center + (coordinate * secondNeedleSize)
]
