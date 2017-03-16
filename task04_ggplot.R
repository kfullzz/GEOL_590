<<<<<<< HEAD
#count rows in diamonds
nrow(diamonds)

#single random integer argument
set.seed(1410)
#define a variable that is a subset of diamonds
#takes a random sample of 100 rows of diamonds
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

#create scatterplot of y vs x, colored by z values and faceted by cut
dsmall_1 <- ggplot(dsmall, aes(x, y, color=z)) + 
  geom_point() + 
  facet_wrap(~cut)
print(dsmall_1)

#A scatterplot of price vs carat, colored by cut and smoothed (using the "lm" method, without standard error bars)
dsmall_2 <- ggplot(dsmall, aes(x=carat, y=price, color = cut)) +
  geom_point() +
  geom_smooth(method=lm, se = FALSE)
#se=standard deviation, but setting it to false it doesn't include it in the graph
dsmall_2

#A density plot of carat, faceted and colored by clarity
dsmall_3 <- ggplot(dsmall, aes(x=carat, color=clarity)) +
  geom_density() +
  facet_wrap(~clarity)
dsmall_3

#A boxplot of price as a function of cut
dsmall_4 <- ggplot(dsmall, aes(x=cut, y=price))+
  geom_boxplot()
dsmall_4

#scatterplot of y vs x
#points should be red
#smoothing line should be blue + dashed w/ fat dashes
#manually assign x and y axis labels
dsmall_5 <- ggplot(dsmall, aes(x, y)) +
  geom_point(color="red") +
  xlab("x, in mm") +
  ylab("y, in mm") +
  geom_smooth(method = lm, se=FALSE, linetype=2, color="blue")
dsmall_5

install.packages("png")
library("png")

image <- readPNG("bg_ugly.png")

#make a graph showing relationship between day of the month and ozone
airquality
str(airquality)
bad_graph <- ggplot(airquality, aes(x=Day, y=Ozone)) +
  annotation_custom(rasterGrob(image, width=unit(1,"npc"), height=unit(1,"npc")), -Inf, Inf, -Inf, Inf) +
  geom_point(color = "white", size=0.5) +
  geom_smooth(color= "white", se=FALSE, linetype =2, size = 0.5) +
 
bad_graph

=======
#count rows in diamonds
nrow(diamonds)

#single random integer argument
set.seed(1410)
#define a variable that is a subset of diamonds
#takes a random sample of 100 rows of diamonds
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

#create scatterplot of y vs x, colored by z values and faceted by cut
dsmall_1 <- ggplot(dsmall, aes(x, y, color=z)) + 
  geom_point() + 
  facet_wrap(~cut)
print(dsmall_1)

#A scatterplot of price vs carat, colored by cut and smoothed (using the "lm" method, without standard error bars)
dsmall_2 <- ggplot(dsmall, aes(x=carat, y=price, color = cut)) +
  geom_point() +
  geom_smooth(method=lm, se = FALSE)
#se=standard deviation, but setting it to false it doesn't include it in the graph
dsmall_2

#A density plot of carat, faceted and colored by clarity
dsmall_3 <- ggplot(dsmall, aes(x=carat, color=clarity)) +
  geom_density() +
  facet_wrap(~clarity)
dsmall_3

#A boxplot of price as a function of cut
dsmall_4 <- ggplot(dsmall, aes(x=cut, y=price))+
  geom_boxplot()
dsmall_4

#scatterplot of y vs x
#points should be red
#smoothing line should be blue + dashed w/ fat dashes
#manually assign x and y axis labels
dsmall_5 <- ggplot(dsmall, aes(x, y)) +
  geom_point(color="red") +
  xlab("x, in mm") +
  ylab("y, in mm") +
  geom_smooth(method = lm, se=FALSE, linetype=2, color="blue")
dsmall_5

install.packages("png")
library("png")

image <- readPNG("bg_ugly.png")

#make a graph showing relationship between day of the month and ozone
airquality
str(airquality)
bad_graph <- ggplot(airquality, aes(x=Day, y=Ozone)) +
  annotation_custom(rasterGrob(image, width=unit(1,"npc"), height=unit(1,"npc")), -Inf, Inf, -Inf, Inf) +
  geom_point(color = "white", size=0.5) +
  geom_smooth(color= "white", se=FALSE, linetype =2, size = 0.5) +
 
bad_graph

>>>>>>> 6ea7fd9375b1564d0a17455663fcf735d7e349bf
