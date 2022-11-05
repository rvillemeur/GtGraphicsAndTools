Class {
	#name : #RdvStyleAptitude,
	#superclass : #BrStyleAptitude,
	#category : #'RdvNote-RdvNote'
}

{ #category : #accessing }
RdvStyleAptitude >> initialize [
	"This is a new method"

	self
		size: 200 @ 200;
		geometry: (BlPolygon
				vertices: {100 @ 50.
						115 @ 90.
						150 @ 90.
						125 @ 110.
						135 @ 150.
						100 @ 130.
						65 @ 150.
						75 @ 110.
						50 @ 90.
						85 @ 90});
		background: (Color pink alpha: 0.2);
		border: (BlBorder paint: Color black width: 5)
]
