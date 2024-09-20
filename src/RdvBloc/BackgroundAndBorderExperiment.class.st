"
various example on background and border settings in Bloc
"
Class {
	#name : #BackgroundAndBorderExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-experiment'
}

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> box: element text: aText [

	| container elt1 elt2 text |
	container := BlElement new
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	elt1 := BlElement new
		        layout: BlFrameLayout new;
		        constraintsDo: [ :c |
			        c horizontal fitContent.
			        c vertical fitContent ].

	element constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	elt1 addChild: element.


	elt2 := BlElement new
		        layout: BlFrameLayout new;
				padding: (BlInsets all:3);
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ].

	text := BlTextElement new
		        relocate: 5 @ 5;
		        text: (aText asRopedText attributes:
					         { (BlTextForegroundAttribute paint: Color black) });
		        constraintsDo: [ :c |
			        c frame horizontal alignCenter.
			        c frame vertical alignCenter ].
	elt2 addChild: text.

	container addChildren: {
			elt1.
			elt2 }.
	^ container
]

{ #category : #'as yet unclassified' }
BackgroundAndBorderExperiment >> builderBorder [

	<gtExample>

	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   paint: Color red;
				   width: 5;
				   build);
		  size: 100 @ 100
]

{ #category : #'as yet unclassified' }
BackgroundAndBorderExperiment >> builderCapButtBorder [

	<gtExample>

	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 100 @ 200;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   paint: Color red;
				   width: 5;
				   lineCap: BlStrokeLineCap butt;
				   lineJoin: BlStrokeLineJoin bevel;
				   miterLimit: 2.0;
				   dashArray: #( 10 5 );
				   dashOffset: 0;
				   build);
		  size: 200 @ 200
]

{ #category : #'as yet unclassified' }
BackgroundAndBorderExperiment >> builderOpacityBorder [
	<gtExample>
	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		background: Color yellow;
		border: (BlBorder builder
				paint: Color red;
				width: 5;
				opacity: 0.1;
				build);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleElementOutskirts [

	<gtExample>
	| container  |
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 5);
		             padding: (BlInsets all: 5);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 5);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].
	"size: 450 @ 150;"

	container addChild:
		(self box: self outskirtsOutside text: 'outskirts outside').
	container addChild:
		(self box: self outskirtsCentered text: 'outskirts centered').
	container addChild:
		(self box: self outskirtsInside text: 'outskirts inside').

	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleElementWithOpacity [
	<gtExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
			size: 450 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal;
			background: Color lightGray;
			border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal alignCenter;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			background: Color lightRed;
			opacity: 0.1;
			border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
			size: 100 @ 100;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color orange width: 5);
			background: Color lightOrange;
			outskirts: BlOutskirts centered.

	box1 addChild: element1.
	box2 := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal alignCenter;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			background: Color lightYellow;
			opacity: 0.5;
			border: (BlBorder paint: Color yellow width: 5).
	element2 := BlElement new
			size: 100 @ 100;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color green width: 5);
			background: Color lightGreen;
			outskirts: BlOutskirts centered.

	box2 addChild: element2.

	box3 := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal alignCenter;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			background: Color lightBlue;
			opacity: 0.9;
			border: (BlBorder paint: Color blue width: 5).
	element3 := BlElement new
			size: 100 @ 100;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color cyan width: 5);
			background: Color lightCyan;
			outskirts: BlOutskirts centered.

	box3 addChild: element3.
	container
		addChildren: {box1.
				box2.
				box3}.
	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleTriangle [

	<gtExample>
	| element1 element2 element3 container box1 box2 box3 |
	container := BlElement new
		             size: 1350 @ 450;
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3).
	box1 := BlElement new
		        size: 450 @ 450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightRed;
		        border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
		            size: 300 @ 300;
		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color orange); width: 15; build);
		            background: Color lightOrange;
		            outskirts: BlOutskirts centered.

	box1 addChild: element1.
	box2 := BlElement new
		        size: 450 @450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		        background: Color lightYellow;
		        border: (BlBorder paint: Color yellow width: 5).
	element2 := BlElement new
		            size: 300 @ 300;
		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color green); width: 15;  build);
		            background: Color lightGreen;
		            outskirts: BlOutskirts centered.

	box2 addChild: element2.
	
	box3 := BlElement new
		        size: 450 @ 450;
		        geometry: BlRectangleGeometry new;
		        margin: (BlInsets all: 3);
		        padding: (BlInsets all: 3);
		        layout: BlLinearLayout horizontal alignCenter;
		        constraintsDo: [ :c |
			        c horizontal matchParent.
			        c vertical matchParent ];
		         background: Color lightBlue;
		        border: (BlBorder paint: Color blue width: 5).
	element3 := BlElement new
		            size: 300@300;
		           		            geometry: (BlTriangleGeometry new
				   matchExtent: 150 @ 300);
		            border: (BlBorder  builder paint: (Color cyan); width: 15; build);
		            background: Color lightCyan;
		            outskirts: BlOutskirts centered.

	box3 addChild: element3.
	container addChildren: {
			box1.
			box2.
			box3 }.
	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleTriangleBackground [
	<gtExample>
	| container |
	container := BlElement new
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal;
			background: Color lightGray;
			border: (BlBorder paint: Color black width: 3);
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

	container addChild: (self box: self triangleBackgroundImage text: 'image').
	container
		addChild: (self box: self triangleBackgroundSolidColor text: 'solid color').
	container
		addChild: (self box: self triangleBackgroundLinearColor text: 'linear color').
	container
		addChild: (self box: self triangleBackgroundRadialColor text: 'radial color').


	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleTriangleBorderColor [
	<gtExample>
	| container |
	container := BlElement new
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal;
			background: Color lightGray;
			border: (BlBorder paint: Color black width: 3);
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

	container
		addChild: (self box: self triangleBorderSolidColor text: 'solid color').
	container
		addChild: (self box: self triangleBorderLinearGradient text: 'linear color').
	container
		addChild: (self box: self triangleBorderRadialGradient text: 'radial color').

	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleTriangleDashed [
	<gtExample>
	| container |
	container := BlElement new
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			layout: BlLinearLayout horizontal;
			background: Color lightGray;
			border: (BlBorder paint: Color black width: 3);
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].

	container addChild: (self box: self triangleDashedSmall text: 'dashedSmall').
	container
		addChild: (self box: self triangleDashedArray text: 'dashOffset: 0; dashArray: #( 6 4 2 )').
	container addChild: (self box: self triangleDashedNormal text: 'dashed').

	^ container
]

{ #category : #examples }
BackgroundAndBorderExperiment >> multipleTriangleWithCapAndJoin [

	<gtExample>
	| container  |
	container := BlElement new
		             geometry: BlRectangleGeometry new;
		             margin: (BlInsets all: 3);
		             padding: (BlInsets all: 3);
		             layout: BlLinearLayout horizontal;
		             background: Color lightGray;
		             border: (BlBorder paint: Color black width: 3);
		             constraintsDo: [ :c |
			             c horizontal fitContent.
			             c vertical fitContent ].

	container addChild:
		(self box: self triangleJoinRound text: 'round join').
	container addChild:
		(self box: self triangleJoinBevel text: 'bevel join').
	container addChild:
		(self box: self triangleJoinMiter text: 'miter join').

	^ container transformDo: [:t | t scaleBy: 0.7; topLeftOrigin].
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> outskirtsCentered [
	| box element1 element2 |
	box := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			background: Color lightYellow;
			border: (BlBorder paint: Color yellow width: 5).
	element1 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color green width: 15);
			background: Color lightGreen;
			outskirts: BlOutskirts centered.
	element2 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder builder
					paint: Color black;
					width: 2;
					dashOffset: 0;
					dashArray: #(6 4 2);
					capButt;
					build);
			background: Color transparent.

	box
		addChildren: {element1.
				element2}.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> outskirtsInside [
	| box element1 element2 |
	box := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			background: Color lightBlue;
			border: (BlBorder paint: Color blue width: 5).
	element1 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color cyan width: 10);
			background: Color lightCyan;
			outskirts: BlOutskirts inside.

	element2 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder builder
					paint: Color black;
					width: 2;
					dashOffset: 0;
					dashArray: #(6 4 2);
					capButt;
					build);
			background: Color transparent.
	box
		addChildren: {element1.
				element2}.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> outskirtsOutside [
	| box element1 element2 |
	box := BlElement new
			size: 150 @ 150;
			geometry: BlRectangleGeometry new;
			margin: (BlInsets all: 3);
			padding: (BlInsets all: 3);
			background: Color lightRed;
			border: (BlBorder paint: Color red width: 5).
	element1 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder paint: Color orange width: 10);
			background: Color lightOrange;
			outskirts: BlOutskirts outside.

	element2 := BlElement new
			size: 100 @ 100;
			relocate: 25 @ 25;
			geometry: (BlPolygon
					vertices: {50 @ 0.
							65 @ 40.
							100 @ 40.
							75 @ 60.
							85 @ 100.
							50 @ 80.
							15 @ 100.
							25 @ 60.
							0 @ 40.
							35 @ 40});
			border: (BlBorder builder
					paint: Color black;
					width: 2;
					dashOffset: 0;
					dashArray: #(6 4 2);
					capButt;
					build);
			background: Color transparent.
	box
		addChildren: {element1.
				element2}.
	^ box
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBackgroundImage [
	<gtExample>
	| builder background |
	builder := BlBackground builder.
	builder image
		form: PolymorphSystemSettings pharoLogoForm;
		opacity: 0.6.
	background := builder build.

	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		"background: PolymorphSystemSettings pharoLogoForm;"
		background: ((BlPaintBackground paint: Color red  asBlPaint) opacity: 0.75);
		border: (BlBorder paint: Color lightGray width: 5);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBackgroundLinearColor [
	<gtExample>
	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		background: ((BlLinearGradientPaint direction: 1 @ 1) from: Color red to: Color blue);
		border: (BlBorder paint: Color lightGray width: 5);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBackgroundRadialColor [
	<gtExample>
	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		background: (BlRadialGradientPaint new
				stops: {0 -> Color blue.
						1 -> Color red};
				center: 75 @ 75;
				radius: 50;
				yourself);
		border: (BlBorder paint: Color lightGray width: 5);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBackgroundSolidColor [
	"not working currently"

	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: (Color
				   r: 63
				   g: 81
				   b: 181
				   range: 255);
		  border: (BlBorder paint: Color lightGray width: 5);
		  size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBorderImage [
"not working currently"
	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: (BlImagePatternPaint form: PolymorphSystemSettings pharoLogoForm)
				   width: 5);
		  size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBorderLinearGradient [

	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: ((BlLinearGradientPaint direction: 1 @ 1)
						    matchExtent: 100 @ 75;
						    from: Color blue to: Color red)
				   width: 5);
		  size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBorderRadialGradient [

	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color lightGray;
		  border: (BlBorder
				   paint: (BlRadialGradientPaint new
						    stops: {
								    (0 -> Color blue).
								    (1 -> Color red) };
						    center: 50 @ 100 // 2;
						    radius: 50;
						    yourself)
				   width: 5);
		  size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleBorderSolidColor [

	<gtExample>
	^BlElement new
		geometry: (BlTriangleGeometry new
				 matchExtent: 50 @ 100;
				 beLeft);
		background:  Color lightGray;
		border: (BlBorder paint: Color red width: 10);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleColorDashed [

	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 1);
				   dashOffset: 0;
				   dashArray: #( 6 4 2 );
				   lineJoin: BlStrokeLineJoin bevel;
				   build);
		  size: 200 @ 200
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleDashedArray [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightYellow;
		       border: (BlBorder paint: Color yellow width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color green;
				            width: 15;
				            dashOffset: 0;
				            dashArray: #( 6 4 2 );
				            capButt;
				            build);
		           background: Color lightGreen;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleDashedColorWithBuilder [

	<gtExample>
	^ BlElement new
		  geometry: (BlTriangleGeometry new
				   matchExtent: 50 @ 100;
				   beLeft);
		  background: Color yellow;
		  border: (BlBorder builder
				   width: 5;
				   paint: (Color red alpha: 0.5);
				   dashed;
				   build);
		  size: 100 @ 100
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleDashedNormal [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightBlue;
		       border: (BlBorder paint: Color blue width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color cyan;
				            width: 15;
				            dashed;
				            lineJoin: BlStrokeLineJoin round;
				            build);
		           background: Color lightCyan;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleDashedSmall [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightRed;
		       border: (BlBorder paint: Color red width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color orange;
				            width: 15;
				            dashedSmall;
				            lineJoin: BlStrokeLineJoin round;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleJoinBevel [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightYellow;
		       border: (BlBorder paint: Color yellow width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color green;
				            width: 15;
				            capButt;
				            lineJoin: BlStrokeLineJoin bevel;
				            build);
		           background: Color lightGreen;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleJoinMiter [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightBlue;
		       border: (BlBorder paint: Color blue width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color cyan;
				            width: 15;
				            capSquare;
				            lineJoin: BlStrokeLineJoin miter;
				            build);
		           background: Color lightCyan;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #'examples - helpers' }
BackgroundAndBorderExperiment >> triangleJoinRound [

	| box element |
	box := BlElement new
		       size: 450 @ 450;
		       geometry: BlRectangleGeometry new;
		       margin: (BlInsets all: 3);
		       padding: (BlInsets all: 3);
		       layout: BlLinearLayout horizontal alignCenter;
		       background: Color lightRed;
		       border: (BlBorder paint: Color red width: 5).
	element := BlElement new
		           size: 300 @ 300;
		           geometry: (BlTriangleGeometry new matchExtent: 150 @ 300);
		           border: (BlBorder builder
				            paint: Color orange;
				            width: 15;
				            capRound;
				            lineJoin: BlStrokeLineJoin round;
				            build);
		           background: Color lightOrange;
		           outskirts: BlOutskirts centered.

	box addChild: element.
	^ box
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleSolidColor [
	<gtExample>
	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		background: Color yellow;
		border: (BlBorder paint: Color red width: 5);
		size: 100 @ 100
]

{ #category : #examples }
BackgroundAndBorderExperiment >> triangleSolidColorWithBuilder [
	<gtExample>
	^ BlElement new
		geometry: (BlTriangleGeometry new
				matchExtent: 50 @ 100;
				beLeft);
		background: Color yellow;
		border: (BlBorder builder
				width: 5;
				paint: Color red;
				build);
		size: 100 @ 100
]
