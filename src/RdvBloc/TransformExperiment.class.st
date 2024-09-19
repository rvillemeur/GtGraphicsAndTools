"
A couple of example on the transform possibility in bloc
- rotating
- translating
- scaling.
"
Class {
	#name : #TransformExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-Bloc'
}

{ #category : #examples }
TransformExperiment class >> absoluteTransformationExample [

	<sampleInstance>
	| elt frame container |
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

	elt transformation:
		(BlElementAbsoluteTransformation matrix: (BlMatrix2D new
				  x: 50;
				  y: 0;
				  shx: 45 degreesToRadians sin * -1;
				  shy: 45 degreesToRadians sin;
				  sx: 45 degreesToRadians cos;
				  sy: 45 degreesToRadians cos)).
	container openInSpace.
	^ container
]

{ #category : #examples }
TransformExperiment class >> shearExample [

	<sampleInstance>
	| elt frame container |
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

	elt transformation:
		(BlElementAbsoluteTransformation matrix: (BlShearTransformation new
				  angleX: 0;
				  angleY: 20) asMatrix).
	container openInSpace.
	^ container
]

{ #category : #examples }
TransformExperiment class >> topLeftOriginExample [

	<sampleInstance>
	| elt frame container |
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

	elt transformation: (BlElementLocalTransformation newWith:
			 ((BlMatrixTransformation matrix:
				   (BlMatrix2D rotation: 45 degreesToRadians)) origin:
				  BlAffineTransformationTopLeftOrigin new)).
	container openInSpace.
	^ container
]

{ #category : #examples }
TransformExperiment class >> transformBlBasicLayout [

	<sampleInstance>
	| child parent |
	child := BlElement new
		         background: Color lightBlue;
		         geometry: BlCircleGeometry new;
		         yourself.

	child position: 100 @ 100.

	parent := BlElement new
		          size: 200 asPoint;
		          addChild: child;
		          background: Color lightRed.

	parent whenLayoutedDoOnce: [
		child transformDo: [ :t | t translateBy: child size negated / 2 ] ].

	parent openInSpace.
	^parent.
]

{ #category : #examples }
TransformExperiment class >> transformExample [

	<sampleInstance>
	| container node |
	container := BlElement new
		              layout: BlFrameLayout new;
		              constraintsDo: [ :c |
			              c horizontal fitContent.
			              c vertical fitContent ];
		              padding: (BlInsets all: 20);
		              background: (Color gray alpha: 0.2).

	node := BlElement new
		        geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		        border: (BlBorder paint: Color black width: 2);
		        background: Color white;
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignCenter ];
		        size: 20 @ 20.

	container transformDo: [ :t |
		t
			scaleBy: 2.0;
			rotateBy: 69;
			translateBy: 50 @ 50 ].

	container whenLayoutedDoOnce:  [ container addChild: node.].

	container openInNewSpace. 
	^ container
]

{ #category : #examples }
TransformExperiment class >> usingAnimationPropertyExample [

	<sampleInstance>
	| elt frame container |
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

	elt transformation: (BlElementLocalTransformation newWith:
			 ((BlRotationTransformation new angle: 45) origin:
				  BlAffineTransformationCenterOrigin defaultInstance)).
	container openInSpace.
	^ container
]

{ #category : #'see class side' }
TransformExperiment >> seeClassSide [ 
]
