### README.md

This repo contains an R script
* run_analysis.R
which transforms and cleans the dataset linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The script

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set named sensorAggregatesMean.txt with the average of each variable for each activity and each subject.
