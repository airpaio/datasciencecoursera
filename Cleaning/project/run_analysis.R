# The working directory is set in the 'project' directory which contains
# the subdirectory 'data' which contains the data set we need to tidy up.
setwd('~/Coursera/Cleaning/project')

## first things first: we want to merge the train and test data sets into
## one data set.

# read in the training data
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt",
                    sep="", header=FALSE)
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt",
                    sep="", header=FALSE)
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt",
                          sep="", header=FALSE)

# read in the testing data
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt",
                     sep="", header=FALSE)
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt",
                    sep="", header=FALSE)
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt",
                          sep="", header=FALSE)