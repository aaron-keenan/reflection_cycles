![Group of generated images](https://raw.githubusercontent.com/aaron-keenan/reflection_cycles/master/documentation/images/group.jpg)

# Reflection Cycles

Reflection cycle generator using Processing. 

* Generates images based on a source photo file

* Options for regular or irregular sector angles

* Includes multiple options for sector angle size sequences: uniform, random, Fibonacci, parametric

* Can be passed a hard-coded list of angle sizes

* Angle sizes are adjusted for overall continuity*

## Regular
'uniform' mode for standard radial symmetry with equal sized sector angles.
![Regular reflection example (right) and sector diagram (left)](https://raw.githubusercontent.com/aaron-keenan/reflection_cycles/master/documentation/images/regular.jpg)

## Random
Randomly-generated sector angles.
![Irregular reflection example with random sector angles (right) and sector diagram (left)](https://raw.githubusercontent.com/aaron-keenan/reflection_cycles/master/documentation/images/random.jpg)

## Fibonacci
Sector angles based on a shuffled version of the Fibonacci sequence.
![Irregular reflection example with sector angles based on Fibonacci numbers (right) and sector diagram (left)](https://raw.githubusercontent.com/aaron-keenan/reflection_cycles/master/documentation/images/fibonacci.jpg)

## Parametric
Sector angles based on standard sine curve. 
![Irregular reflection example with sector angles based on a sin curve (right) and sector diagram (left)](https://raw.githubusercontent.com/aaron-keenan/reflection_cycles/master/documentation/images/parametric.jpg)

*The angles of all sectors total 360 degrees. There is overall continuity when the total angles of the forward (true image) sectors equal the total angles of the reverse (mirror image), i.e. 180 degrees forward, 180 degrees reverse.
