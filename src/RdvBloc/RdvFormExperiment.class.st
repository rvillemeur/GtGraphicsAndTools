Class {
	#name : #RdvFormExperiment,
	#superclass : #Object,
	#category : #'RdvBloc-experiment'
}

{ #category : #example }
RdvFormExperiment >> example16BitForm [
<gtExample>
^(Form extent: 2@3 "size of the form"
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
; magnifyBy: 25.
]

{ #category : #example }
RdvFormExperiment >> example1BitCursorInMorphic [
<gtExample>
^(Form extent: 16@16
	depth: 1
	fromArray: #(
		2r10000001000000000000000000000000
		2r11000000000000000000000000000000
		2r11100000000000000000000000000000
		2r11110000000000000000000000000000
		2r11111000000000000000000000000000
		2r11111100000000000000000000000000
		2r11111110000000000000000000000000
		2r11111000000000000000000000000000
		2r11111000000000000000000000000000
		2r10011000000000000000000000000000
		2r00001100000000000000000000000000
		2r00001100000000000000000000000000
		2r00000110000000000000000000000000
		2r00000110000000000000000000000000
		2r00000011000000000000000000000000
		2r00000011000000000000000000000000) 
	offset: 0@0) magnifyBy: 10.
]

{ #category : #example }
RdvFormExperiment >> example1BitFormAndColorMap [
<gtExample>
|pict map|
pict := ColorForm extent: 32@2 depth: 1.

"create a color map of 2^depth color"
map := {  Color r: 0.0 g: 0.5992179863147605 b: 0.19941348973607037 alpha: 1.0. 
			Color blue. 
 }.
pict colors: map.
pict initFromArray: #(
2r01010101010101010101010101010101
2r10101010101010101010101010101010).
^pict magnifyBy: 25
]

{ #category : #example }
RdvFormExperiment >> example1bitBitmap [
<gtExample>
|bitMap|

bitMap := Bitmap newFrom: #( "pixel color, expressed on 4 byte"
		2r10011000000100010000000000000001
		2r11000000000000000000000000000000
) .

^(Form extent: 32@2 "size of the form"
 depth: 1 "color depth")
 initFromArray: bitMap
; magnifyBy: 10.
]

{ #category : #example }
RdvFormExperiment >> example1bitFish [
<gtExample>

^(Form extent: 32@20
	depth: 1
	fromArray: #(
2r00000000011100000000000000000000
2r00000000001110000000000000000000
2r00000000001111000000000000000000
2r00000000001111110000000000000000
2r00100000011111111110000000000000
2r11100001111111111111000000000000
2r01110011111111111111100000000000
2r01111011111111110111110000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r01111011111111111111110000000000
2r01110001111111111111100000000000
2r11100001111111111111000000000000
2r00100000011111111100000000000000
2r00000000001111100000000000000000
2r00000000000111000000000000000000
2r00000000000110000000000000000000
2r00000000000100000000000000000000)
offset: 10@0) magnifyBy: 20
]

{ #category : #example }
RdvFormExperiment >> example1bitFishInColor [
<gtExample>
|pict map|
pict := ColorForm extent: 32@20 depth: 1.

"create a color map of 2^depth color"
map := {  Color white. 
			Color lightBlue. 
 }.
pict colors: map.
pict initFromArray: #(
2r00000000011100000000000000000000
2r00000000001110000000000000000000
2r00000000001111000000000000000000
2r00000000001111110000000000000000
2r00100000011111111110000000000000
2r11100001111111111111000000000000
2r01110011111111111111100000000000
2r01111011111111110111110000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r00111111111111111111111000000000
2r01111011111111111111110000000000
2r01110001111111111111100000000000
2r11100001111111111111000000000000
2r00100000011111111100000000000000
2r00000000001111100000000000000000
2r00000000000111000000000000000000
2r00000000000110000000000000000000
2r00000000000100000000000000000000).
^pict magnifyBy: 25
]

{ #category : #example }
RdvFormExperiment >> example1bitForm [
<gtExample>
^(Form extent: 32@2 "size of the form"
 depth: 1 "color depth")
 initFromArray: #( "pixel color, expressed on 4 bytes"
		2r10011000000100010000000000000001
		2r11000000000000000000000000000000
) 
; magnifyBy: 10.
]

{ #category : #example }
RdvFormExperiment >> example1bitFormWith2Colors [
<gtExample>
^(Form extent: 32@2 "size of the form"
 depth: 1 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( 
 2r10101010101010101010101010101010
 2r01010101010101010101010101010101 "2 colors"
) 
; magnifyBy: 25.
]

{ #category : #example }
RdvFormExperiment >> example2BitForm [
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
; magnifyBy: 25.
]

{ #category : #example }
RdvFormExperiment >> example2BitFormWithColorMap [
	<gtExample>
	| pict map |
	pict := ColorForm extent: 16 @ 1 depth: 2.	"create a color map of 2^depth color"
	map := {Color white.
			Color
				r: 0.0
				g: 0.5992179863147605
				b: 0.19941348973607037
				alpha: 1.0.
			Color blue.
			Color red}.
	pict colors: map.
	pict initFromArray: #(2r00011011000110110001101100011011).
	^ pict magnifyBy: 25
]

{ #category : #example }
RdvFormExperiment >> example32BitForm [
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
; magnifyBy: 25.

]

{ #category : #example }
RdvFormExperiment >> example32BitFormInSquare [
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
; magnifyBy: 15.
]

{ #category : #'as yet unclassified' }
RdvFormExperiment >> example4BitForm [
<gtExample>
^(Form extent: 8@2 "size of the form"
 depth: 4 "color depth - 16 => 2 bits to define color value")
 initFromArray: #( "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]
	first 		second    third    fourth pixel   
  Each pixel can have 2^4 = 16 different color"
"[ 0000 0000 0000 0000 0000 0000 0000 0000]"
 2r00000001001000110100010101100111 "8 colors"
 2r10001001101010111100110111101111 "8 colors"
) 
; magnifyBy: 25.
]

{ #category : #'as yet unclassified' }
RdvFormExperiment >> example4BitFormWithColorMap [
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
^pict magnifyBy: 25
]

{ #category : #'as yet unclassified' }
RdvFormExperiment >> example8BitForm [
<gtExample>
 "pixel color, expressed on 4 bytes or 32 bits, which is the maximum of color depth
 [ 00000000 00000000 00000000 00000000]
	first    second    third    fourth pixel   
  Each pixel can have 2^8 = 256 different color"

| bitmap array |
array := ByteArray new: 256.
16r0 to: 16rff do: [ :i | array at: i + 1 put: i ].
array := (array groupsOf: 4) collect: [ :each | each asInteger ].

"bitmap contain 256/8 = 64 items"
bitmap := Bitmap new: 64.
1 to: 64 do: [ :i | bitmap at: i put: (array at: i) ].

"either a 64 line of 4 color (*8 to reach 32 bits)"
^(Form extent: 4 @ 64 "size of the form" depth: 8 "color depth - 16 => 2 bits to define color value" bits: bitmap)magnifyBy: 25.


]

{ #category : #'as yet unclassified' }
RdvFormExperiment >> example8BitFormWithColorMap [
<gtExample>
|pict map bitmap array|
pict := ColorForm extent: 16 @ 16 depth: 8.

array := ByteArray new: 256.
16r0 to: 16rff do: [ :i | array at: i + 1 put: i ].
array := (array groupsOf: 4) collect: [ :each | each asInteger ].

"bitmap contain 256/8 = 64 items"
bitmap := Bitmap new: 64.
1 to: 64 do: [ :i | bitmap at: i put: (array at: i) ].

"create a color map of 2^depth color"
map := (Color indexedColors copy) reverse .
map at: 1 put: Color transparent.
pict colors: map.

pict bits: bitmap.
"or a square of 16 lines composed of 4 color (to get 32 bits) * 4 time"
^pict magnifyBy: 25


]
