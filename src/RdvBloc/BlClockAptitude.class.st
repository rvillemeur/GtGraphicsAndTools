Class {
	#name : #BlClockAptitude,
	#superclass : #BrAptitude,
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockAptitude >> initialize [
	super initialize.

	self
		addChangeProperty: #(widget background)
		with: [BlBackground paint: Color lightOrange ].
	self
		addChangeProperty: #(widget border)
		with: [BlBorder paint: Color blue width: 4 ].
		
	self
		addChangeProperty: #(widget geometry)
		with: [BlCircleGeometry new matchExtent: widget extent ].
		
	"self
		addChange: (BrLookChange new
				up: [ :e | 
					e widget
						border: (BlBorder paint: Color black width: 4);
						background: (BlBackground paint: Color lightBlue);
						geometry: (BlCircleGeometry new matchExtent: e widget extent) ])"
]
