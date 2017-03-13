If the columns to add aren't valid but the new column name is, the
function should create a column of NA values

    #Establish environment and load relevant packages
    setwd("C:/Katie/University_of_Tennessee/GEOL_590/R")
    library(tidyverse)

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

    library(ggplot2)

    #create a function called col_add
    #df = data frame to be used, x and y are the columns, name is the new name of the column
    col_add <- function(df, x, y, name) {
    #add warning if input is not dataframe and stop function
      if (class(df) != "dataframe")
        stop("Fatal Error: You need a data frame dummy")
      
    #add warning if columns are not numeric
      if (x != "numeric" | y != "numeric")
        warning("The columns specified are not numeric")
      
    #add tryCatch to function  
      tryCatch(
        df %>%
    #generate a new column "name" that is the sum of the specificed columns "x and y"
        mutate(name, sum(x, y)),
        warning=function(w){
          message("Some of the specified values are non-numeric")
          return(NA)
        }
      
      )
      
      

      #try to add command that would add NA to new column
    }

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
    ##              expr      min       lq       mean   median        uq
    ##  my_sum(test.vec) 3375.969 3486.896 4191.69273 3699.473 3978.5675
    ##     sum(test.vec)    6.316    6.317    7.89598    7.106    8.6855
    ##        max neval
    ##  39841.323   100
    ##     18.949   100

Is there a difference? Why?
