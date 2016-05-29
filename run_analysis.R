### Getting & Cleaning Data Class Project

## Notes
# be sure to setwd() to the directory above the data (i.e. the one that contains "UCI HAR...")

# used packages
library(dplyr)
library(data.table)
library(reshape2)

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

## Select only the "mean" and "std" data columns
# find the names that include "mean" or "std"
means_and_stds <- c("subject", "activity", grep("mean|std", colnames(X_all), value = TRUE))
# subset X_all to get just the mean and std data, order by "subject"
X_mean_std <- arrange(X_all[means_and_stds], subject)

## Using X_mean_std, produce a seperate data set with the average value of each variable, for each subject, for each activity
# first melt the data frame, then use dcast to create the variable averages
moltenX_mean_std <- melt(X_mean_std, id.vars = c("subject", "activity"))
tidy_X_avgs <- dcast(moltenX_mean_std, subject + activity ~ variable, mean)
# write the tidy data set to a file
write.table(tidy_X_avgs, file = "tidy_avgs_data.txt")


