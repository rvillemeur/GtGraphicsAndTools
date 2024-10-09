Class {
	#name : #BlClockModel,
	#superclass : #Object,
	#instVars : [
		'time'
	],
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BlClockModel >> hourCoordinate [

	| angleHours y angleTime  angleMinutes x |
	angleHours := Float pi / 6 * time hours.
	angleMinutes := Float pi / 360 * time minutes.
	angleTime := angleHours + angleMinutes.

	x := angleTime sin.
	y := angleTime cos * -1.

	^ 	x @ y.
]

{ #category : #'as yet unclassified' }
BlClockModel >> minuteCoordinate [

	| x y angle |
	angle := Float pi / 30 * time minutes.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'as yet unclassified' }
BlClockModel >> secondCoordinate [

	| x y angle  |
	angle := Float pi / 30 * time seconds.
	x := angle sin.
	y := angle cos * -1.
	^ x @ y.
]

{ #category : #'as yet unclassified' }
BlClockModel >> time: anObject [

	time := anObject
]
