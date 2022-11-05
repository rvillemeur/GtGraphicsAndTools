Class {
	#name : #RdvLayoutBlock,
	#superclass : #Object,
	#category : #RdvNote
}

{ #category : #accessing }
RdvLayoutBlock >> layout1 [

	"This is a new method"
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
RdvLayoutBlock >> layout2 [
<gtExample>
	"This is a new method"
	
	^BlElement new layout: BlLinearLayout horizontal alignCenter;
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2)
}
]

{ #category : #accessing }
RdvLayoutBlock >> layout3 [
<gtExample>
	"This is a new method"
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
RdvLayoutBlock >> layout4 [
<gtExample>
	"This is a new method"
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
RdvLayoutBlock >> layout5 [
<gtExample>
	"This is a new method"
	
	^BlElement new layout: BlLinearLayout horizontal alignCenter;
size: 400@300;
background: (Color gray alpha: 0.2);
addChildren: {
BlElement new size: 100@200; background:(Color red alpha: 0.2).
BlElement new size: 200@100; background:(Color blue alpha: 0.2);
constraintsDo:[ :c | c margin: (BlInsets all: 10)].
}
]
