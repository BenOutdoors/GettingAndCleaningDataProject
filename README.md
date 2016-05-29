# GettingAndCleaningDataProject
**_Ben K._**
**_May 2016_**
## Overview
This file describes the operations in the *run_analysis.R script*. Essentially the script takes data from the **Human Activity Recognition Using Smartphones Dataset**[1] combines it, adds some descriptive names, and subsets out the mean and standard deviation variables. From the data set of means and stdDevs a new tidy data set that has only the average value of each variable, for each subject, for each activity is created. 
The original data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Libraries Used
```
library(dplyr)
library(data.table)
library(reshape2)
```

## Getting the Data
The original data is in a number of different files:
* activity_labels.txt     (numbers indicating the activity)
* features.txt               (column, i.e. “variable”, names for the “X” data files)
* subject_test.txt        (test subject identifier, i.e. one of the study volunteers)
* X_test.txt                  (the normalized observation data and some stats from observations like “mean”)
* y_test.txt                  (data file with another column for the X data files, the activity # 1 through 6)
* subject_train.txt       (test subject identifier, i.e. one of the study volunteers)
* X_train.txt                 (the normalized observation data and some stats from observations like “mean”)
* y_train.txt                 (data file with another column for the X data files, the activity # 1 through 6)

The first section of the script constructs a data set that combines the observations of all subjects in both the "test" group and the "train" group. Data set columns (variables) are named and the "activity" number codes are replaced with the descriptive activity labels
* 1 = WALKING
* 2 = WALKING_UPSTAIRS
* 3 = WALKING_DOWNSTAIRS
* 4 = SITTING
* 5 = STANDING
* 6 = LAYING
```
## This code block reads all the raw data and labels the columns (variables)
# read the feature & label data files
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
feature_vector <- as.character(features$V2)  #create a naming vector from "features"
# read the test data and label the columns
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = feature_vector)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
# read the train data and label the columns
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = feature_vector)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))

## add the subject and activity columns to the "X_***" data frames
# first take the numeric "y_***" observations and change "1-6" to character names (i.e. "1" = "WALKING")
for (i in 1:6) {y_test$activity <- gsub(i, activity_labels[i,2], y_test$activity)}
for (i in 1:6) {y_train$activity <- gsub(i, activity_labels[i,2], y_train$activity)}
# add the activity and subject data to X_*** data frames
X_test <- cbind(X_test, y_test, subject_test)
X_train <- cbind(X_train, y_train, subject_train)

## combine the two data frames with rbind.
X_all <- rbind(X_train, X_test) 
# X_all is the complete, merged data set of X_test and X_train. Includes data from all subjects
```
Now the seperate data files have been combined into a single data frame, with descriptive names.  Next the 




##References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
