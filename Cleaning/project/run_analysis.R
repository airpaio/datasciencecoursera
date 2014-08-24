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
features_filename <- paste(data_dir, "/features.txt", sep = "")
activity_labels_filename <- paste(data_dir, "/activity_labels.txt", sep = "")

# reading in the data
X_train <- read.table(X_tr_filename, sep = "", header=FALSE)
y_train <- read.table(y_tr_filename, sep = "", header=FALSE)
subject_train <- read.table(sub_tr_filename, sep = "", header=FALSE)
X_test <- read.table(X_ts_filename, sep = "", header=FALSE)
y_test <- read.table(y_ts_filename, sep = "", header=FALSE)
subject_test <- read.table(sub_ts_filename, sep = "", header=FALSE)
features <- read.table(features_filename, sep = "", header=FALSE, 
                       stringsAsFactors=FALSE)
activity_labels <- read.table(activity_labels_filename, sep = "", header=FALSE)



## Now lets merge some stuff together using cbind or rbind

# NOTE:
# dim(X_train) = 7352 561
# dim(y_train) = 7351 1
# dim(subject_train) = 7351 1
# dim(X_test) = 2947 561
# dim(y_test) = 2947 1
# dim(subject_test) = 2947 1
# dim(features) = 561 2
# dim(activity_labels) = 6 2

# we should bind these together by columns (cbind), first by subject, then
# by labels (y_) then by the data (X_)

training <- cbind(subject_train, y_train, X_train)
testing <- cbind(subject_test, y_test, X_test)
tidy_data <- rbind(training, testing)
names(tidy_data) <- c( 'SubjectID', 'ActivityID', features$V2)

# get the indices of the mean and std columns
index_mean_std <- grep("mean|std", features$V2)

# get the mean and std columns of the features data
features_mean_std <- features[index_mean_std,]

subjects <- rbind(subject_train, subject_test)
ActivityIDs <- rbind(y_train, y_test)
tidy_data_mean_std <- cbind(subjects, ActivityIDs, 
                            tidy_data[,features_mean_std$V2])
names(tidy_data_mean_std) <- c( 'SubjectID', 'ActivityID', features_mean_std$V2)


# replacing Activity ID numbers with word labels
activityID = 1
for (label in activity_labels$V2) {
    tidy_data_mean_std[,2] <- gsub(activityID, 
                                          label, 
                                          tidy_data_mean_std[,2])
    activityID <- activityID + 1
}


# Now rename variables to look nice and clean with good names
# regex [()-] deletes () and -
names(tidy_data_mean_std) <- gsub('[()-]', '', names(tidy_data_mean_std))
names(tidy_data_mean_std) <- gsub('mean', '_Mean', names(tidy_data_mean_std))
names(tidy_data_mean_std) <- gsub('std', '_Std', names(tidy_data_mean_std))
names(tidy_data_mean_std) <- gsub('X', '_X', names(tidy_data_mean_std))
names(tidy_data_mean_std) <- gsub('Y', '_Y', names(tidy_data_mean_std))
names(tidy_data_mean_std) <- gsub('Z', '_Z', names(tidy_data_mean_std))


# write another dataset with averages for each variable, activity, and subject
clean2 <- aggregate(tidy_data_mean_std[,3:ncol(tidy_data_mean_std)], 
                   by = list(Subject = tidy_data_mean_std[,1],
                             Activity = tidy_data_mean_std[,2]), mean)

write.table(clean2, file="sensorAggregatesMean.txt", sep="\t", row.names=FALSE)


