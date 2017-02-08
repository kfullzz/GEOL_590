a <- 1
b <- 2
c <- a + b

set.seed(0)
d <- rnorm(20)
e <- rnorm(20)
f <- d + e

#define vector of length 5
g <- c(1:5)
length(g)
#change 2 attributes
names(g) <- c("a", "b", "c", "d", "e")
attr(g, "Units") <- "Smiles"

h <- read.csv("2016_10_11_plate_reader.csv", skip=33)
print(h)
str(h)

library(tidyverse)
#prints 32
nrow(mtcars)
#print 11
length(mtcars)
#prints 11
ncol(mtcars)

#two ways to subset
cyl_dollar <- mtcars$cyl
cyl_sub <- mtcars[, c("cyl")]

#Selects weights less than 3 and greater than 4
mtcars_wt <- mtcars[mtcars$wt <3.0 | mtcars$wt >4.0,]
#all rows but only mpg and wt columns
mtcars_rows <- mtcars[, c("mpg", "wt")]
#make mpg only vector
mtcars_mpg <- mtcars$mpg
#find median mpg
mtcars_mpg_med <- median(mtcars_mpg)
#cars with same mpg as med
mtcars[mtcars$mpg == mtcars_mpg_med,]

#3.1.7.1 first
#need to have a ==
mtcars[mtcars$cyl == 4, ]
#3.1.7.1 second
#removed negative sign and added c() call
mtcars[1:4, ]
#3.1.7.1 third
#add comma after value
mtcars[mtcars$cyl <=5, ]
#3.1.7.1 fourth
#added secton mycars$cyl == call
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6,]

