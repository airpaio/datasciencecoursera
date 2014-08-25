### README.md

This repo contains the following files:
* **README.md**
* **CodeBook.md** 
a document which explains all of the transformations, variables, etc. that are dealt with throughout the process of cleaning the dataset.
* **run_analysis.R**
which transforms and cleans the dataset linked to below which represents data collected from the accelerometers from the Samsung Galaxy S smartphone.  The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>[^1]
* **sensorAggregatesMean.txt**
which is a cleaned up dataset that contains averages of each variable for each activity and each subject.

The script **run_analysis.R**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set named sensorAggregatesMean.txt with the average of each variable for each activity and each subject.


# Citations:

[^1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
