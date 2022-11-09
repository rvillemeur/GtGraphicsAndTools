Class {
	#name : #PasswordDialogPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameText',
		'passwordText',
		'acceptButton',
		'cancelButton'
	],
	#category : #RdvSpec
}

{ #category : #accessing }
PasswordDialogPresenter >> acceptButton [
	^ acceptButton
]

{ #category : #accessing }
PasswordDialogPresenter >> acceptButton: anObject [
	acceptButton := anObject
]

{ #category : #accessing }
PasswordDialogPresenter >> cancelButton [
	^ cancelButton
]

{ #category : #accessing }
PasswordDialogPresenter >> cancelButton: anObject [
	cancelButton := anObject
]

{ #category : #initialization }
PasswordDialogPresenter >> initializeLayout [
self layout: (SpGridLayout new
				borderWidth: 0;
				add: 'Name:' at: 1 @ 1;
				add: #nameText at: 2 @ 1;
				add: 'Password:' at: 1 @ 2;
				add: #passwordText at: 2 @ 2;
				add:
					(SpBoxLayout newVertical
						add: #acceptButton;
						add: #cancelButton; yourself)
					at: 1 @ 3
					span: 2 @ 1;
					add: #acceptButton at: 1@3;
					add: #cancelButton at: 2@3;
				yourself)
]

{ #category : #initialization }
PasswordDialogPresenter >> initializePresenters [
	nameText := self newTextInput.
	passwordText := self newTextInput
		text: 'Password';
		bePassword.
	acceptButton := self newButton label: 'OK'.
	cancelButton := self newButton label: 'Cancel'.
	self initializeLayout.
	self focusOrder
		add: nameText;
		add: passwordText
]

{ #category : #initialization }
PasswordDialogPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: 'password window example'
		";initialExtent: 300@400"
]

{ #category : #accessing }
PasswordDialogPresenter >> nameText [
	^ nameText
]

{ #category : #accessing }
PasswordDialogPresenter >> nameText: anObject [
	nameText := anObject
]

{ #category : #accessing }
PasswordDialogPresenter >> passwordText [
	^ passwordText
]

{ #category : #accessing }
PasswordDialogPresenter >> passwordText: anObject [
	passwordText := anObject
]

{ #category : #'instance creation' }
PasswordDialogPresenter >> start [
<script: 'self new open'>
]
