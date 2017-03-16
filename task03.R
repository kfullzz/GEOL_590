a <- 1
b <- 2
c <- a + b

set.seed(0)
d <- rnorm(20)
e <- rnorm(20)
f <- d + e

g <- c(1:5)
length(g)
#change 2 attributes
names(g) <- c("a", "b", "c", "d", "e")
attr(g, "Units") <- "Smiles"

h <- read.csv("2016_10_11_plate_reader.csv", skip=33)
print(h)
str(h)

library(tidyverse)
i <- read_csv("2016_10_11_plate_reader.csv", skip=33)
print(i)

nrow(mtcars)
length(mtcars)
ncol(mtcars)
