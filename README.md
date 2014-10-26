GettingAndCleansingDataProject
==============================
This repo has been created for the cource project of Getting and Cleansing Data Coursera course. 

Site where the data was obtained for this project can be found here

[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data used for this project can be found here

[Samsung Data.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

The Repo Contains the following

1. run_analysis.R - R script that can be run to create a tidy data set as long as the Samsung data is in your working directory
2. CodeBook.md - Description of the variables
3. README.md

  
run_analysis.R script will perform the following:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
