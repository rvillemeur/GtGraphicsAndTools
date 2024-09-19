Class {
	#name : #RdvHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'RdvBloc-home'
}

{ #category : #'as yet unclassified' }
RdvHomeSection >> defaultPriority [
	^ 10
]

{ #category : #'as yet unclassified' }
RdvHomeSection >> gtTechnicalNotesCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'GToolkit technical notes';
		description: 'Various notes on GToolkit tools and graphical stack';
		priority: 10;
		pageName: 'GToolkit technical stack';
		databaseName: 'GToolkit technical environment';
		readMoreToolbar;
		details: [ :db | 
			| snippets somePages |
			somePages := db pages select: #shouldAppearInIndexOrDailyNotes.
			snippets := somePages flatCollect: #allChildrenDepthFirst.
			'Collection of notes on GToolkit technical stack and tools. It currently contain '
				, somePages size asString , ' pages containing '
				, snippets size asString , ' snippets of '
				, (snippets groupedBy: #class) size asString , ' different kinds.' ]
				yourself
]

{ #category : #'as yet unclassified' }
RdvHomeSection >> gtTourCard [
"note: not used"
	<gtExample>
	<noTest>
	^ GtHomeCard job
		title: 'GtTour';
		description: 'GtTour slideshow';
		priority: 20;
		block: [ GtPresenterSlideShow openInSpace: GtTour ];
		yourself
]

{ #category : #'as yet unclassified' }
RdvHomeSection >> oldCreate [
"override create method, when the class was previously a child of GtHomeSection"
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

{ #category : #'as yet unclassified' }
RdvHomeSection >> sectionTitle [
	^ 'RdeV Home section'
]

{ #category : #'as yet unclassified' }
RdvHomeSection >> slideshowCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	^ GtHomeCard slideshow
		title: 'GtTour';
		description: 'GtTour slideshow';
		slideshowClassSymbol: #GtTour
			baseLineName: ''
			repo: '' yourself	"setPriority;"
]
