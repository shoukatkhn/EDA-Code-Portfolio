# This is a practice for creating Matrices, Dataframes and Vectors in R
# Matrices and Dataframes in R
# Matrices and Dataframes are very similar to spreadsheets in excel and allow us to store more amount of data in row and column format

# cbind and rbind both create matrices by combining several vectors
a <- 1:5
b <- 6:10
c <- 11:15

# create a matrix where a,b and c are columns
cbind(a,b,c)

# create a matrix where a,b and c are c rows
rbind(a,b,c)

# We can also create matrix using cbind for numeric and characters, note both numerics and characters cannot be in same column
cbind(c("a","b","c", "d", "e"), a)

# Above a is vector containing numericals from 1 to 5

# To create a matrix from single vector of data, nrow and ncol are functions
matrix(data = 1:10, nrow = 5, ncol = 2)

# To fill the column byrow use the same name function and set the flag to true
matrix(data = 1:10, nrow = 2, ncol = 5, byrow = TRUE)

# We can create dataframe from vectors using data.frame
survey <- data.frame("studentId"=c(1,2,3),
                     "sex"=c("f","m","f"),
                     "age"=c(5,6,5))
survey

# To create a dataframe without characters being factorised set the flag stringAsFactors as false
surveyWOFactors <- data.frame("studentId"=c(1,2,3),
                              "sex"=c("f","m","f"),
                              "age"=c(5,6,5),
                              stringsAsFactors = FALSE)
surveyWOFactors

# There are four dataframe are preloaded in R
# ChickWeight, InsectSprays, ToothGrowth, PlantGrowth for practice

# dataframe also provide more functionality such as slicing(using [<row>,<column>], logical vectors and subset),
# adding and renaming columns

# Vectors
# prerequisities for vectors is use to tidyverse library
library(tidyverse)

# To get the type of variables we are using
typeof(letters)
typeof(1:5)

# To determine the length of a list
x <- list("a","b", 1:10)
length(x)

# logical operators in vectors
1:12 %% 2 == 0

c(TRUE, FALSE, TRUE, FALSE, NA)

# to check the memory used by vector
library(pryr)
a <- "Last week bbq for 4th of july was amazing"
pryr::object_size(a)

b <- rep(a, 1000)
pryr::object_size(b)

# List (recursive vectors) in R
# To create a list

list("a","b","c")
list(1,3,2)

# Structure of List 
str(list("a", 1L, 1.5, TRUE))

# List within a list
ll <- list(list(1,2), list(3,4))
str(ll)

# Attributes for vectors
# Any vector can contain arbitary additional metadata through its attributes

x <- 1:3
attr(x, "greeting")
attr(x, "greeting") <- "Hi"
attr(x, "afgreeting") <- "hello"
attributes(x)

# Augmented Vectors
# Factors
x <- factor(c("ab","cd","ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)

# Factors will be very helpful when using anova or linear regression model on categorical variables
