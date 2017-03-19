Functioning Function w/ Pipes:

    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    col_add <- function(df, x, y, name) {
        mutate_call = lazyeval::interp(~ a + b, a = as.name(x), b = as.name(y))
        df %>%
          mutate_(.dots = setNames(list(mutate_call), name))
    }

    test_data <- read.csv("test_data.csv")

    col_add(test_data, "Apples", "Oranges", "Fruit")

    ##    Set Apples Oranges Fruit
    ## 1    a      1       5     6
    ## 2    b      2       2     4
    ## 3    c      3       9    12
    ## 4    d      1       3     4
    ## 5    e      2       8    10
    ## 6    f      3       2     5
    ## 7    g      1       2     3
    ## 8    h      2       9    11
    ## 9    i      3       0     3
    ## 10   j      1       2     3
    ## 11   k      2       5     7
    ## 12   l      3      NA    NA
    ## 13   m     NA       9    NA
    ## 14   n      1       4     5
    ## 15   o      2       2     4
    ## 16   p      3       8    11
    ## 17   q      1       9    10
    ## 18   r      3       4     7
    ## 19 Set      5       2     7
    ## 20   t      4       5     9
    ## 21   u     84      78   162
    ## 22   v      8       9    17
    ## 23   w      5       2     7
    ## 24   x     84       8    92
    ## 25   y      5       2     7
    ## 26   z     94       4    98

Attempt to add TryCatch

    col_add <- function(df, x, y, name) {
        tryCatch(
          {  
          mutate_call = lazyeval::interp(~ a + b, a = as.name(x), b = as.name(y))
          df <- df %>%
            mutate_(.dots = setNames(list(mutate_call), name))
          warning=function(w){
            warning("Some of the specified values are non-numeric")
            return(NA)
            }
          }
        )
      return(df)
    }

    test_data <- read.csv("test_data.csv")

    col_add(test_data, "Apples", "Oranges", "Fruit")

    ##    Set Apples Oranges Fruit
    ## 1    a      1       5     6
    ## 2    b      2       2     4
    ## 3    c      3       9    12
    ## 4    d      1       3     4
    ## 5    e      2       8    10
    ## 6    f      3       2     5
    ## 7    g      1       2     3
    ## 8    h      2       9    11
    ## 9    i      3       0     3
    ## 10   j      1       2     3
    ## 11   k      2       5     7
    ## 12   l      3      NA    NA
    ## 13   m     NA       9    NA
    ## 14   n      1       4     5
    ## 15   o      2       2     4
    ## 16   p      3       8    11
    ## 17   q      1       9    10
    ## 18   r      3       4     7
    ## 19 Set      5       2     7
    ## 20   t      4       5     9
    ## 21   u     84      78   162
    ## 22   v      8       9    17
    ## 23   w      5       2     7
    ## 24   x     84       8    92
    ## 25   y      5       2     7
    ## 26   z     94       4    98

Atempt to add additional error messages

    #Establish environment and load relevant packages
    setwd("C:/Katie/University_of_Tennessee/GEOL_590/R")
    library(tidyverse)

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

    library(ggplot2)
    library(lazyeval)

    ## Warning: package 'lazyeval' was built under R version 3.3.3

    ## 
    ## Attaching package: 'lazyeval'

    ## The following objects are masked from 'package:purrr':
    ## 
    ##     is_atomic, is_formula

    #create a function called col_add
    #df = data frame to be used, x and y are the columns, name is the new name of the column
    col_add <- function(df, x, y, name) {
    #add warning if input is not dataframe and stop function
      if (class(df) != "data.frame") {
       stop("Fatal Error: You need a data frame dummy")
      }
      #add warning if columns are not numeric; ie column of letters
      if (is.numeric(df$x) == FALSE | is.numeric(df$x) == FALSE) {
       warning("The columns specified are not numeric")
      }
      
    #add tryCatch to function  
      tryCatch(
          {  
          mutate_call = lazyeval::interp(~ a + b, a = as.name(x), b = as.name(y))
          df <- df %>%
            mutate_(.dots = setNames(list(mutate_call), name))
          warning=function(w){
            message("Some of the specified values are non-numeric")
            return(NA)
            }
          }
        )
      return(df)
        }

    test_data <- read.csv("test_data.csv")
    str(test_data)

    ## 'data.frame':    26 obs. of  3 variables:
    ##  $ Set    : Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Apples : int  1 2 3 1 2 3 1 2 3 1 ...
    ##  $ Oranges: int  5 2 9 3 8 2 2 9 0 2 ...

    col_add(test_data, "Set", "Oranges", "Fruit")

    ## Warning in col_add(test_data, "Set", "Oranges", "Fruit"): The columns
    ## specified are not numeric

    ## Warning in Ops.factor(structure(1:26, .Label = c("a", "b", "c", "d", "e", :
    ## '+' not meaningful for factors

    ##    Set Apples Oranges Fruit
    ## 1    a      1       5    NA
    ## 2    b      2       2    NA
    ## 3    c      3       9    NA
    ## 4    d      1       3    NA
    ## 5    e      2       8    NA
    ## 6    f      3       2    NA
    ## 7    g      1       2    NA
    ## 8    h      2       9    NA
    ## 9    i      3       0    NA
    ## 10   j      1       2    NA
    ## 11   k      2       5    NA
    ## 12   l      3      NA    NA
    ## 13   m     NA       9    NA
    ## 14   n      1       4    NA
    ## 15   o      2       2    NA
    ## 16   p      3       8    NA
    ## 17   q      1       9    NA
    ## 18   r      3       4    NA
    ## 19 Set      5       2    NA
    ## 20   t      4       5    NA
    ## 21   u     84      78    NA
    ## 22   v      8       9    NA
    ## 23   w      5       2    NA
    ## 24   x     84       8    NA
    ## 25   y      5       2    NA
    ## 26   z     94       4    NA

Write a function named that uses a for loop to calculate the sum of the
elements of a vector, which is passed as an argument (i.e., it should do
the same thing that sum() does with vectors). your\_fun(1:10^4) should
return 50005000.

    library(microbenchmark)

    ## Warning: package 'microbenchmark' was built under R version 3.3.3

    test.vec <- 1:10^4
    #need to tell the function to add each value to its neighbor
    my_sum <- function(x) {
      y <- 0
      for (i in x) {
      #redefine y with each loop, adding the next number (i) to it
        y <- y + i
      }
      return(y)
    }
    my_sum(test.vec)

    ## [1] 50005000

    print(microbenchmark(
      my_sum(test.vec), 
      sum(test.vec)
    ))

    ## Unit: microseconds
    ##              expr      min       lq       mean   median        uq      max
    ##  my_sum(test.vec) 3341.228 3569.200 3934.07069 3692.167 4131.3345 5956.891
    ##     sum(test.vec)    6.316    6.712    9.17888    7.699   10.6595   21.317
    ##  neval
    ##    100
    ##    100

Is there a difference? Why?
