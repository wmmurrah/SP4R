#**************************************************************************
# Statistical Programming and Reproducible Research -----------------------
# Author: William Murrah
# Description: Script for introductory demonstration of R in RStudio for
#              statistical programming and reproducible research.
#
# Version history ---------------------------------------------------------
# Created: 11/20/2013
#**************************************************************************

# Before we begin, and introduction by a famous educator:
browseURL('http://www.youtube.com/watch?v=F1yPbaIcs30')
# 
# Let's take a tour of RStudio.
browseURL('http://www.rstudio.org')

# CRAN 
browseURL('http://cran.r-project.org/')

# R as a calculator -------------------------------------------------------

# basic math 
1 + 1 # run with PC/Linux: Ctrl + enter; Mac: Cmd + enter.
2 - 1
1 * 2
2^2

(1 + 2 + 3 + 4)/4

# assignment operators
x  <- 1:100

x2 = 1:200   # Don't use this!


# assignment shortcut in RStudio is alt + '-' (adds spaces too)
x <- 

# Vector and matrices --------------------------------------------

x <- c(1,2,3,4,5,6,7,8,9,10) # c stands for concatenate (or combine)
mat <- matrix(c(1,2,3,4,5,6,7,8,9,10),nrow=2)

# Data frames -------------------------------------------------------------

# manually enter data:
dat <- data.frame(x=c(1,4,6,4,7,8,4,7,5,3),
                  y=c(1:10),
                  pet.names=c("rover","max","bob","trooper","rosco",
                      "whiskers","snook","thor","zeus","diamond"))
# what data frames are "in" R?
data()
# open data "in" R
data(mtcars)

# explore data
summary(mtcars)
str(mtcars)

# import data from the web:
# Andrew Gelman's website
browseURL("http://www.stat.columbia.edu/~gelman/book/")

football <- read.table(file="http://www.stat.columbia.edu/~gelman/book/data/football.asc",
                       header=T,
                       skip=7)
summary(football)
str(football)
# our first package
# packages extent the functionality of Base R
install.packages('psych')
library('psych')
describe(football)

#### CRAN Task Views
browseURL("http://cran.r-project.org/web/views/")

# Basic R graphcis --------------------------------------------------------

x <- 1:100

y <- x^2

plot(x, y)


plot(mtcars$mpg, mtcars$disp)
library(ggplot2)
qplot(mpg,disp, data=mtcars)
plot(mtcars$mpg,mtcars$disp,pch=20)

####*******************************************************************####

# R is an object-oriented functional language -----------------------------

# functions:
a <- 1:100
b <- sqrt(a)
plot(a,b)

x <- rnorm(n=100,mean=50,sd=8)
hist(x)
y <- rnorm(100,50,8)
hist(y)
plot(x,y)
y <- x + rnorm(100,0,8)
plot(x,y)


mod <- lm(y ~ x)
summary(mod)
plot(mod)

install.packages('texreg')
library(texreg)
screenreg(mod)

# Let's build our own function!
# Cumulative probability of coin toss -------------------------------------

N <- 500
x <- rbinom(n=N, 1, prob=0.50)
r <- cumsum(x)
n <- 1:N

cumprop <- r/n

plot(cumprop)

plot(cumprop, ylim=c(0.0, 1.0), pch=20)
abline(h=0.5)

# function.name <- function(argument1, argument2 = default){
#   write function here
# }


# Getting Help in R -------------------------------------------------------

#### CRAN (The Comprehensive R Archive Network)
browseURL("http://cran.r-project.org")

#### Rseek
browseURL("http://rseek.org/")

#### CRAN Task Views
browseURL("http://cran.r-project.org/web/views/")

#### R and RStudio Help functions

?lm

?lm.beta

??lm.beta

library(QuantPsyc)


#### Stack Overflow (Programming questions)

browseURL("http://stackoverflow.com/")

#### Crossvalidated (Statistical questions)

browseURL("http://stats.stackexchange.com/")

