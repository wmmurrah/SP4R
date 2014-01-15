#**************************************************************************
# Title:  R Tutorial: Data Exploration 1 ----------------------------------
# Author: William Murrah
# Description: This script contains examples of data exploration of the 
#              wings demogC1 data
# Version history ---------------------------------------------------------
# 01/14/2014: File created
#**************************************************************************
# R packages used ---------------------------------------------------------
library(Hmisc)
library(plyr)
# Demographics ------------------------------------------------------------

# This code creates an R object with the root address to the file to 
# be merged.
root <- paste("data/",
              sep="")
## Demo users: use this root
# root <- "../demoData/"
## Combines the root object with the 'demographics' data file to be used  
## in the 'read.spss' function 'file' argument.
demog.address <- paste(root,
                 "Dem_ParQuant_June2012_C1.sav",
                 sep="")
# go get the demographic file and read into R.
# rename variables to replace underscores with periods and convert 
# UPPERCASE letters to lowercase.
demogC1 <- spss.get(file=demog.address,charfactor=TRUE,
                    lowernames=TRUE,
                    use.value.labels = TRUE,
                      datevars=c("dott1", "ch.dob1","adlt.dob"))
demog.vars <- c(  
    "childid", "school.1", "fqrea.1", "cond.1", "recruit1", "prek", 
    "ht.rand1", "cohort", "dott1", "ch.dob1", "ch.age1", "grade.1", 
    "male", "relate.1", "momageyr", "adlt.age1", "ad.gendr", 
    "ad.pc", "pc.lngth",  "adlt.dob", "ad.ethbl", 
    "ad.ethna", "ad.ethwh", "ad.ethla", "ad.ethas", "ad.ethoth", 
    "birthlb", "birthoz", "moves", "ch.iep", 
    "chhm.tot", "adhm.tot", "momed.1", "pc.ed.1", 
    "cgemploy", "cpr.cons", "cpr.conm", "cpr.clos", 
    "cpr.clom", "dssa.sos", "dssa.dms", "dssa.rss", "dssa.sas", "dssa.sms", 
    "dssa.som", "dssa.dmm", "dssa.rsm", "dssa.sam", "dssa.smm", "dssa.tot", 
    "ssis.exs", "ssis.exm", "ssis.ins", "ssis.inm", "ssis.bus", "ssis.bum", 
    "ssis.hys", "ssis.hym",  "ch.dob.2",
    "cgemploy" # Note: this variable is one we may want to keep, but needs
              # to be simplified
    #"ad.othsp", 
    #"rela.oth", "pc.nowho", "pc.no0", "prek.sp", "chhm.sp", "adhm.sp",
    #"cgempsch", "cgemp0", "ehcsc0", "ehcsc1", "ehsc.0"
  )

# subset variables for demogC1
demogC1 <- demogC1[,((names(demogC1) %in% demog.vars))]

# create variable which is simply the label "demogC1"
demogC1$src <- rep("demogc1t1", nrow(demogC1))

# remove unwanted objects
rm(demog.address,demog.vars)

demoglabs <- label(demogC1)


# R intuitions ------------------------------------------------------------

# 


#####************************####
# univariate summaries/plots ####
#####************************####

# function: summary() ------------------------------------------------------
# summary is a generic function
# First, let's look at the variables we have in the date frame.
names(demogC1)
# Now, let's summarize some variables:
summary(demogC1$school.1)
summary(demogC1$ch.age1)
# Why the different output?
str(demogC1$school.1)
str(demogC1$ch.age1)


# function: table() -------------------------------------------------------

table(demogC1$school.1)
 # difference from summary() includes NA's
table(demogC1$prek
summary(demogC1$prek)  

#
# function: barplot() -----------------------------------------------------
# The barplot function is used to visualize factors.
barplot(table(demogC1$school.1))

barplot(table(demogC1$school),main="Elementary School", col="steelblue")
table(demogC1$school)
summary(demogC1$school.1)
summary(demogC1$male)
barplot(table(demogC1$male))
barplot(table(demogC1$momed.1))
summary(demogC1$momed.1)


# function: hist() --------------------------------------------------------

summary(demogC1$ch.age1)
hist(demogC1$ch.age1)
hist(demogC1$ch.age1, col="steelblue")
hist(demogC1$ch.age1, col="steelblue", breaks= 15)

# undersmoothing
hist(demogC1$ch.age1, col="steelblue", breaks= 5)

# oversmoothing
hist(demogC1$ch.age1, col="steelblue", breaks= 150)


hist(demogC1$ssis.exm, col="red", breaks=15)

hist(demogC1$ssis.exm, col="steelblue", 
     breaks=15,
     main="SSIS Externalizing Behavior",
     xlab="externalizing behavior mean score")


#####****************************####
##### Bivariate summaries/plots  ####
#####****************************####
# function: cor() ---------------------------------------------------------
cor(demogC1$ch.age1, demogC1$ssis.exm, use='pairwise.complete.obs')
cor(demogC1$ssis.inm, demogC1$ssis.exm, use='pairwise.complete.obs')

# function: plot() --------------------------------------------------------
# plot is a generic function

# some univariate plots first
plot(demogC1$male)
plot(demogC1$ch.age1)

# scatterplot
plot(demogC1$ssis.exm, demogC1$ssis.inm)


# boxplots
plot(demogC1$school.1, demogC1$ssis.exm)

boxplot(demogC1$ssis.exm ~ demogC1$school.1)


# lattice and psych functions -------------------------------------------------------


library(lattice)
histogram(~ssis.exm |male,data=df)

densityplot(~ssis.exm |male,data=df)


ssis <- df[ ,c(52,54,56,58)]
pairs.panels(ssis)
