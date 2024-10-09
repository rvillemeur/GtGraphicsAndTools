Class {
	#name : #BlClockAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockAptitude >> initialize [
super initialize.
self default: [ :aStyle | 
					aStyle
						geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
						background: ( BlBackground  paint: Color lightBlue);
						border: (BlBorder paint: Color black width: 4) ]
]
