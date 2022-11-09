"
Experiment on creating manually Form with various pixel depth

update the value of the sprite in the **initialize** method, to play with the different Forms
"
Class {
	#name : #RdvFormExperiment,
	#superclass : #Morph,
	#instVars : [
		'sprite'
	],
	#category : #RdvMorph
}

{ #category : #accessing }
RdvFormExperiment >> defaultLabel [

	^ 'form experiment'
]

{ #category : #'instance creation' }
RdvFormExperiment >> drawOn: aCanvas [
	aCanvas
		paintImage: (sprite  magnifyBy: self magnifyFactor )
		at: self topLeft
]

{ #category : #accessing }
RdvFormExperiment >> eightBitColorWithBitmap [
<gtExample>
	| bitmap array |
	array := ByteArray new: 256.
	16r0 to: 16rff do: [ :i | array at: i + 1 put: i ].
	array := (array groupsOf: 4) collect: [ :each | each asInteger ].

	"bitmap contain 256/8 = 64 items"
	bitmap := Bitmap new: 64.
	1 to: 64 do: [ :i | bitmap at: i put: (array at: i) ].

	"either a 64 line of 4 color (*8 to reach 32 bits)"
	Form extent: 4 @ 64 depth: 8 bits: bitmap.
	"or a square of 16 lines composed of 4 color (to get 32 bits) * 4 time"
	^ Form extent: 16 @ 16 depth: 8 bits: bitmap
]

{ #category : #accessing }
RdvFormExperiment >> eightBitColorWithoutBitmap [
<gtExample>
	| array |
	array := ByteArray new: 256.

	16r0 to: 16rff do: [ :i | array at: i + 1 put: i ].

	^(Form extent: 4 @ 64 depth: 8) initFromArray:
		((array groupsOf: 4) collect: [ :each | each asInteger ])
	
]

{ #category : #accessing }
RdvFormExperiment >> fourBitColorDepth [
<gtExample>
	^ (Form extent: 8 @ 2 depth: 4) initFromArray:
		  #( 2r00000001001000110100010101100111
		     2r10001001101010111100110111101111 ) "size of the form" "color depth - 16 => 2 bits to define color value" "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
	"[ 0000 0000 0000 0000 0000 0000 0000 0000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^4 = 16 different color"
	"[ 0000 0000 0000 0000 0000 0000 0000 0000]" "8 colors" "8 colors"
]

{ #category : #accessing }
RdvFormExperiment >> fourBitColorDepthWithColorForm [
<gtExample>
|pict map|
pict := ColorForm extent: 8@1 depth: 4.

"create a color map of 2^depth color"
map := {  Color transparent. 
			Color white. 
			Color r: 0.0 g: 0.5992179863147605 b: 0.19941348973607037 alpha: 1.0.
			Color gray.
			Color red.
			Color green.
			Color blue.
			Color yellow.
			Color transparent. 
			Color white. 
			Color blue.
			Color gray.
			Color red.
			Color green.
			Color blue.
			Color yellow. 
 }.
pict colors: map.
pict initFromArray: #(2r01000010001100011011110111101111).
^pict
]

{ #category : #accessing }
RdvFormExperiment >> helloWorldInBitmap [
<gtExample>
	^ (Form extent: 4 @ 3 depth: 8) initFromArray:
		  (('Hello world!' asByteArray groupsOf: 4) collect: [ :each | 
			   each asInteger ])
]

{ #category : #initialization }
RdvFormExperiment >> initialize [
	super initialize.
	sprite := self thirtyTwoBitColorDepth2.
	self extent: (32 * self magnifyFactor) @ (32 * self magnifyFactor)
]

{ #category : #initialization }
RdvFormExperiment >> magnifyFactor [
	^ 15
]

{ #category : #accessing }
RdvFormExperiment >> oneBitColorDepthWithBitmap [
<gtExample>
	| bitmap |
	bitmap := Bitmap newFrom: #( 2r10011000000100010000000000000001
		             2r11000000000000000000000000000000 ).

	^ (Form extent: 32 @ 2 depth: 1) initFromArray: bitmap
]

{ #category : #'as yet unclassified' }
RdvFormExperiment >> oneBitColorDepthWithFormColor [

	| pict map |
	pict := ColorForm extent: 32 @ 2 depth: 1.

	"create a color map of 2^depth color"
	map := { 
		       (Color
			        r: 0.0
			        g: 0.5992179863147605
			        b: 0.19941348973607037
			        alpha: 1.0).
		       Color blue }.
	pict colors: map.
	pict initFromArray: #( 2r01010101010101010101010101010101
		   2r10101010101010101010101010101010 ).
	^ pict
]

{ #category : #accessing }
RdvFormExperiment >> oneBitColorDepthWithoutBitmap [
<gtExample>
	^ (Form extent: 32 @ 2 depth: 1) initFromArray:
		  #( 2r10011000000100010000000000000001
		     2r11000000000000000000000000000000 ) 
]

{ #category : #'instance creation' }
RdvFormExperiment >> open [
	<script: 'self new openInWindow'>
]

{ #category : #accessing }
RdvFormExperiment >> sixteenColorDepth [
<gtExample>
^(Form extent: 6@1 "size of the form"
 depth: 16 "color depth - 16 => 2 bits to define color value 65K color possible")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0  XXXXX XXXXX XXXXX ]

----- ----- -----

       R     G     B
 first pixel 		second pixel   "
2r01111100000000000000000000011111 "red - blue"
2r00000011111000000111111111100000 "green -yellow"
2r01111111111111111000000000000000 "white -black"
) 
]

{ #category : #accessing }
RdvFormExperiment >> thirtyTwoBitColorDepth1 [
<gtExample>
^(Form extent: 7@1 "size of the form"
 depth: 32 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"colore are:
2r 00000000 00000000 00000000 00000000 
     ALPHA    RED 		BLUE     GREEN   "
		16rffff0000 "red"
		16rff0000ff "blue"
		16rff00ff00 "green"
		16rff000000 "black"
		16rffffffff "white"
		16rf0ff00d9 "pink"
		16r2fff0000 "red with opacity"
)
]

{ #category : #accessing }
RdvFormExperiment >> thirtyTwoBitColorDepth2 [
<gtExample>
^(Form extent: 3@3 "size of the form"
 depth: 32 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"colore are:
2r 00000000 00000000 00000000 00000000 
     ALPHA    RED 		BLUE     GREEN   "
		16rffff0000 "red" 	 16rff000000 "black" 16rff0000ff "blue"
		16rff000000 "black" 16rffffffff "white" 16rff000000 "black" 
		16rff00ff00 "green" 16rff000000 "black" 16rffffff00 "yello"

) 
]

{ #category : #accessing }
RdvFormExperiment >> twoBitColorDepth [
<gtExample>
^(Form extent: 16@1 "size of the form"
 depth: 2 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^2 = 4 different color"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]"
 2r00011011000110110001101100011011 "4 colors"
) 
]

{ #category : #accessing }
RdvFormExperiment >> twoBitColorDepthWithColorForm [
<gtExample>
|pict map|
pict := ColorForm extent: 16@1 depth: 2.

"create a color map of 2^depth color"
map := {  Color white. 
			Color r: 0.0 g: 0.5992179863147605 b: 0.19941348973607037 alpha: 1.0.
			Color blue.
			Color red.
 }.
pict colors: map.
pict initFromArray: #(2r00011011000110110001101100011011).
^pict
]
