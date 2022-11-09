Class {
	#name : #RdvBlocExperiment,
	#superclass : #Object,
	#category : #RdvBloc
}

{ #category : #accessing }
RdvBlocExperiment >> animatedIconExample [
<gtExample>

|icon elt|

icon := BrGlamorousVectorIcons transcript asElement.
icon constraintsDo: [ :c | c accountTransformation ].

elt := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: (BlZoomableLayout new addLayout: BlFrameLayout new; defaultScale: 2; animationDuration: 1 second);
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: icon;
    yourself.
    
^elt
]

{ #category : #accessing }
RdvBlocExperiment >> example1 [
<gtExample>
^BlElement new size:200@100; geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
background: (Color gray alpha:0.2);
border: (BlBorder paint: Color red width: 1);
"layout: BlLinearLayout horizontal alignCenter;"
"constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
outskirts: BlOutskirts centered

]

{ #category : #accessing }
RdvBlocExperiment >> example2 [
<gtExample>
^BlElement new size: 22@14;
	 layout: BlFrameLayout new;
	 padding: (BlInsets all: 3);
	 border: (BlBorder builder width: 1; build);
	 geometry: (BlRoundedRectangleGeometry cornerRadius: 8).
]

{ #category : #accessing }
RdvBlocExperiment >> exampleWithEvent [
<gtExample>
|element|
element := BlDevElement new size:200@200;
geometry:( BlPolygon
		vertices:
			{(100 @ 50).
			(115 @ 90).
			(150 @ 90).
			(125 @ 110).
			(135 @ 150).
			(100 @ 130).
			(65 @ 150).
			(75 @ 110).
			(50 @ 90).
			(85 @ 90)});
background: (Color pink alpha:0.2);
border: (BlBorder paint: Color white width: 1);
"layout: BlLinearLayout horizontal alignCenter;"
"constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
outskirts: BlOutskirts inside.

 element when: BlMouseEnterEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color red alpha:0.2) ].
		
 element when: BlMouseLeaveEvent do: [ :anEvent |
		anEvent consumed: true.
		element background: (Color blue alpha:0.2) ].
		
^element
]

{ #category : #accessing }
RdvBlocExperiment >> frameDrawingExample [
<gtExample>
^BlElement new
    layout: (BlGridLayout horizontal columnCount: 3);
    constraintsDo: [ :c |
        c horizontal matchParent.
        c vertical matchParent ];
    addChildren: {
        "top row"
        (BlTextElement new text: '5,0' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,0' asRopedText).
        
        "middle row"
        (BlElement new size: 0@0).
        (BlElement new
            constraintsDo: [ :c |
                c horizontal matchParent.
                c vertical matchParent ];
            border: (BlBorder paint: Color gray width: 1)).
        (BlElement new size: 0@0).
        
        "bottom row"
        (BlTextElement new text: '5,25' asRopedText).
        (BlElement new size: 0@0).
        (BlTextElement new text: '13,25' asRopedText). }
]

{ #category : #accessing }
RdvBlocExperiment >> helloWorldScene [
	<gtExample>
	| aContainer |
	
	aContainer := BrVerticalPane new
		matchParent;
		alignCenter.
		
	aContainer addChild: (BrLabel new
		aptitude: (BrGlamorousLabelAptitude new fontSize: 30);
		text: 'Hello world!').
		
	^ aContainer
]

{ #category : #accessing }
RdvBlocExperiment >> iconScaleToFitElementExample [
<gtExample>
|icon scaledIcon e|
icon := BrGlamorousVectorIcons transcript asElement.
scaledIcon := icon asScalableElement
    scaleStrategy: (BlScalableFixedStrategy zoom: 2);
    constraintsDo: [ :c |
        c horizontal fitContent.
        c vertical fitContent ].
    
e := BlElement new
    background: Color white;
    border: (BlBorder paint: Color gray width: 1);
    geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
    padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
    layout: BlFrameLayout new;
    constraintsDo: [ :c |
        c vertical fitContent.
        c horizontal fitContent ];
    addChild: scaledIcon;
    yourself.
    
^e
]

{ #category : #accessing }
RdvBlocExperiment >> layoutExample1 [
<gtExample>
^BlElement new layout: BlLinearLayout horizontal;
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2)
}
]

{ #category : #accessing }
RdvBlocExperiment >> layoutExample2 [
<gtExample>
^BlElement new layout: BlLinearLayout horizontal alignCenter;
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2)
}
]

{ #category : #accessing }
RdvBlocExperiment >> layoutExample3 [
<gtExample>
^BlElement new layout: BlLinearLayout horizontal "alignCenter";
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2);
constraintsDo:[ :c | c ignoreByLayout.
c vertical exact: 200.
			c horizontal exact: 100.
			c ignored horizontal alignRight.
			c ignored vertical alignBottom].
}    
]

{ #category : #accessing }
RdvBlocExperiment >> layoutExample4 [
<gtExample>
^BlElement new layout: BlLinearLayout horizontal "alignCenter";
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2);
constraintsDo:[ :c | c ignoreByLayout.
c vertical exact: 200.
			c horizontal exact: 100.
			c horizontal matchParent.
			c ignored horizontal alignRight.
			c ignored vertical alignBottom].
}
]

{ #category : #accessing }
RdvBlocExperiment >> layoutExample5 [
<gtExample>
^BlElement new layout: BlLinearLayout horizontal alignCenter;
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2);
constraintsDo:[ :c | c margin: (BlInsets all: 10)].
}
]

{ #category : #accessing }
RdvBlocExperiment >> openSpaceInNewWindowExample [
<gtExample>
	| aSpace |
	
	aSpace := BlSpace new
		addChild: self helloWorldScene;
		extent: 800@600;
		title: 'Hello World'.

	^ aSpace show
]
