Class {
	#name : #BrClockWidgetModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'time'
	],
	#category : #'RdvBloc-BlocClock'
}

{ #category : #'as yet unclassified' }
BrClockWidgetModel >> initialize [
	super initialize.

	model := BrClockModel new
]

{ #category : #'as yet unclassified' }
BrClockWidgetModel >> initializeListeners [
	super initializeListeners.

	self when: BrIconRequest reply: [ :aResponse | aResponse icon: self icon ]
]

{ #category : #'as yet unclassified' }
BrClockWidgetModel >> modelName [
	^ 'Clock'
]

{ #category : #'as yet unclassified' }
BrClockWidgetModel >> notifyClockChanged [
	self dispatchEvent: (BrClockChanged new time: self time)
]

{ #category : #'as yet unclassified' }
BrClockWidgetModel >> notifyIconChanged [
	self dispatchEvent: (BrClockChanged new time: self time)
]

{ #category : #accessing }
BrClockWidgetModel >> time [
	^ time
]

{ #category : #accessing }
BrClockWidgetModel >> time: anObject [
	time := anObject.

	self notifyClockChanged
]
