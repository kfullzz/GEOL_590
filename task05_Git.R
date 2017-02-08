x <- runif(10)
y <- runif(10)
data <- merge(x, y)

library(ggplot2)

random <- ggplot(data, aes(x=x, y=y)) +
  geom_point()
random
