## Hospital quality exploration

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

outcome[,11] <- as.numeric(outcome[,11])
## You may get a warning about NAs being introduces; that is okay
hist(outcome[,11])