
## A density plot of my fluid gender 4/8/23-15/7/24
https://github.com/Buijink/genderplot/blob/main/kkdp_genderplot.png

In this plot you can see nearly a year's worth of daily data about the way my gender identity fluctuates. Every day, I ask myself to score how much I am connected to either the term Woman, or the term Androgyne. When I started out I also tracked Man, but this value was always 0 anyway. I give these terms a score between 0 and 10, with the caveat that the sum of the values can not be more than 10. It is possible for them to be less than 10, which in fact happens most days.

Tracking the values in this way made it possible to plot a density plot like the one you see here. The darkness of the distribution indicates the frequency of the observed combination of values. Based on this plot we can conclude that within this model, my gender most often matches the coordinates 2.7 on the Androgyne scale and 7 on the Woman scale. 

Figuring out I was both transfem and genderfluid was a difficult and confusing process. At the start of my gender exploration in 2019 I used very rudimentary systems to trace the movement of my gender experience over time. I started doing this because it can be almost impossible to tell apart the fluidity of gender (especially if it includes an agender aspect) from the dissociation caused by dysphoria, which also makes it difficult to 'grasp' the way you feel about gender. Because, when dissociating, feelings about everything are distorted. 

The genderplot tool exists to enable the half-data half-art project of June to visualize her gender fluidity. The simple R script is made available on github together with a sample spreadsheet to let others try it out. In the actual version I use, the spreadsheet is a google sheet to enable convenient daily logging from my phone. 

The example plot shown here is plotted using MASS:filled.contour() 

In addition to the plot attached here, the script also generates an animated plot. 

https://github.com/Buijink/genderplot
