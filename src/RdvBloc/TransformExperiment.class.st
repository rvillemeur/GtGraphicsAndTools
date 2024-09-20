"
A couple of example on the transform possibility in bloc
- rotating
- translating
- scaling.
"
Class {
	#name : #TransformExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-experiment'
}

{ #category : #examples }
TransformExperiment >> absoluteTransformationExample [

	<gtExample>
	| elt frame container |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       relocate: 100 asPoint;
		       size: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         relocate: 100 asPoint;
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
	^ container
]

{ #category : #examples }
TransformExperiment >> shearExample [

	<gtExample>
	| elt frame container |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       relocate: 100 asPoint;
		       size: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         relocate: 100 asPoint;
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

	^ container
]

{ #category : #examples }
TransformExperiment >> topLeftOriginExample [

	<gtExample>
	| elt frame container |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       relocate: 100 asPoint;
		       size: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         relocate: 100 asPoint;
		         size: 100 asPoint.
	container := BlElement new
		             background: Color lightGreen;
		             size: 500 asPoint;
		             addChildren: {
				             frame.
				             elt }.

	elt transformation: (BlElementLocalTransformation with:
			 ((BlMatrixTransformation matrix:
				   (BlMatrix2D rotation: 45 degreesToRadians)) origin:
				  BlAffineTransformationTopLeftOrigin new)).

	^ container
]

{ #category : #examples }
TransformExperiment >> transformBlBasicLayout [

	<gtExample>
	| child parent |
	child := BlElement new
		         background: Color lightBlue;
		         geometry: BlCircleGeometry new;
		         yourself.

	child relocate: 100 @ 100.

	parent := BlElement new
		          size: 200 asPoint;
		          addChild: child;
		          background: Color lightRed.

	parent layout onLayoutDone: [
		child transformDo: [ :t | t translateBy: child size negated / 2 ] ].

	^parent.
]

{ #category : #examples }
TransformExperiment >> transformExample [

	<gtExample>
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

	container layout onLayoutDone:  [ container addChild: node.].

	^ container
]

{ #category : #examples }
TransformExperiment >> usingAnimationPropertyExample [

	<gtExample>
	| elt frame container |
	elt := BlElement new
		       background: (Color red alpha: 0.5);
		       relocate: 100 asPoint;
		       size: 100 asPoint.
	frame := BlElement new
		         background: Color yellow;
		         relocate: 100 asPoint;
		         size: 100 asPoint.
	container := BlElement new
		             background: Color lightGreen;
		             size: 500 asPoint;
		             addChildren: {
				             frame.
				             elt }.

	elt transformation: (BlElementLocalTransformation with:
			 ((BlRotationTransformation new angle: 45) origin:
				  BlAffineTransformationCenterOrigin new)).
	^ container
]
