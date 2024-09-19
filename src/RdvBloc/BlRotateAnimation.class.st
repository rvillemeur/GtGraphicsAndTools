"
A sample animation specialisation, where element is rotated by a specific angle.
"
Class {
	#name : #BlRotateAnimation,
	#superclass : #BlAnimation,
	#instVars : [
		'angle'
	],
	#category : #'RdvBloc-BlocAnimation'
}

{ #category : #accessing }
BlRotateAnimation >> angle: anAngle [

	angle := anAngle
]

{ #category : #pulse }
BlRotateAnimation >> applyValue: anAngle [

	self target transformDo: [ :t | t rotateBy: anAngle ]
]

{ #category : #pulse }
BlRotateAnimation >> valueForStep: aNumber [

	^ (angle * aNumber)
]
