"
CrossMorph example taken from Pharo by example book, with event handled through pattern *CrossMorph example taken from Pharo by example book*
"
Class {
	#name : #CrossMorph2,
	#superclass : #Morph,
	#category : #RdvMorph
}

{ #category : #accessing }
CrossMorph2 >> defaultExtent [
	^ 60@60
]

{ #category : #accessing }
CrossMorph2 >> defaultLabel [

	^ 'CrossMorph tutorial'
]

{ #category : #geometry }
CrossMorph2 >> horizontalBar [

	| crossHeight |
	crossHeight := (self height / 3.0) rounded.
	^ self bounds insetBy: 0 @ crossHeight
]

{ #category : #initialization }
CrossMorph2 >> initialize [

	super initialize.
	self extent: self defaultExtent.
	self
		on: #mouseEnter send: #processMouseEnter: to: self;
		on: #mouseDown send: #processMouseDown: to: self;
		on: #mouseLeave send: #processMouseLeave: to: self;
		on: #keyDown send: #processKeyDown: to: self;
		on: #keyStroke send: #processKeyStroke: to: self
]

{ #category : #'instance creation' }
CrossMorph2 >> open [
	<script: 'self new openInWorld'>
]

{ #category : #'event handling' }
CrossMorph2 >> processKeyStroke: anEvent [

	| keyValue |
	keyValue := anEvent keyCharacter.
	keyValue == $+ ifTrue: [ self startStepping ].
	keyValue == $- ifTrue: [ self stopStepping ]
]

{ #category : #'event handling' }
CrossMorph2 >> processMouseDown: evt [

	evt redButtonPressed ifTrue: [ self color: (Color blue alpha: 0.3) ]. "click"
	evt yellowButtonPressed ifTrue: [ self color: Color yellow ]. "action-click"
	self changed
]

{ #category : #'event handling' }
CrossMorph2 >> processMouseEnter: evt [

	self color: (Color green alpha: 0.99).
	evt hand newKeyboardFocus: self
]

{ #category : #'event handling' }
CrossMorph2 >> processMouseLeave: evt [

	self color: (Color purple alpha: 0.99).
	evt hand releaseKeyboardFocus: self
]

{ #category : #'stepping and presenter' }
CrossMorph2 >> step [

	(self color diff: Color black) < 0.1
		ifTrue: [ self color: (Color red alpha: 0.99 )]
		ifFalse: [ self color: self color darker ]
]

{ #category : #stepping }
CrossMorph2 >> stepTime [

	^ 100
]

{ #category : #geometry }
CrossMorph2 >> verticalBar [

	| crossWidth |
	crossWidth := (self width / 3.0) rounded.
	^ self bounds insetBy: crossWidth @ 0
]
