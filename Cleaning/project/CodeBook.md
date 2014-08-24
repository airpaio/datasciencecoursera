### CodeBook.md

The code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

# DATA
The zip file for the data is

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A description of the data can be found 

* <http://web.archive.org/web/20140803224107/http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


# Transformations and VARIABLES
The steps in transforming the data are outlined as follows:

1. Merges the training and the test sets to create one data set.  The merged data set is called tidy_data in the run_analysis.R script file.

2. Extracts only the measurements on the mean and standard deviation for each measurement. The new name of the merged dataset with the mean and standard deviation info is tidy_data_mean_std in the run_analysis.R script file.

3. Uses descriptive activity names to name the activities in the data set.  The descriptive activity names come from the ActivityID column in the tidy_data_mean_std.  The names are 
* STANDING
* SITTING
* LAYING 
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

4. Appropriately labels the data set with descriptive variable names. The variable names were changed using the gsub() function with regular expressions to remove parentheses and dashes.  The variable names use lowerCamelCase with a mix of underscores.  For example, each variable name begins with either a "t" for time domain, or "f" for frequency domain.  The next part of the variable name, for example "BodyAcc" describes "Body Acceleration" which is then seperated from the Mean or Standard Deviation and X, Y, or Z coordinate by "_Mean_X".  A few examples of variable names are
* tGravityAcc_Std_Y
* tGravityAcc_Std_Z
* tBodyAccJerk_Mean_X
* fBodyAccMag_Std
* fBodyAccMag_MeanFreq
* fBodyBodyAccJerkMag_Mean
There are 79 variable names in this Mean and Standard Deviation data set.


5. Creates a second, independent tidy data set named sensorAggregatesMean.txt with the average of each variable for each activity and each subject.  This .txt file can be found in the repo.
