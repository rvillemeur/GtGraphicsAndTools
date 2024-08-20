# PharoGraphics
Description of graphics stacks in pharo

Graphics in pharo

1. Introduction
2. The base of all: Forms - 1 bit, 2 bits, 4 bits, 8 bits, 16 bits and 32 bits.
3. Explanation on color and RGB color definition
4. Playing with forms - rotation, scaling, transition, etc...
5. Creating Forms: Bitmap canvas
6. Creating Forms: Vector Canvas and Athens.
7. Saving Forms - compressed image format: JPEG, PNG and GIF.
8. Event management, and relationship with OSWindow
9. Putting all together: Morphic
10. Morphic Coordinates
11. Morphic Events
12. Morphic widget composition and layout.
13. Morphic Animation
14. Higher order graphics for "application de gestion": Spec.
15. Spec Widget
16. Spec Layout
17. Spec Commander - implenting the command pattern
18. Spec Transmission
19. Spec style
20. Spec application - sourdough
21. Spec application - project selector
22. Spec application - extend inspector
23. The future: Bloc, Brick


```smalltalk
Metacello new
    baseline: 'PharoGraphics';
    repository: 'github://rvillemeur/PharoGraphics/src';
    load.
 ```
