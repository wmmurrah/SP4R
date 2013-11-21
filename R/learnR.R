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
1 + 1
2 - 1
1 * 2
2^2

(1 + 2 + 3 + 4)/4

# Basic R graphcis --------------------------------------------------------

x <- 1:100

y <- x^2

plot(x, y)

data(mtcars)
str(mtcars)
plot(mtcars$mpg, mtcars$disp)
library(ggplot2)
qplot(mpg,disp, data=mtcars)
plot(mtcars$mpg,mtcars$disp,pch=20)

####*******************************************************************####

# R is an object-oriented functional language -----------------------------


# assignment operator
x  <- 1:100
1:50 -> y
# assignment shortcut in RStudio is alt + '-'

# functions:
y   <- sqrt(x)
plot(x,y)
cor.xy <- cor(x,y)
cor.xy

mod <- lm(y ~ x)
summary(mod)

library(texreg)
screenreg(mod)

# Let's build our own function!
# Cumulative probability of coin toss -------------------------------------

N <- 500
x <- rbinom(n=N, 1, prob=0.50)
r <- cumsum(x)
n <- 1:N

cumprob <- r/n

plot(cumprob)

plot(cumprob, ylim=c(0.0, 1.0),type="b", pch=20)
abline(h=0.5)


N <- 500
p=0.50
x <- rbinom(n=N,1,prob=p)
r <- cumsum(x)
n <- 1:N

cumprob <- r/n

plot(cumprob,ylim=c(0.0, 1.0),type="l",
     main="Cumulative proportion heads",
     xlab="coin toss number",
     ylab="cumulative proportion")
abline(h=0.5,col="red")

head(cumprob,25)
tail(cumprob,25)



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

