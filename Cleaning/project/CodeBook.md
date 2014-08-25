### CodeBook.md

This code book that describes the variables, the data, and any transformations or work that performed to clean up the data contained in the the dataset linked to below (in the **DATA** section) which represents data collected from the accelerometers from the Samsung Galaxy S smartphone.  The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

# DATA
The zip file for the data is:

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The original description of the data can be found at:

* <http://web.archive.org/web/20140803224107/http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

When the file linked to above is unzipped in the directory you wish to work in, the entire data set is contained in a directory named **UCI HAR Dataset**.  The directory structure is as follows:

<pre>.
+-- README.txt
+-- activity_labels.txt
+-- features.txt
+-- features_info.txt
+-- sensorAggregation.txt 	**NOTE: not included in original dataset - result of cleaning data**
+-- train
|   +-- Inertial Signals
|		+-- body_acc_x_train.txt
|		+-- body_acc_y_train.txt
|		+-- body_acc_z_train.txt
|		+-- body_gyro_x_train.txt
|		+-- body_gyro_y_train.txt
|		+-- body_gyro_z_train.txt
|		+-- total_acc_x_train.txt
|		+-- total_acc_y_train.txt
|		+-- total_acc_z_train.txt
|   +-- subject_train.txt
|	+-- X_train.txt
|	+-- y_train.txt
+-- test
|   +-- Inertial Signals
|		+-- body_acc_x_train.txt
|		+-- body_acc_y_train.txt
|		+-- body_acc_z_train.txt
|		+-- body_gyro_x_train.txt
|		+-- body_gyro_y_train.txt
|		+-- body_gyro_z_train.txt
|		+-- total_acc_x_train.txt
|		+-- total_acc_y_train.txt
|		+-- total_acc_z_train.txt
|   +-- subject_train.txt
|	+-- X_train.txt
|	+-- y_train.txt
</pre>

The files used during the cleaning of the dataset were:

* activity_labels.txt
* features.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* subject_test.txt
* X_test.txt
* y_test.txt


# TRANSFORMATIONS
The steps in transforming the data are outlined as follows:

1. Merges the training and the test sets to create one data set.  The merged data set is called **tidy_data** in the **run_analysis.R** script file.  Merging the **tidy_data** included merging data from the following files: **subject_train.txt**, **X_train.txt**, **y_train.txt**, **subject_test.txt**, **X_test.txt**, **y_test.txt**.

2. Extracts only the measurements on the mean and standard deviation for each measurement. The new name of the merged dataset with the mean and standard deviation info is **tidy_data_mean_std** in the **run_analysis.R** script file.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set named **sensorAggregatesMean.txt** with the average of each variable for each activity and each subject.  This .txt file can be found in the repo.

# VARIABLES
The descriptive activity names (from step **3** under **TRANSFORMATIONS**, **activity_labels.txt**) come from the **ActivityID** column in the **tidy_data_mean_std**.  The names are 

* STANDING
* SITTING
* LAYING 
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

The variable names (from step **4** under **TRANSFORMATIONS**) were changed using the gsub() function with regular expressions to remove parentheses and dashes.  The variable names use lowerCamelCase with a mix of underscores.  For example, each variable name begins with either a "t" for time domain, or "f" for frequency domain.  The next part of the variable name represents which inertial sensor the data is taken from, for example "BodyAcc" describes the "Body Acceleration" sensor.  The sensor name is is then seperated from the names Mean or Standard Deviation and X, Y, or Z coordinate by underscores.  The names "Mean" and "Std" speak for themselves, whereas the coordinates X, Y, or Z, represent the respective 3-D coordinates of the inertial sensors.  The variable names (a subset of **features.txt**) in the final cleaned up dataset **sensorAggregatesMean.txt** are the following:

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
* tBodyAccMag_Mean 		-- mean magnitude of body acceleration, time domain
* tBodyAccMag_Std 	-- standard deviation of magnitude of body acceleration, time domain
* tGravityAccMag_Mean 		-- mean magnitude of gravitational acceleration, time domain
* tGravityAccMag_Std 	-- standard deviation of gravitational acceleration, time domain
* tBodyAccJerkMag_Mean 		-- mean magnitude of body jerk, time domain
* tBodyAccJerkMag_Std 		-- standard deviation of magnitude of body jerk, time domain
* tBodyGyroMag_Mean 		-- mean magnitude of body angular speed, time domain
* tBodyGyroMag_Std 		-- standard deviation of magnitude of body angular speed, time domain
* tBodyGyroJerkMag_Mean 		-- mean magnitude of body angular jerk, time domain
* tBodyGyroJerkMag_Std 		-- standard deviation of magnitude of body anfular jerk, time domain
* fBodyAcc_Mean_[XYZ] 		-- mean body acceleration, frequency domain
* fBodyAcc_Std_[XYZ] 	-- standard deviation of body acceleration, frequency domain
* fBodyAcc_MeanFreq_[XYZ] 	-- mean frequency of body acceleration, frequency domain
* fBodyAccJerk_Mean_[XYZ] 	-- mean body jerk, frequency domain
* fBodyAccJerk_Std_[XYZ] 	-- standard deviation of body jerk, frequency domain
* fBodyAccJerk_MeanFreq_[XYZ] 	-- mean frequency of body jerk, frequency domain
* fBodyGyro_Mean_[XYZ] 		-- mean body angular speed, frequency domain
* fBodyGyro_Std_[XYZ] 		-- standard deviation of body angular speed, frequency domain
* fBodyGyro_MeanFreq_[XYZ] 		-- mean frequency of body angular speed, frequency domain
* fBodyAccMag_Mean 		-- mean magnitude of body acceleration, frequency domain
* fBodyAccMag_Std 		-- standard deviation of magnitude of body acceleration, frequency domain
* fBodyAccMag_MeanFreq 	-- mean frequency of magnitude of body acceleration, frequency domain
* fBodyBodyAccJerkMag_Mean 	-- mean magnitude of body jerk, frequency domain
* fBodyBodyAccJerkMag_Std 	-- standard deviation of magnitude of body jerk, frequency domain
* fBodyBodyAccJerkMag_MeanFreq 	-- mean frequency of magnitude of body jerk, frequency domain
* fBodyBodyGyroMag_Mean 		-- mean magnitude of body angular speed, frequency domain
* fBodyBodyGyroMag_Std 		-- standard deviation of magnitude of body angular speed, frequency domain
* fBodyBodyGyroMag_MeanFreq 		-- mean frequency of magnitude of body angular speed, frequency domain
* fBodyBodyGyroJerkMag_Mean 		-- mean magnitude of body angular jerk, frequency domain
* fBodyBodyGyroJerkMag_Std 		-- standard deviation of magnitude of body anfular jerk, frequency domain
* fBodyBodyGyroJerkMag_MeanFreq 		-- mean frequency of magnitude of body angular jerk, frequency domain

Overall, there are 79 feature variable names in this Mean and Standard Deviation data set.  There are 30 participants and 6 activities being recorded through inertial sensors.
