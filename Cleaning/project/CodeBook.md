### CodeBook.md

This code book that describes the variables, the data, and any transformations or work that performed to clean up the data contained in the the dataset linked to below (in the **DATA** section) which represents data collected from the accelerometers from the Samsung Galaxy S smartphone.  The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

# DATA
The zip file for the data is:

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The original description of the data can be found at:

* <http://web.archive.org/web/20140803224107/http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>


# TRANSFORMATIONS
The steps in transforming the data are outlined as follows:

1. Merges the training and the test sets to create one data set.  The merged data set is called **tidy_data** in the **run_analysis.R** script file.

2. Extracts only the measurements on the mean and standard deviation for each measurement. The new name of the merged dataset with the mean and standard deviation info is **tidy_data_mean_std** in the **run_analysis.R** script file.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set named **sensorAggregatesMean.txt** with the average of each variable for each activity and each subject.  This .txt file can be found in the repo.

# VARIABLES
The descriptive activity names (from step **3** under **TRANSFORMATIONS**) come from the **ActivityID** column in the **tidy_data_mean_std**.  The names are 

* STANDING
* SITTING
* LAYING 
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

The variable names (from step **4** under **TRANSFORMATIONS**) were changed using the gsub() function with regular expressions to remove parentheses and dashes.  The variable names use lowerCamelCase with a mix of underscores.  For example, each variable name begins with either a "t" for time domain, or "f" for frequency domain.  The next part of the variable name represents which inertial sensor the data is taken from, for example "BodyAcc" describes the "Body Acceleration" sensor.  The sensor name is is then seperated from the names Mean or Standard Deviation and X, Y, or Z coordinate by underscores.  The names "Mean" and "Std" speak for themselves, whereas the coordinates X, Y, or Z, represent the respective 3-D coordinates of the inertial sensors.  The variable names in the final cleaned up dataset **sensorAggregatesMean.txt** are the following:

* SubjectID		-- a unique identifier for each subject that participated in the data measurements
* ActivityID		-- a unique name for each activity involved (see first list under **VARIABLES**)
* tBodyAcc_Mean_[XYZ] 	-- mean body acceleration, time domain
* tBodyAcc_Std_[XYZ] 	-- standard deviation of body acceleration, time domain
* tGravityAcc_Mean_[XYZ] 	-- mean gravitational acceleration, time domain
* tGravityAcc_Std_[XYZ] 		-- standard deviation of gravitational acceleration, time domain
* tBodyAccJerk_Mean_[XYZ] 	-- mean body jerk, time domain
* tBodyAccJerk_Std_[XYZ] 	-- standard deviation of body jerk, time domain
* tBodyGyro_Mean_[XYZ] 		-- mean body angular speed, time domain
* tBodyGyro_Std_[XYZ] 		-- standard deviation of body angular speed, time domain
* tBodyGyroJerk_Mean_[XYZ] 		-- mean body angular jerk, time domain
* tBodyGyroJerk_Std_[XYZ] 		-- standard deviation of body angular jerk, time domain
* tBodyAccMag_Mean 		-- 
* tBodyAccMag_Std
* tGravityAccMag_Mean
* tGravityAccMag_Std
* tBodyAccJerkMag_Mean
* tBodyAccJerkMag_Std
* tBodyGyroMag_Mean
* tBodyGyroMag_Std
* tBodyGyroJerkMag_Mean
* tBodyGyroJerkMag_Std
* fBodyAcc_Mean_[XYZ]
* fBodyAcc_Std_[XYZ]
* fBodyAcc_MeanFreq_[XYZ]
* fBodyAccJerk_Mean_[XYZ]
* fBodyAccJerk_Std_[XYZ]
* fBodyAccJerk_MeanFreq_[XYZ]
* fBodyGyro_Mean_[XYZ]
* fBodyGyro_Std_[XYZ]
* fBodyGyro_MeanFreq_[XYZ]
* fBodyAccMag_Mean
* fBodyAccMag_Std
* fBodyAccMag_MeanFreq
* fBodyBodyAccJerkMag_Mean
* fBodyBodyAccJerkMag_Std
* fBodyBodyAccJerkMag_MeanFreq
* fBodyBodyGyroMag_Mean
* fBodyBodyGyroMag_Std
* fBodyBodyGyroMag_MeanFreq
* fBodyBodyGyroJerkMag_Mean
* fBodyBodyGyroJerkMag_Std
* fBodyBodyGyroJerkMag_MeanFreq

There are 79 variable names in this Mean and Standard Deviation data set.
