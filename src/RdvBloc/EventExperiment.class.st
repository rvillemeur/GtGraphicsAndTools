"
some example on managing events and keyboard handling with bloc
"
Class {
	#name : #EventExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-experiment'
}

{ #category : #examples }
EventExperiment class >> blAnnulusExample [

	<sampleInstance>
	| tagDict pingCount piAngles fromAngle chart centerLabel element |
	tagDict := {
		           ('A' -> 10).
		           ('B' -> 20).
		           ('C' -> 30).
		           ('D' -> 40) } asDictionary.

	pingCount := tagDict values sum.
	piAngles := tagDict associations collect: [ :assoc |
		            assoc key -> (assoc value / pingCount * 360) ].

	fromAngle := 0.

	chart := BlElement new size: 700 @ 700.

	centerLabel := BlElement new position: 300 @ 300.

	piAngles do: [ :el |
		| start end sec label |
		start := fromAngle.
		end := fromAngle + el value.
		sec := BlAnnulusSectorGeometry new
			       startAngle: start;
			       endAngle: end;
			       innerRadius: 0.5.

		label := BlTextElement new text: el key asRopedText.
		label position: 300 @ 300.

		fromAngle := el value + fromAngle.

		element := BlElement new
			           background: (BlColorPaint color: Color random);
			           size: 400 @ 400;
			           geometry: sec.

		element position: 100 @ 100.

		element
			addEventHandlerOn: BlMouseEnterEvent
			do: [ chart addChild: label as: #centerLabel ].

		element
			addEventHandlerOn: BlMouseLeaveEvent
			do: [ chart removeChildWithId: #centerLabel ].

		chart addChild: element ].
	chart openInNewSpace.

	^ chart
]

{ #category : #examples }
EventExperiment class >> blAnnulusExample2 [
	"you can click on part of the circle to put some action"

	<sampleInstance>
	| elt anEventExperiment |
	anEventExperiment := self new.
	elt := BlElement new
		       size: 400 @ 400;
		       addChildren: ({
				        ((-90 to: 30) -> (Color
						          r: 111
						          g: 91
						          b: 149
						          range: 255)).
				        ((30 to: 60) -> (Color
						          r: 152
						          g: 138
						          b: 193
						          range: 255)).
				        ((60 to: 120) -> (Color
						          r: 237
						          g: 150
						          b: 54
						          range: 255)).
				        ((120 to: 150) -> (Color
						          r: 243
						          g: 189
						          b: 55
						          range: 255)).
				        ((150 to: 230) -> (Color
						          r: 36
						          g: 174
						          b: 226
						          range: 255)).
				        ((230 to: 270) -> (Color
						          r: 99
						          g: 197
						          b: 198
						          range: 255)) } collect: [ :each |
					        BlElement new
						        addEventHandler: (BlEventHandler
								         on: BlClickEvent
								         do: [ :e | anEventExperiment inform: each key ]);
						        geometry: (BlAnnulusSectorGeometry new
								         startAngle: each key first;
								         endAngle: each key last);
						        background: each value;
						        constraintsDo: [ :c |
							        c horizontal matchParent.
							        c vertical matchParent ] ]).
	elt openInNewSpace.
	^ elt
]

{ #category : #examples }
EventExperiment class >> blocSpaceIntoMorphicExample [

	<sampleInstance>
	| spacePresenter aSpace |
	"copy this example from bloc-spec2. It's really cool to open a bloc space window into morphic"
	spacePresenter := SpBlSpaceInMorphPresenter new.

	"The space is ready to play with it"
	aSpace := spacePresenter space.

	aSpace root
		background: Color paleBlue;
		layout: BlFlowLayout horizontal.

	50 timesRepeat: [
		aSpace root addChild: (BlElement new
				 background: Color random translucent;
				 addEventHandlerOn: BlMouseEnterEvent
				 do: [ :evt | evt target background: Color random ];
				 yourself) ].

	spacePresenter open.

	^ spacePresenter
]

{ #category : #examples }
EventExperiment class >> eventExample [
	"This is a new method"

	<sampleInstance>
	| elt |
	elt := BlElement new
		       size: 200 @ 200;
		       geometry: (BlPolygonGeometry vertices: {
						        (100 @ 50).
						        (115 @ 90).
						        (150 @ 90).
						        (125 @ 110).
						        (135 @ 150).
						        (100 @ 130).
						        (65 @ 150).
						        (75 @ 110).
						        (50 @ 90).
						        (85 @ 90) });
		       background: (Color pink alpha: 0.2);
		       border: (BlBorder paint: Color orange width: 4);
		       "layout: BlLinearLayout horizontal alignCenter;""constraintsDo: [:c | c horizontal matchParent. c vertical matchParent.];"
		       outskirts: BlOutskirts outside.

	elt addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 anEvent consumed: true.
				 elt background: (Color red alpha: 0.2) ]).


	elt addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent 
			 do: [ :anEvent |
				 anEvent consumed: true.
				 anEvent consumed: true.
				 elt background: (Color blue alpha: 0.2) ]).

	elt openInNewSpace.
	^ elt
]

{ #category : #examples }
EventExperiment class >> eventExampleMouseMove [

	<sampleInstance>
	| surface elt |
	elt := BlElement new
		       size: 20 @ 20;
		       geometry: (BlPolygonGeometry vertices: {
						        (10 @ 5).
						        (11.5 @ 9).
						        (15 @ 9).
						        (12.5 @ 11).
						        (13.5 @ 15).
						        (10 @ 13).
						        (6.5 @ 15).
						        (7.5 @ 11).
						        (5 @ 9).
						        (8.5 @ 9) });
		       background: (Color red alpha: 0.5);
		       border: (BlBorder paint: Color blue width: 1).

	surface := BlElement new
		           size: 400 @ 400;
		           geometry: BlSquareGeometry new;
		           background: (Color pink alpha: 0.2);
		           border: (BlBorder paint: Color orange width: 4).

	surface addChild: elt.
	elt position: -20 @ -20.

	surface addEventHandler: (BlEventHandler
			 on: BlMouseMoveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt position: anEvent localPosition + (10 @ 10) ]).

	surface addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt position: -20 @ -20 ]).
	surface openInNewSpace.
	^ surface
]

{ #category : #examples }
EventExperiment class >> exampleDragAndRainbow [

	<sampleInstance>
	| root stroke wh colors a |
	root := BlElement new
		        size: (wh := 640 @ 480);
		        background: Color black.
	stroke := BlBorder paint: Color black.

	"Draw a rainbow"
	colors := #( #red #orange #yellow #green #blue #purple ).
	1 to: (colors size) do: [ :i |
		| r el |
		r := colors size + 1 - i * 400 ** 0.8.
		el := BlElement new
			      size: r @ r;
			      geometry: (BlAnnulusSectorGeometry new
					       startAngle: 180;
					       endAngle: 360);
			      background: (Color named: (colors at: i));
			      border: stroke;
			      position: root extent + wh - (r @ r) / 2 + (0 @ 120).
		root addChild: el ].

	"Draggable card that says 'Rainbow!'"
	a := BlElement new
		     geometry: BlRectangleGeometry new;
		     size: 65 @ 24;
		     background: Color white;
		     border: stroke.
		     
		a addEventHandlerOn: BlMouseOverEvent
		     do: [ :e | a background: Color lightGray ].
		a addEventHandlerOn: BlMouseOutEvent
		     do: [ :e | a background: Color white ].
		
		a addEventHandler: BlPullHandler new disallowOutOfBounds;
		     addChild: (BlTextElement new
				      position: 5 @ 5;
				      text: ('Rainbow!' asRopedText attributes:
							       { (BlTextForegroundAttribute paint: Color black) })).

	root addChild: a.
	root openInNewSpace.
	^ root
]

{ #category : #examples }
EventExperiment class >> exampleMouseOver [

	<sampleInstance>
	| elt |
	elt := BlElement new
		       size: 200 @ 200;
		       geometry: (BlPolygonGeometry vertices: {
						        (100 @ 50).
						        (115 @ 90).
						        (150 @ 90).
						        (125 @ 110).
						        (135 @ 150).
						        (100 @ 130).
						        (65 @ 150).
						        (75 @ 110).
						        (50 @ 90).
						        (85 @ 90) });
		       background: (Color pink alpha: 0.2);
		       border: (BlBorder paint: Color black width: 1).

	elt addEventHandler: (BlEventHandler
			 on: BlMouseOverEvent 
			 do: [ :anEvent |
				 anEvent consumed: true.
				 elt
					 background: (Color blue alpha: 0.2);
					 border: (BlBorder paint: Color purple width: 1) ]).

	elt openInNewSpace.
	^ elt
]

{ #category : #examples }
EventExperiment class >> exampleWithDragAndDropEvent [

	<sampleInstance>
	| space source target reject offset |
	space := BlSpace new.

	source := BlElement new
		          id: #blue;
		          background: (Color blue alpha: 0.2);
		          size: 100 @ 100;
		          position: 10 @ 10.

	target := BlElement new
		          id: #red;
		          "zIndex: 1000;" "to put it in front of the others."
					 background: (Color red alpha: 0.2);
		          size: 100 @ 100;
		          position: 200 @ 200.

	reject := BlElement new
		          id: #green;
		          background: (Color green alpha: 0.2);
		          size: 100 @ 100;
		          position: 100 @ 200.

	"mandatory to be able to move element"
	"first pick of the element"
	source addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - source position ].

	"drag motion with the mouse is ongoing."
	source
		addEventHandlerOn: BlDragEvent
		do: [ :event | source position: event position - offset ].

	"Consider mouse has left element (when going over another element for ex"
	"source addEventHandlerOn: BlDragLeaveEvent do: [ :event |
		self inform: 'leave'.
		source position: event position - offset ]."

	"Consider mouse has entered element (when leaving over another element for ex"
	"source addEventHandlerOn: BlDragEnterEvent do: [ :event |
		self inform: 'enter'.
		source position: event position - offset ]."

	"mandatory to be able to move element"
	reject addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - reject position ].

	reject
		addEventHandlerOn: BlDragEvent
		do: [ :event | reject position: event position - offset ].

	target addEventHandlerOn: BlDropEvent do: [ :event |
		event consumed: true.
		event gestureSource background paint color = (Color blue alpha: 0.2)
			ifTrue: [ self inform: 'drop accepted' ]
			ifFalse: [
				self inform: 'drop rejected'.
				event gestureSource position: 100 @ 400 ] ].

	"note: order is important. Otherwise, use zIndex"
	space root addChildren: {
			source.
			reject. target. }.

	space show.
	^ space
]

{ #category : #examples }
EventExperiment class >> exampleWithDragAndDropEvent2 [

	<sampleInstance>
	| space source target reject offset |
	space := BlSpace new.

	source := BlElement new
		          id: #blue;
		          background: (Color blue);
		          size: 50 @ 50;
		          position: 10 @ 10.

	target := BlElement new
		          id: #red;
		          "zIndex: 1000;" "to put it in front of the others."
					 background: (Color red);
		          size: 100 @ 100;
		          position: 200 @ 200.

	reject := BlElement new
		          id: #green;
		          background: (Color green);
		          size: 50 @ 50;
		          position: 100 @ 200.

	"mandatory to be able to move element"
	"first pick of the element"
	source addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - source position ].

	"drag motion with the mouse is ongoing."
	source
		addEventHandlerOn: BlDragEvent
		do: [ :event | source position: event position - offset ].

	"Consider mouse has left element (when going over another element for ex"
	"source addEventHandlerOn: BlDragLeaveEvent do: [ :event |
		self inform: 'leave'.
		source position: event position - offset ]."

	"Consider mouse has entered element (when leaving over another element for ex"
	"source addEventHandlerOn: BlDragEnterEvent do: [ :event |
		self inform: 'enter'.
		source position: event position - offset ]."

	"mandatory to be able to move element"
	reject addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - reject position ].

	reject
		addEventHandlerOn: BlDragEvent
		do: [ :event | reject position: event position - offset ].

	target addEventHandlerOn: BlDropEvent do: [ :event |
		event consumed: true.
		event gestureSource background paint color = (Color blue)
			ifTrue: [ self inform: 'drop accepted' ]
			ifFalse: [
				self inform: 'drop rejected'.
				event gestureSource position: 100 @ 400 ] ].

target addEventHandlerOn: BlDragEnterEvent do: [ :event |
		self inform: 'target enter'].
	
	target addEventHandlerOn: BlDragLeaveEvent  do: [ :event |
		self inform: 'target leave'].
	"note: order is important. Otherwise, use zIndex"
	space root addChildren: {
						reject. target. source. }.

	space show.
	^ space
]

{ #category : #examples }
EventExperiment class >> exampleWithDragEvent [

	<sampleInstance>
	| space elt offset |
	space := BlSpace new.

	elt := BlElement new
		       background: Color purple;
		       size: 100 @ 100.

	elt
		addEventHandlerOn: BlBaseDragEvent
		do: [ elt background: Color random ].

	elt addEventHandlerOn: BlDragStartEvent do: [ :event |
		event consumed: true.
		offset := event position - elt position ].

	elt
		addEventHandlerOn: BlDragEvent
		do: [ :event | elt position: event position - offset ].


	space root addChild: elt.
	space show.
	^ space
]

{ #category : #examples }
EventExperiment class >> exampleWithEvent [

	<sampleInstance>
	| element space |
	space := BlSpace new.

	element := BlElement new
		           size: 200 @ 200;
		           geometry: (BlPolygonGeometry vertices: {
						            (100 @ 50).
						            (115 @ 90).
						            (150 @ 90).
						            (125 @ 110).
						            (135 @ 150).
						            (100 @ 130).
						            (65 @ 150).
						            (75 @ 110).
						            (50 @ 90).
						            (85 @ 90) });
		           background: (Color pink alpha: 0.2);
		           border: (BlBorder paint: Color white width: 1);
		           outskirts: BlOutskirts inside.

	element addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 element background: (Color red alpha: 0.2) ]).

	element addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent |
				 anEvent consumed: true.
				 element background: (Color blue alpha: 0.2) ]).

	space root addChild: element.
	space show.

	^ space
]

{ #category : #examples }
EventExperiment class >> exampleWithFullDragFullAndDropEvent [

	<sampleInstance>
| source1 source2 target space offset |
space := BlSpace new.
source1 := BlElement new size: 100 @ 100; background: Color red; border: (BlBorder paint: Color gray width: 2); position: 0@0.
source2 := BlElement new size: 100 @ 100; background: Color purple; border: (BlBorder paint: Color gray width: 2); position: 150@0.
target := BlElement new size: 100 @ 100; background: Color blue; border: (BlBorder paint: Color gray width: 2); position: 500 @ 500.

space root addChildren: { source1. source2. target. }.

source1 addEventHandlerOn: BlDragStartEvent do: [ :event | event consumed: true. self inform: 'source1 BlStartDragEvent'. 
	offset := event position - source1 position. 
	source1 removeFromParent.].
source1 addEventHandlerOn: BlDragEndEvent do: [ :event | event consumed: true. self inform: 'source1 BlDragEndEvent'. 	 ].
source1 addEventHandlerOn: BlDragEvent do: [ :event | event consumed: true. "self inform:  'source1 BlDragEvent'."
	source1 position: event position - offset.
	source1 hasParent ifFalse: [space root addChild: source1].
	source1 preventMeAndChildrenMouseEvents ].

source2 addEventHandlerOn: BlDragStartEvent do: [ :event | event consumed: true. self inform: 'source2 BlStartDragEvent'. 
	offset := event position - source2 position.
	source2  removeFromParent.].
source2 addEventHandlerOn: BlDragEndEvent do: [ :event | event consumed: true. self inform: 'source2 BlDragEndEvent'. ].
source2 addEventHandlerOn: BlDragEvent do: [ :event | event consumed: true. "self inform:  'source BlDragEvent'."
	source2 position: event position - offset.
	source2 hasParent ifFalse: [space root addChild: source2].
	source2 preventMeAndChildrenMouseEvents ].

target addEventHandlerOn: BlDropEvent do: [ :event | event consumed: true. self inform: 'target BlDropEvent'.
	event gestureSource background paint color = (Color red)
			ifTrue: [ self inform: 'drop accepted' ]
			ifFalse: [ self inform: 'drop rejected'. event gestureSource position: 100 @ 400; allowMeAndChildrenMouseEvents] ].
target addEventHandlerOn: BlDragEnterEvent do: [ :event | event consumed: true. self inform: 'target BlDragEnterEvent' ].
target addEventHandlerOn: BlDragLeaveEvent do: [ :event | event consumed: true. self inform: 'target BlDragLeaveEvent' ].

space show
]

{ #category : #examples }
EventExperiment class >> keyboardKeyAndSimulationExample [

	<sampleInstance>
	| space hero dxy speed simulatorProcess keyUpBlockByKey keyDownBlockByKey |
	"-- Setup visual properties of space and hero --""from http://ws.stfx.eu/5UQ515CAGRDU "
	space := BlSpace new.
	space
		position: 20 @ 20;
		extent: 640 @ 480;
		show.

	hero := BlElement new
		        size: 64 @ 64;
		        position: space extent // 3;
		        background: Color magenta;
		        yourself.

	space root
		addChild: hero;
		background: Color blue muchDarker.


	"-- Add some keyboard reactions --"

	dxy := 0 @ 0.
	speed := 2.

	keyDownBlockByKey := {
		                     (KeyboardKey up
		                      -> [ dxy := dxy x @ speed negated ]).
		                     (KeyboardKey down -> [ dxy := dxy x @ speed ]).
		                     (KeyboardKey left
		                      -> [ dxy := speed negated @ dxy y ]).
		                     (KeyboardKey right -> [ dxy := speed @ dxy y ]).
		                     (KeyboardKey Q -> [ space close ]) "quit" }
		                     asOrderedDictionary.

	keyUpBlockByKey := {
		                   (KeyboardKey up -> [ dxy := dxy x @ 0 ]).
		                   (KeyboardKey down -> [ dxy := dxy x @ 0 ]).
		                   (KeyboardKey left -> [ dxy := 0 @ dxy y ]).
		                   (KeyboardKey right -> [ dxy := 0 @ dxy y ]) }
		                   asOrderedDictionary.

	space root
		addEventHandler: (BlEventHandler
				 on: BlKeyDownEvent
				 do: [ :evt |
					 keyDownBlockByKey
						 at: evt key
						 ifPresent: [ :aBlock | aBlock value ] ]);
		addEventHandler: (BlEventHandler
				 on: BlKeyUpEvent
				 do: [ :evt |
					 keyUpBlockByKey
						 at: evt key
						 ifPresent: [ :aBlock | aBlock value ] ] yourself).

	hero enqueueTask: (BlRepeatedTaskAction new
			 delay: 0 milliSeconds;
			 action: [
				 dxy isZero ifFalse: [ hero position: hero position + dxy ] ];
			 yourself).

	simulatorProcess := [ "-- Simulate arrows, then quit --"
	                    {
		                    KeyboardKey right.
		                    KeyboardKey down.
		                    KeyboardKey left.
		                    KeyboardKey up } do: [ :simulatedKeyPress |
		                    space root dispatchEvent: (BlKeyDownEvent new
				                     key: simulatedKeyPress;
				                     yourself).
		                    0.75 seconds wait.
		                    space root dispatchEvent: (BlKeyUpEvent new
				                     key: simulatedKeyPress;
				                     yourself) ].

	                    "Quit"
	                    space root dispatchEvent: (BlKeyDownEvent new
			                     key: KeyboardKey Q;
			                     yourself) ] fork
]

{ #category : #'see class side' }
EventExperiment >> seeClassSide [ 
]
