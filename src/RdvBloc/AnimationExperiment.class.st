"
animation experiment and example in Bloc
"
Class {
	#name : #AnimationExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-Bloc'
}

{ #category : #examples }
AnimationExperiment class >> GaussianEffectAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           size: 150 @ 150;
		           position: 25 @ 25;
		           background: Color yellow;
		           border: (BlBorder paint: Color red width: 3).

	animation := BlGaussianEffectOpacityAnimation new
		             delay: 1 second;
		             color: Color red;
		             width: 25;
		             opacity: 0.9;
		             duration: 300 milliSeconds.

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> animatedBackground [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color red ]
				             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> animatedBackground2 [

	<sampleInstance>
	| element animation |
	element := BlElement new size: 50 @ 50.

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             loops: 5;
		             duration: 3 seconds;
		"onStepDo: is called on every space pulse. Color are updated at each pulse..."
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color random ]
				             ifFalse: [ anElement background: Color blue ] ].

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> crossElement [

	<sampleInstance>
	| cross w h animation |
	w := 200.
	h := 200.
	cross := BlElement new
		         size: w @ h;
		         background: (BlBackground paint: (Color blue alpha: 0.2));
		         border: (BlBorder paint: Color black width: 2);
		         geometry: (BlPolygonGeometry vertices: {
						          (w / 3 @ 0).
						          (w / 3 * 2 @ 0).
						          (w / 3 * 2 @ (h / 3)).
						          (w @ (h / 3)).
						          (w @ (h / 3 * 2)).
						          (w / 3 * 2 @ (h / 3 * 2)).
						          (w / 3 * 2 @ h).
						          (w / 3 @ h).
						          (w / 3 @ (h / 3 * 2)).
						          (0 @ (h / 3 * 2)).
						          (0 @ (h / 3)).
						          (w / 3 @ (h / 3)) });
		         position: 30 @ 30.
	cross addEventHandler: (BlEventHandler
			 on: BlMouseEnterEvent
			 do: [ :anEvent | cross background: (Color red alpha: 0.2) ]).

	cross addEventHandler: (BlEventHandler
			 on: BlMouseLeaveEvent
			 do: [ :anEvent | cross background: (Color yellow alpha: 0.2) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey up);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position - (0 @ 10) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey right);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position + (10 @ 0) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey left);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position - (10 @ 0) ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey down);
			 action: [ :anEvent :aShortcut |
				 cross position: cross position + (0 @ 10) ]).

	animation := BlNumberTransition new
		             from: 0;
		             to: 1;
		             by: 0.5;
		             beInfinite;
		             duration: 3 seconds;
		             onStepDo: [ :aValue :anElement |
			             aValue < 0.5
				             ifTrue: [ anElement background: Color red ]
				             ifFalse: [ anElement background: Color blue ] ].

	cross addAnimation: animation.

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey S);
			 action: [ :anEvent :aShortcut | animation start ]).

	cross addShortcut: (BlShortcutWithAction new
			 combination: (BlSingleKeyCombination key: KeyboardKey E);
			 action: [ :anEvent :aShortcut | animation stop ]).

	cross openInNewSpace.
	cross requestFocus.
	^ cross
]

{ #category : #examples }
AnimationExperiment class >> minimalAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           size: 150 @ 150;
		           background: Color red.

	animation := BlAnimation new
		             beInfinite;
		             delay: 10 seconds;
		             duration: 5 seconds.

	element addAnimation: animation.

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationLoopDoneEvent
			 do: [ :anEvent | element opacity: 0.0 ]).

	animation addEventHandler: (BlEventHandler
			 on: BlAnimationStepEvent
			 do: [ :anEvent | element opacity: anEvent progress ]).

	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> opacityAnimation [

	<sampleInstance>
	| element animation |
	element := BlElement new
		           size: 150 @ 150;
		           background: Color yellow;
		           border: (BlBorder paint: Color red width: 3).

	animation := BlOpacityAnimation new
						delay: 1 second;
		             opacity: 0.1;
		             duration: 300 milliSeconds.

	element addAnimation: animation.
	element openInNewSpace.
	^ element
]

{ #category : #examples }
AnimationExperiment class >> rotateAnimationExample [

	<sampleInstance>
	| elt frame container anim |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       position: 100 asPoint;
		       size: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         position: 100 asPoint;
		         size: 100 asPoint.
	container := BlElement new
		             background: Color lightGreen;
		             size: 500 asPoint;
		             addChildren: {
				             frame.
				             elt }.

	anim := BlRotateAnimation new
		        angle: 90;
		        duration: 1 second.

	elt
		addEventHandlerOn: BlClickEvent
		do: [ elt addAnimation: anim copy ].

	container openInSpace.
	^ container
]

{ #category : #examples }
AnimationExperiment class >> sequentialBounceIn [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceIn ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceIn;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialBounceInOut [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceInOut ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceInOut ;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialBounceOut [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasing bounceOut;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasing bounceOut;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialElastic [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasingElastic new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasingElastic new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialQuad [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlEasingQuad new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlEasingQuad new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialQuintic [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlQuinticInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlQuinticInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialSine [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlSineInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlSineInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #examples }
AnimationExperiment class >> sequentialViscousFluid [

	<sampleInstance>
	| space element translation scale sequential |
	translation := (BlTransformAnimation translate: 300 @ 300)
		               easing: BlViscousFluidInterpolator new ;
		               duration: 2 seconds.

	scale := (BlTransformAnimation scale: 2 @ 2)
		         easing: BlViscousFluidInterpolator new;
		         duration: 2 seconds.

	sequential := BlSequentialAnimation new addAll: {
			              translation.
			              scale }.

	element := BlElement new
		           background: Color blue;
		           size: 100 @ 100;
		           position: 100 @ 100.
	element addAnimation: sequential.

	space := BlSpace new.
	space root addChild: element.
	space show.
	^space
]

{ #category : #'see class side' }
AnimationExperiment >> seeClassSide [ 
]
