# The working directory is set in the 'project' directory which contains
# the subdirectory 'data' which contains the data set we need to tidy up.
setwd('~/Coursera/Cleaning/project')

## first things first: we want to merge the train and test data sets into
## one data set.

# defining filenames to be passed into read.table functions
data_dir <- "data/UCI\ HAR\ Dataset"
train_dir <- paste(data_dir, "/train", sep = "")
test_dir <- paste(data_dir, "/test", sep = "")
X_tr_filename <- paste(train_dir, "/X_train.txt", sep = "")
y_tr_filename <- paste(train_dir, "/y_train.txt", sep = "")
sub_tr_filename <- paste(train_dir, "/subject_train.txt", sep = "")
X_ts_filename <- paste(test_dir, "/X_test.txt", sep = "")
y_ts_filename <- paste(test_dir, "/y_test.txt", sep = "")
sub_ts_filename <- paste(test_dir, "/subject_test.txt", sep = "")

# reading in the data
X_train <- read.table(X_tr_filename, sep="", header=FALSE)
y_train <- read.table(y_tr_filename, sep="", header=FALSE)
subject_train <- read.table(sub_tr_filename, sep="", header=FALSE)
X_test <- read.table(X_ts_filename, sep="", header=FALSE)
y_test <- read.table(y_ts_filename, sep="", header=FALSE)
subject_test <- read.table(sub_ts_filename, sep="", header=FALSE)

