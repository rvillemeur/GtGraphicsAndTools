Class {
	#name : #RdvHome,
	#superclass : #GtHomeSection,
	#category : #RdvBloc
}

{ #category : #accessing }
RdvHome >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Rdv Home Section').
	cardsContainer := self newCardsContainer.
	cardsContainer
		addChild: (self
				newShowCardWithTitle: 'Tour'
				slideshow: [ GtPresenterSlideShow create: GtTour new ]
				description: 'Take an interactive tour through the environment.').

	cardsContainer
		addChild: (self
				newHeaderCardWithTitle: 'Glamorous Toolkit'
				description: 'Read the Glamorous Toolkit book'
				size: 200 @ 150
				content: (BrLabel new
						text: 'Notes personnelles';
						aptitude: BrGlamorousLabelAptitude new bold;
						padding: (BlInsets all: 20)) asScalableElement
				action: [ :card | 
					| database startPage |
					database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
							databaseNamed: 'notes personnelles'.
					startPage := database pageNamed: 'Smalltalk various notes'.
					GtWorldUtility
						showSpaceWithTitle: startPage title
						inPagerWith: [ startPage asLepiterPagePhlowTool asElementDo: [ :e | e ] ]
								asStencil
						from: card ]).

	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
