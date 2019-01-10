# welcome to the the sound maker!  
## jane lee cs98 hack-a-thing 1

## about processing

processing.js is a powerful javascript library and it's good for user interactivity and visualizations.  a lot of people use it for games, music, and other visual applications with lots of graphics.  


examples of what other people have done here: http://processingjs.org/exhibition/


## what this app does

this app is essentially a beatmaker where one can select little pods on the grid.  x-axis is the beat and the y-axis is the type of sound, as denoted by the icons.  the play button starts the beatmaker with the current selected pods.  the album covers can be selected and the song will play, in which the user can overlay his/her beats on top.  have fun!

## difficulties

i had some initial difficulties figuring out how the music component worked.  Processing has some cool native music imports that was confusing to play with at first, but looking through the instructions of the cs2 website helped.


i then had some difficulty getting the timing of the loop to work.  I had to do some maths to figure out how I would work the number of columns of the pods (8) and then do the mod of that in order make the sure the distance of the current beat highlighter would increment correctly.  


## references | citations
all the help I had was from the cs2 website, which has detailed instructions on processing.js

* https://cs.dartmouth.edu/~mcasey/cs2/index.php
* https://cs.dartmouth.edu/~mcasey/cs2/notes/sound3.php
* https://cs.dartmouth.edu/~mcasey/cs2/notes/sound.php
