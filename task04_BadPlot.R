install.packages("png")
library("png")
library("ggplot2")

image <- readPNG("bg_ugly.png")

#make a graph showing relationship between day of the month and ozone
airquality
str(airquality)
bad_graph <- ggplot(airquality, aes(x=Day, y=Ozone)) +
  annotation_custom(rasterGrob(image, width=unit(1,"npc"), height=unit(1,"npc")), -Inf, Inf, -Inf, Inf) +
  geom_point(color = "white", size=0.5) +
  geom_smooth(color= "white", se=FALSE, linetype =2, size = 0.5)
  
bad_graph
