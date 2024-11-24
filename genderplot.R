#JDAB 2024_02_19
#updated 2024_11_24

library(tidyverse)
library(gifski)
library(gganimate)
library(ggrepel)
library(colorspace)
library(transformr)
library(MASS)

##the first part of this script manipulates the data for plotting, especially for use with the animated plotting part of the script

theme_set(theme_bw())

gender <- read_csv("gender_tracker.csv")

##An example of gender_tracker.csv can be found on github. However, this file is provided as an .xlsx to enable calculation of agender_sum
##this is not essential for the functioning of the script. In the end, agender_sum was not plotted because its value was very low most of the time. 


gender$Androgyne[is.na(gender$Androgyne)] <- 0
gender$Woman[is.na(gender$Woman)] <- 0

gender <- gender %>%
  mutate(r = Woman/10)%>%
  mutate(g = Androgyne/10)%>%
  mutate(b = 0)

gender <- gender%>%
  mutate(hexes = rgb(r,g,b))

gender <- gender %>%
  mutate(Index = 1:347)

#The animated gender plot that makes each point on the spectrum vanish after a few frames is generated here.
##this visualization is neat but not as visually powerful as the density plot IMO

gp <- ggplot(gender, aes(x=Androgyne, y=Woman)) + 
  geom_point(colour=gender$hexes, size=((10-gender$Agender_sum)/2))+
  xlim(c(0,10))+
  ylim(c(0,10))

gp

gpa <- gp +
  transition_time(Index)+
  shadow_mark(alpha = FALSE, size=5)+
  shadow_wake(wake_length = 2)+
  labs(title = 'Day: {frame_time}')

gpa
 
animate(gpa, renderer = gifski_renderer())
anim_save("gender_ani_2.gif")

## this second part of the script generates the static gender density plot

d <- structure(list(X = gender$Androgyne, Y = gender$Woman))
dens <- kde2d(d$X, d$Y)
filled.contour(dens, plot.title = title(main = "June's gender fluidity, density plot 4/8/23 - 15/7/24", 
                                        xlab = "Androgyne", ylab = "Woman")) 

filled.contour(dens, asp=1, color.palette = function(n) hcl.colors(n, "Oslo"), 
               plot.title = title(main = "June's gender fluidity, density plot 4/8/23 - 15/7/24", 
                                  xlab = "Androgyne", ylab = "Woman")) 