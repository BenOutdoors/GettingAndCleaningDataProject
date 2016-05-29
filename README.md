# GettingAndCleaningDataProject
**_Ben K._**
## Overview
This file describes the operations in the *run_analysis.R script*. Essentially the script takes data from the **Human Activity Recognition Using Smartphones Dataset**[1] combines it, adds some descriptive names, and subsets out the mean and standard deviation variables. From the data set of means and stdDevs a new tidy data set that has only the average value of each variable, for each subject, for each activity is created. 
The original data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

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

Now the seperate data files have been combined into a single data frame, with descriptive names.  Next the 


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
