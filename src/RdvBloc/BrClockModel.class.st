Class {
	#name : #BrClockModel,
	#superclass : #Object,
	#instVars : [
		'time'
	],
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BrClockModel >> hourCoordinate [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : #'as yet unclassified' }
BrClockModel >> minuteCoordinate [

	| x y angle |
	angle := Float pi / 30 * time minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'as yet unclassified' }
BrClockModel >> secondCoordinate [

	| x y angle  |
	angle := Float pi / 30 * time seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'as yet unclassified' }
BrClockModel >> time: anObject [

	time := anObject
]
